# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Php
# export XDEBUG_IP="10.254.254.254"
# export PATH="$PATH:$HOME/.composer/vendor/bin"
# export PHP_IDE_CONFIG="serverName=local"
# export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=127.0.0.1 idekey=PHPSTORM"

# GOLANG
export GOPATH="${HOME}/www/go"
# export GOROOT="$(brew --prefix golang)/libexec" # try if this works.
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

#Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Path
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="${HOME}/.config/yarn/global/node_modules/.bin${PATH:+:${PATH}}"
export PATH="$PATH:/Users/BlackSheep/.local/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/BlackSheep/.asdf/installs/rebar/3.11.1:$PATH"

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
export PS1='[\w$(__git_ps1)]\$ '

#GIT CONFIG
export EDITOR=vim
source ~/.bash_git

#NVM CONFIG
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
