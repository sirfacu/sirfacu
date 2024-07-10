export GPG_KEY_NAME=ubits-sops
export PGP_ID=$(gpg --list-keys $GPG_KEY_NAME | grep pub -A 1 | grep -v pub)
export baseFile="definitions/paramsSecure.json"
export tempDir="definitions/tmp"
export RESET='\033[0m'
export CYAN='\033[36m'
export ROJO='\033[31m'
export VERDE='\033[32m'
export fileExist=""
export fileToValidate=""
export TEAMS_REGEX="^team-[0-9]{3}$"

#function to decrypt a file receive the path to the file to be encrypted and the PGP KEY id
function encryptFile(){
    secureFile=$1
    sops --encrypt --in-place --pgp $PGP_ID $1
    if [ $? -eq 0 ]; then
        echo -e "$VERDE Success $RESET The file $CYAN $secureFile $RESET was encrypted correctly "
    else
        echo -e "$ROJO" "ERROR $RESET encrypting file $CYAN $secureFile $RESET Please check the logs"
    fi
}

#function to decrypt a file receive the path to the encrypted file 
function decryptFile(){
    secureFile=$1
    sops --in-place --output-type json --decrypt $secureFile
    if [ $? -eq 0 ]; then
        echo -e "$VERDE" "Success $RESET The file $CYAN $secureFile $RESET was decrypted correctly "
    else
        echo -e "$ROJO" "ERROR $RESET Decrypting file $CYAN $secureFile $RESET Please check the logs"
    fi
    
}
#function to restore the files once the pulumi execution is done
function restoreFiles(){
    rm -rf definitions/tmp
    rm -rf "Pulumi.$TEAM.yaml"
    echo -e "$VERDE" "Removing tmp files and Pulumi.$TEAM.yaml file $RESET"
}
# this function decrypt an already file encrypted with sops
# this will create as many files as configs<=>APPNAME exist in the paramsSecure.json
# in the folder tmp-files ending with APP_NAME-conf.json the APPNAME can't be use "-"
# because parameter store doesn't accept it.
# all the parameters will saved in that file and a line to create the parameter store will
# include in the index.ts file.
# then that json file is formating to one line and passed to the pulumi config set --secret
function exec_deploy(){
    mkdir $tempDir
    decryptFile $baseFile
    export configs=$(jq 'keys | .[]' $baseFile | sed 's/\"//g')
    TEXT=$(echo -e "$VERDE" "Don't Forget check if this(these) line(s) exists in your$RESET $ROJO index.ts$RESET file")
    echo -e "$CYAN Obtained the follow parameters store: $configs $RESET"
    for nomParStore in $configs; do
        echo -e "$CYAN Creating json definitions . . . $RESET"
        fileJsonName="$tempDir/$nomParStore-conf.json"
        ps_keys=$(jq ".$nomParStore | keys | .[]" $baseFile )
        echo -e "$ROJO VALUES $RESET For the PS $nomParStore the recovery value is $ps_keys"
        echo "{" > $fileJsonName
        for ps_kname in $ps_keys; do
            secureAttribute=$(jq ".$nomParStore.$ps_kname" $baseFile)
            echo "$ps_kname:$secureAttribute," >> $fileJsonName
        done
        sed -i '$ s/,$//' $fileJsonName
        echo "}" >> $fileJsonName
        export json_string=$(cat $fileJsonName | jq -c -r .)
        pulumi config set --secret $nomParStore $json_string
        TEXT=$TEXT"\n"$(echo -e "$CYAN     const "$nomParStore"_ps = new parameterStore(\""$nomParStore"\"); $RESET")
    done
    encryptFile $baseFile
    echo -e "$CYAN $TEXT"
    echo -e "$VERDE DONE! $RESET everything is ready to execute your pulumi up "
    
}

function validateConfigFiles(){
    fileToValidate=$1
    if [ -f $fileToValidate ]; then
        fileExist="true"
        return 0
    else 
        fileExist="false"
        return 0
    fi
    
}

#this function receive the team and environment as parameter to create the Pulumi.{env}.yaml file
function initPS(){
    set -a
    if [ $# -eq 0 ]; then
        echo -e "$ROJO USAGE $RESET this function receive the team $CYAN (team-100,team-101) $RESET or staging as parameter to create the Pulumi.{env}.yaml file"
        return 1
    fi
    TEAM=$1
    TEAM=$(echo "$TEAM" | tr '[:upper:]' '[:lower:]')
    fileConf="Pulumi.$TEAM.yaml"
    validateConfigFiles "$fileConf"
    if [ -z "$TEAM" ]; then
        echo -e "$ROJO Error:$RESET missing value for environment"
        return 1
    elif [ "$TEAM" == "prod" ]; then
          echo -e "$ROJO Error:$RESET For prod use already existing file"
          sleep 5
          return 1
    fi
        if [ $fileExist == "true" ]; then
            echo -e "$ROJO Error:$RESET The file already exist please use existing file and execute directly $ROJO exec_deploy$RESET command"
            sleep 5
            return 1
        else
            cp Pulumi.template $fileConf
            sed -i "5s/.*/    - aws-creds-$TEAM/" $fileConf
        fi
    set +a
}

