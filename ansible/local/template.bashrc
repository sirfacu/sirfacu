# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# add Pulumi to the PATH
export PATH=$PATH:/home/sirfacu/.pulumi/bin
alias connect-gonzalitos='ssh root@10.112.3.110'
alias connect-tlaquepaque='ssh root@10.113.80.193'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# add Pulumi to the PATH
export RESET='\033[0m'    
export CYAN='\033[36m'    
export ROJO='\033[31m'    
export AMARILLO='\033[33m'
export VERDE='\033[32m'
export NEGRO='\033[30m'
alias python="python3"
alias pip="pip3" 
  
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FACU_REPO=/facu/vscode/

alias code-infra='code $FACU_REPO/INFRA/'
alias code-talent='code $FACU_REPO/TALENT_GROWTH/'
alias code-others='code $FACU_REPO/OTHERS/'
alias code-byond='code /byond'
alias code-keralty='code /keralty'
alias code-sirfacu='code $FACU_REPO/../sirfacu'


function vscode_start(){
    code-infra
    code-talent
    code-others
    code-sirfacu
}

function load-keys(){
    case $1 in
        prod)
            echo -e "${CYAN}Se cargaron exitosamente las llaves del ambiente $1${RESET}";
            ssh-add ~/.ssh/prod-*.pem
            ssh-add -l
            ;;
        dev)
            echo -e "${CYAN}Se cargaron exitosamente las llaves del ambiente $1${RESET}";
            ssh-add ~/.ssh/dev-*.pem
            ssh-add -l
            ;;
        test)
            echo -e "${CYAN}Se cargaron exitosamente las llaves del ambiente $1${RESET}";
            ssh-add ~/.ssh/test-*.pem
            ssh-add -l
            ;;
        poc)
            echo -e "${CYAN}Se cargaron exitosamente las llaves del ambiente $1${RESET}";
            ssh-add ~/.ssh/squad-poc-*.pem
            ssh-add -l
            ;;
        *)
            echo -e "${CYAN}Error: Ambiente no válido. Usa 'prod', poc, 'dev' o 'test'.${RESET}";
            ssh-add -l
            return 1
            ;;
    esac
}


###

export BITBUCKET_APP_KEY=9Y8Rv2z6Ax2zk87bWY
export BITBUCKET_APP_SECRET=5v7trKuPdp66aNRaaxZ6YJ7QsTrSanRc
export BITBUCKET_WORKSPACE=techubits

export CODEARTIFACT_NODE_REPOSITORY=ubits-npm
export CODEARTIFACT_DOMAIN=npm-repository-ubits
export CODEARTIFACT_DOMAIN_OWNER=824404647578
export CODEARTIFACT_AWS_DEFAULT_REGION=us-east-1


### encriptacion
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


function docker-login-ecr(){
    AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com
}


function docker-clean-images(){
    images_to_delete=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -v "gcr.io/k8s-minikube/kicbase")
    # Eliminar las imágenes obtenidas
    echo -e $ROJO"Imagenes a eliminar: "$images_to_delete $RESET
    if [ -n "$images_to_delete" ]; then
        docker rmi $images_to_delete
    else
        echo "No hay imágenes para eliminar."
    fi
}



export PATH=$PATH:/opt/gradle-7.6.1/bin:/usr/local/bin

alias k8s-start='minikube start --driver=docker'
alias k8s-start-rbac='minikube start --driver=docker --extra-config=apiserver.authorization-mode=RBAC'
alias k8s="kubectl"
alias connect-mongo-student='mongosh --host student-metrics.rds.ubitslearning.com:27017 --username ubitsadmin --password '5n8LfP=0D6n_9H*'   --authenticationDatabase admin'
alias connect-mongo-old-docdb='mongosh --host lms-docdb.rds.ubitslearning.com:27017 --username user_lms_document --password 'tnCTpGN1Q3GeL6P5D0mb'   --authenticationDatabase admin'
