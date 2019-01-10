#!/bin/bash

alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart='mysql.stop && mysql.start'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
alias nginx.logs.phpmyadmin.error='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.error.log'
alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'
alias ll='ls -lah'
alias dc-rm='docker rm $(docker ps -a -q) -f'
alias dc-rmi='docker rmi $(docker images -a -q) --force'
alias dc-volume-rm='docker volume rm $(docker volume ls -f dangling=true -q)'
alias dc-clean-all='dc-rm; dc-rmi; dc-volume-rm'
alias my-sql='mysql -u root -p'
alias prn-aliases='cat ~/.bash_aliases'
alias git-st='git status'
alias git-fixup='git commit --fixup'
alias git-graph="git log --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(70,trunc)%s%Cgreen%aI' --graph"
alias git-lg="git log --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(70,trunc)%s%Cgreen%aI'"
alias git-review="git log --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(68,trunc)%s%Cgreen%aI' --reverse -p"
alias git-wip="git add . ; git commit -a -m WIP"
alias jabba_gw='ssh -N -L 8000:internal-jabba-gateway-284692762.us-east-1.elb.amazonaws.com:80 ubuntu@gw-stage-us-east-1.adespresso.com'
alias ae-start="docker/init.sh --no-docker-sync"
alias edit-alias="vim ~/.bash_alias; source ~/.bash_alias"
alias ae-login="bash --init-file docker/bash_profile -i"
alias rebar="rebar3"
alias git-st="git status"
alias git-lgn="git log -n 10 --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(70,trunc)%s%Cgreen%aI'"
alias cbranch="git branch | grep \* | cut -d ' ' -f2"
alias git-append="git commit --amend --no-edit"

