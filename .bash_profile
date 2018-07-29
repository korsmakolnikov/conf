export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
source ~/.bash_aliases
source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
