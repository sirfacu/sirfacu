export RESET='\033[0m'    
export CYAN='\033[36m'    
export ROJO='\033[31m'    
export AMARILLO='\033[33m'
export VERDE='\033[32m'

### encruptacion
export GPG_KEY_NAME=lower-envs-key
export PGP_ID=$(gpg --list-keys $GPG_KEY_NAME | grep pub -A 1 | grep -v pub)

function encryptFile(){
    secureFile=$1
    if [ "$2" == 'prod' ]; then
        export GPG_KEY_NAME=prod-key
    else
        export GPG_KEY_NAME=lower-envs-key
    fi
    export PGP_ID=$(gpg --list-keys $GPG_KEY_NAME | grep pub -A 1 | grep -v pub)
    sops --in-place  --output-type json --pgp  $PGP_ID --encrypt $secureFile
    if [ $? -eq 0 ]; then
        echo -e "$VERDE Success $RESET The file $CYAN $secureFile $RESET was encrypted correctly "
    else
        echo -e "$ROJO" "ERROR $RESET encrypting file $CYAN $secureFile $RESET Please check the logs"
    fi
}

#function to decrypt a file receive the path to the encrypted file 
function decryptFile(){
    secureFile=$1
    if [ "$2" == 'prod' ]; then
        export GPG_KEY_NAME=prod-key
    else
        export GPG_KEY_NAME=lower-envs-key
    fi
    export PGP_ID=$(gpg --list-keys $GPG_KEY_NAME | grep pub -A 1 | grep -v pub)
    sops --in-place --output-type json --decrypt $secureFile
    if [ $? -eq 0 ]; then
        echo -e "$VERDE" "Success $RESET The file $CYAN $secureFile $RESET was decrypted correctly "
    else
        echo -e "$ROJO" "ERROR $RESET Decrypting file $CYAN $secureFile $RESET Please check the logs"
    fi
    
}