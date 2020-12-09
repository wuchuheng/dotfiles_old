# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -ahl'
alias ll='ls -hl'
alias c='clear'
alias vi=' vim -u NONE -N'

export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim
# 配色方案
#PS1=' ${debian_chroot:+($debian_chroot)}\[\033[01;33;1m\]\u\[\033[00;32;1m\]@\[\033[01;36;1m\]\h\[\033[00;32;1m\]:\[\033[00;34;1m\]\w \[\033[01;32;1m\]\$ \[\033[01;37;1m\]'
#PATH=/www/wdlinux/phps/71/bin/:$PATH


#git配置
git config --global color.ui true
alias gitlogdetail='git log --graph --pretty=oneline --abbrev-commit';

#网络工具
alias myip='curl cip.cc'

#
#docker   镜像工具 
#

alias ab='docker run  --rm httpd:2.4.41-alpine  ab'
#alias nvim='docker run -it --rm -v $(pwd):/home/spacevim/src spacevim/spacevim'
#字典工具 DIC <keyowd>
alias dic='docker run -it --rm wuchuheng/dic:0.0.1 php ./test.php '
#export LESSCHARSET=utf-8
#export LC_ALL=zh_CN.UTF-8
