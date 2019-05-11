# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Php
# export XDEBUG_IP="10.254.254.254"
# export PATH="$PATH:$HOME/.composer/vendor/bin"
# export PHP_IDE_CONFIG="serverName=local"
# export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=127.0.0.1 idekey=PHPSTORM"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH"

# Path
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="${HOME}/.config/yarn/global/node_modules/.bin${PATH:+:${PATH}}"
export PATH="$PATH:$GOPATH"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:/Users/BlackSheep/.local/bin"

export HOSTS="/etc/hosts"

#TRANSFER 
source ~/.transfer.sh

#GIT PROMPT
source ~/.git-prompt.sh
#source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \w$(__git_ps1)]\$ '

#GIT CONFIG
export EDITOR=vim
source ~/.bash_git

