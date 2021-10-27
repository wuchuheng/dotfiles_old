#!/bin/bash

# @ author      wuchuheng
# @ email       root@wuchuheng
# @ date 	2018-12-23

#####################################################
#	               帮助说明 
#####################################################
function help()
{
    echo '
  __| | ___ | |_ / _(_) | ___  ___ 
 / _` |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/
';
     echo  -e  "\
     \t -i         install   dotfiles  \n\
     \t -v         show the number of version   \n\
     \t -d         uninstall dotfiles  \
"; 
} 


#####################################################
#	               版本号 
#####################################################
function  version()
{
    echo -e "1.0 ";
}

function hasNode()
{
    if ! command -v node &> /dev/null

    then
	    return false
    else
	    return true
    fi
	
}

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

#####################################################
#	               安装 
#####################################################
##
# @info 回收垃圾
#
##
function recieveTrash()
{
    target=$1;
    if [ -e ~/$target ]
    then
        if [[ \
               `file ~/$target  | awk '{print $2 $3}'` != 'symboliclink' \
               && `file  ~/$target | awk '{print $NF}' | grep  'dotfiles/$target'` != "dotfiles/$target" \
        ]] 
        then	
            mv -f ~/$target ./trash/; 
        fi
    fi 
}


## 
# @info 开始安装
#
##
function install()
{
    if [[ ! hasNode ]]
    then
        echo "Please install node"
	exit
    fi
    #新建垃圾回收桶,回收已经有的文件
    if [ ! -e './trash' ]
    then
	mkdir ./trash;
    fi
    #创建.viminfo
    if [ ! -e ./.viminfo ]
    then 
       touch  .viminfo;	
    fi
    #回收.vimrc 
    recieveTrash ".vimrc"
    #回收.vim
    recieveTrash ".vim"
    #回收.viminfo
    recieveTrash ".viminfo"
    #回收.ssh
    #recieveTrash ".ssh"
    #安装词典工具
    #git clone  https://github.com/wuchuheng/dic.git tool/dic;
    bashFile=`pwd`"/.bashrc";
    isloadBashrc=`cat ~/.bashrc | grep "$bashFile"`;
    if [ "$isloadBashrc" == '' ]
    then
        echo "if [ -e "`pwd`"/.bashrc ]" >> ~/.bashrc 
        echo "then" >> ~/.bashrc;
        echo "    source $bashFile;" >> ~/.bashrc ;
        echo "fi" >> ~/.bashrc
        source ~/.bashrc;
    fi
    # 载入到 ~/.zshrc
    zshFile=`pwd`"/.bashrc";
    if [  -e ~/.zshrc ]
    then
        isloadZshrc=`cat ~/.zshrc | grep "$zshFile"`;
        if [ -z "$isloadZshrc" ]
        then
            echo "if [ -e "`pwd`"/.bashrc ]" >> ~/.zshrc 
            echo "then" >> ~/.zshrc;
            echo "    source $zshFile;" >> ~/.zshrc ;
            echo "fi" >> ~/.zshrc
            source ~/.zshrc;
        fi
    fi
    # 添加coc配置文件
    if [ ! -e '~/.config/nvim/coc-settings.json' ]
    then
        mkdir -p ~/.config/nvim
       ln -s `pwd`/coc-settings.json ~/.config/nvim/coc-settings.json 
    fi

    if [ ! -e '~/.config/coc' ]
    then
        mkdir -p ~/.config
	ln -s `pwd`/coc ~/.config/
	cd `pwd`/coc/extensions && npm install
	cd ../..
    fi
    #安装nvim 配置
    if [[ hasNvim && ! -e ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim ]]
    then
	    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    ln -s `pwd`/.vimrc ~/.config/nvim/init.vim
    elif [[ hasVim &&  ! -e  ./.vim/authload/plug.vim ]]
    then 
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s `pwd`/.vimrc ~/.vimrc;
    fi

    #安装dotfiles/.vim
    ln -s `pwd`/.vim ~/.vim;
    #安装dotfiles/.viminfo
    ln -s `pwd`/.viminfo ~/.viminfo
    #安装.ssh
    #ln -s `pwd`/.ssh ~/.ssh;
    vim +PlugInstall! +q "+source ~/.vimrc"
    
}


#####################################################
#	               卸载 
#####################################################
function delete()
{
    rm -rf ~/.vim;
    rm -rf ~/.vimrc;
    rm -rf ~/.viminfo;
    rm -rf ~/.config/coc
    rm -rf ~/.config/nvim/coc-settings.json
    rm -rf ~/.config/nvim/init.vim
    if [[ -e ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim ]]
    then
        rm -f ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim 
    fi
    for element in `ls -a trash`
    do
        if [[ $element != '.' && $element != '..' ]]
        then 
	    mv trash/${element} ~/;
        fi
    done
}
##
# @info 长选项
#
##
while getopts "vhid" arg
do
        case $arg in
             v)
                 version;;
             h)
                help;; 
             i)
                install;; 
             d)
                delete;; 
         esac
done

if [ $# -eq 0 ]
then
        help
fi
