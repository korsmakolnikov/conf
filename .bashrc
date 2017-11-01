source ~/.bash_aliases
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin:$HOME/.cargo/env"
export PATH="${HOME}/.config/yarn/global/node_modules/.bin${PATH:+:${PATH}}"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/go/bin"
export PHP_IDE_CONFIG="serverName=local"
export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=127.0.0.1 idekey=PHPSTORM"
export HOSTS="/etc/hosts"
#TRANSFER 
source ~/.transfer.sh
#VAGRANT
export VAGRANT_DEFAULT_PROVIDER=parallels

export GTAGSLABEL=pygments

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
