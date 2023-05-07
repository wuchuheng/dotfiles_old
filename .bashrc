# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -ahl'
alias ll='ls -hl'
alias c='clear'

ROOT_DIR=~/dotfiles

export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim
# 配色方案
#PS1=' ${debian_chroot:+($debian_chroot)}\[\033[01;33;1m\]\u\[\033[00;32;1m\]@\[\033[01;36;1m\]\h\[\033[00;32;1m\]:\[\033[00;34;1m\]\w \[\033[01;32;1m\]\$ \[\033[01;37;1m\]'
#PATH=/www/wdlinux/phps/71/bin/:$PATH

#git配置
git config --global color.ui true
alias gitlogdetail='git log --graph --pretty=oneline --abbrev-commit'

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

function hasNvim() {
    if ! command -v nvim &>/dev/null; then
        return false
    else
        return true
    fi

}
function hasvim() {
    if ! command -v vim &>/dev/null; then
        return false
    else
        return true
    fi

}
function hasNpm() {
    if ! command -v npm &>/dev/null; then
        return false
    else
        return true
    fi

}
vimTool=""
if [[ hasNvim ]]; then
    vimTool="nvim"
elif [[ hasvim ]]; then
    vimTool="vim"
fi
rootPath=~/dotfiles
if [[ ${#vimTool} > 0 ]]; then
    neovide=/Applications/Neovide.app/Contents/MacOS/neovide
    alias nn="$vimTool -u ~/dotfiles/.newWebVimrc"
    alias newvim="$vimTool -u ~/dotfiles/newWebVimrc.vim"
    alias govim="$vimTool -u ~/dotfiles/golangVimrc.vim"
    alias nv="$vimTool -u ~/dotfiles/newWebVimrc.vim"
    alias gv="$vimTool -u ~/dotfiles/golangVimrc.vim"
    configPath=~/.config/nvim
    cocPath=~/.config/coc
    dataPath=~/.local/share/nvim
    statePath=~/.local/state/nvim
    # 启动nvim前
    function beforeLanchNvim() {
        # 初始化目录
        function initPath() {
            parentDir="$(dirname "$1")"
            if [[ ! -e $parentDir ]]; then # 创建用于存放配置的目录
                mkdir -p $parentDir
            fi
            if [[ -e $1 || -L $1 ]]; then # 删除已经存在的配置
                rm -rf $1
            fi
        }
        initPath $configPath # 始化配置目录
        initPath $dataPath   # 初始化数据目录
        initPath $statePath  # 初始化状态目录
        initPath $cocPath    # 初始coc插件目录
    }
    # 初始化Coc
    function initCoc() {
        # 加载依赖
        if [[ ! -e $1 ]]; then
            currentPath=$(pwd)
            parentDir="$(dirname "$1")"
            cd $parentDir
            pnpm install
            if [[ $currentPath != $(pwd) ]]; then
                cd -
            fi
        fi
    }
    # web编辑器
    function wvim() {
        prefix="$rootPath/vim/web"
        export LUA_PATH="$prefix/config/lua/?.lua;$prefix/config/?.lua;;"
        beforeLanchNvim
        ln -s $prefix/data $dataPath                # nvim数据目录
        ln -s $prefix/config $configPath            # nvim配置
        ln -s $prefix/state $statePath              # state配置
        ln -s $prefix/coc $cocPath                  # coc插件配置
        initCoc $prefix/coc/extensions/node_modules #初始化Coc
        # --maximized
        $neovide --frame=buttonless $@
    }
    # cvim编辑器
    function cvim() {
        prefix="$rootPath/vim/cocvim"
        export LUA_PATH="$prefix/config/?.lua;;"
        beforeLanchNvim
        ln -s $prefix/data $dataPath                # cvim数据目录
        ln -s $prefix/config $configPath            # cvim配置
        ln -s $prefix/state $statePath              # state配置
        ln -s $prefix/coc $cocPath                  # coc插件配置
        initCoc $prefix/coc/extensions/node_modules #初始化Coc
        # --maximized
        # nvim $@
        $neovide --frame=buttonless $@
    }
fi

alias ipcn="curl myip.ipip.net"
alias ip="curl ip.sb"

# 设置http https代理
proxyStatus=0

proxySockIp=127.0.0.1
proxySockPort=8080
function setProxy() {
    # export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    # export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;export ALL_PROXY=socks5://127.0.0.1:1080
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    proxySocket=${proxySockIp}:${proxySockPort}
    # proxyHttp=$proxySocket
    # proxyHttps=$proxySocket
    # export all_proxy=socks5://${proxySocket}
    # proxyStatus=1
    # export http_proxy=http://${proxySocket} && export https_proxy=http://${proxySocket}
    # # git config --global https.proxy http://${proxyIp} && git config --global https.proxy https://${proxyIp}
    # git config --global http.proxy socks5://${proxySocket}
    # if [[ hasNpm ]]; then
    #     # npm config set proxy http://${proxySocket}
    #     # npm config set https-proxy http://${proxySocket}
    # fi
    # export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153
    # echo "set proxy successfully"
}
# setProxy

# 解除http https代理
function unSetProxy() {
    proxyStatus=0
    git config --global --unset http.proxy && git config --global --unset https.proxy
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "Unset proxy successfully"
    if [[ hasNpm ]]; then
        npm config delete proxy
        npm config delete https-proxy
    fi
}

#check internet speed
function speed() {
    if [[ $proxyStatus == 0 ]]; then
        setProxy
        curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py >tmp
        unSetProxy
    else
        curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py >tmp
    fi
    cat tmp | python3
    rm -f tmp
}
#eheck the internet speed for proxy
function speedP() {
    if [[ $proxyStatus == 0 ]]; then
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
alias cc='open -a "Google Chrome"'

export PATH=$PATH:$ROOT_DIR/bin
export PATH=$PATH:/Users/wuchuheng/gradle/gradle-7.6/bin

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export ANDROID_NDK_HOME=/Users/$HOME/Library/Android/sdk/ndk-bundle

source ~/dotfiles/notification.sh


function ke() {
	 kill -9 $(ps -ax  | grep Eudic  | awk 'NR == 1 {print $1}' )
	 kill -9 $(ps -ax  | grep LightPeek_en  | awk 'NR == 1 {print $1}' )
}

function vr() {
ssh ubuntu@wuchuheng.com <<END
    sudo su;
    v2ray restart;
    exit;
    exit;
END
}

alias rustbook='rustup docs --book'

