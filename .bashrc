# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -ahl'
alias ll='ls -hl'
alias c='clear'
alias vi='vim -u NONE -N'

ROOT_DIR=~/dotfiles

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
export LC_ALL=en_US.UTF-8

function hasNvim()
{
    if ! command -v nvim &> /dev/null

    then
	    return false
    else
	    return true
    fi
	
}
function hasvim()
{
    if ! command -v vim &> /dev/null

    then
	    return false
    else
	    return true
    fi
	
}
vimTool=""
if [[ hasNvim ]] 
then
    vimTool="nvim"
elif [[ hasvim ]]
then
    vimTool="vim"
fi
if [[  ${#vimTool} > 0 ]] 
then
    alias webvim="$vimTool -u ~/dotfiles/.webvimrc"
    alias nn="$vimTool -u ~/dotfiles/.newWebVimrc"
    alias newvim="$vimTool -u ~/dotfiles/newWebVimrc.vim"
    alias govim="$vimTool -u ~/dotfiles/golangVimrc.vim"
    alias nv="$vimTool -u ~/dotfiles/newWebVimrc.vim"
    alias gv="$vimTool -u ~/dotfiles/golangVimrc.vim"
fi

alias ipcn="curl myip.ipip.net"
alias ip="curl ip.sb"

# 设置http https代理
proxyIp=127.0.0.1:7890
proxyStatus=0
function setProxy()
{
    proxyStatus=1
    export http_proxy=http://${proxyIp} && export https_proxy=http://${proxyIp}
    git config --global https.proxy http://${proxyIp} && git config --global https.proxy https://${proxyIp}
    echo "set proxy successfully"
}
setProxy

# 解除http https代理
function unSetProxy()
{
    proxyStatus=0
    git config --global --unset http.proxy && git config --global --unset https.proxy;
    unset http_proxy;unset https_proxy;unset all_proxy;
    echo "Unset proxy successfully";
}


#check internet speed
function speed() 
{
    if [[ $proxyStatus == 0 ]];
    then
        setProxy
        curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py > tmp
        unSetProxy
    else
        curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py > tmp
    fi
    cat tmp | python3
    rm -f tmp
}
#eheck the internet speed for proxy
function speedP() 
{
    if [[ $proxyStatus == 0 ]];
    then
        setProxy
        curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3
        unSetProxy
    else
        curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3
    fi
}


export BAT_THEME="Dracula"

alias flushMacDns='sudo killall -HUP mDNSResponder'

alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

export PATH=$PATH:$ROOT_DIR/bin
