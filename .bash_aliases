#!/bin/bash

alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias fpm.restart='php-fpm.stop && php-fpm.start'
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
alias find.port.occupant='find_port_occupant'
alias kill.port.occupant='kill_port_occupant'

alias docker.rm='docker rm $(docker ps -a -q) -f'
alias docker.rmi='docker rmi $(docker images -a -q) --force'
alias docker.rmv='docker volume rm $(docker volume ls -f dangling=true -q)'
alias docker.reset='dc-rm; dc-rmi; dc-volume-rm'


alias msql='mysql -u root -p'


alias git.st='git status'
alias git.fixup='git commit --fixup'
alias git.graph="git log --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(70,trunc)%s%Cgreen%aI' --graph"
alias git.review="git log --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(68,trunc)%s%Cgreen%aI' --reverse -p"
alias git.wip="git add . ; git commit -a -m WIP"
alias git.lg="git log --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(20)%cn%Cred%<(70,trunc)%s%Cgreen%aI'"
alias git.lgn="git log -n 10 --pretty='%C(auto)%<(40,trunc)%d%C(green)%h %Cblue%<(10,trunc)%cn%Cred%<(70,trunc)%s'"
alias git.append="git commit --amend --no-edit"
alias git.sync="git fetch -p && git rebase origin/master"
alias cbranch="git branch | grep \* | cut -d ' ' -f2"
alias git.current.branch="cbranch"

