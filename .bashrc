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
	dataPath=~/.local/share/nvim
	statePath=~/.local/state/nvim
	# 启动nvim前
	function beforeLanchNvim() {
		# 初始化目录
		function initPath() {
			if [[ ! -e "$1/.." ]]; then # 创建用于存放配置的目录
				mkdir -p "$1/.."
			fi
			if [[ -e $1 ]]; then # 删除已经存在的配置
				rm -rf $1
			fi
		}
		initPath $configPath # 始化配置目录
		initPath $dataPath   # 初始化数据目录
		initPath $statePath  # 初始化状态目录
	}
	# web编辑器
	function wvim() {
		export LUA_PATH="$HOME/dotfiles/vim/web/config/lua/?.lua;$HOME/dotfiles/vim/web/config/?.lua;;"
		beforeLanchNvim
		ln -s $rootPath/vim/web/data $dataPath     # nvim数据目录
		ln -s $rootPath/vim/web/config $configPath # nvim配置
		ln -s $rootPath/vim/web/state $statePath   # state配置
		# --maximized
		$neovide --frame=buttonless $@
	}
	# nvim编辑器
	function tvim() {
		export LUA_PATH="$HOME/dotfiles/vim/web/config/lua/?.lua;$HOME/dotfiles/vim/web/config/?.lua;;"
		beforeLanchNvim
		ln -s $rootPath/vim/web/data $dataPath     # nvim数据目录
		ln -s $rootPath/vim/web/config $configPath # nvim配置
		ln -s $rootPath/vim/web/state $statePath   # state配置
		# --maximized
		nvim $@
	}
fi

alias ipcn="curl myip.ipip.net"
alias ip="curl ip.sb"

# 设置http https代理
proxyStatus=0

proxySockIp=127.0.0.1
proxySockPort=7890
function setProxy() {
	proxySocket=${proxySockIp}:${proxySockPort}
	proxyHttp=$proxySocket
	proxyHttps=$proxySocket
	export all_proxy=socks5://${proxySocket}
	proxyStatus=1
	export http_proxy=http://${proxySocket} && export https_proxy=http://${proxySocket}
	# git config --global https.proxy http://${proxyIp} && git config --global https.proxy https://${proxyIp}
	git config --global http.proxy socks5://${proxySocket}
	if [[ hasNpm ]]; then
		npm config set proxy http://${proxySocket}
		npm config set https-proxy http://${proxySocket}
	fi
	echo "set proxy successfully"
}
setProxy

# 解除http https代理
function unSetProxy() {
	proxyStatus=0
	git config --global --unset http.proxy && git config --global --unset https.proxy
	unset http_proxy
	unset https_proxy
	unset all_proxy
	echo "Unset proxy successfully"
	if [[ hasNpm ]]; then
		# npm config delete proxy
		# npm config delete https-proxy
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

export PATH=$PATH:$ROOT_DIR/bin
