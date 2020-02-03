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

    if [ "$isloadBashrc" = '' ]
    then
        
        echo "if [  -e "`pwd`"/.bashrc ]" >> ~/.bashrc 
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
        if [ "$isloadzshrc" = '' ]
        then
        echo "if [  -e "`pwd`"/.bashrc ]" >> ~/.zshrc 
        echo "then" >> ~/.bashrc;
        echo "    source $zshFile;" >> ~/.zshrc ;
        echo "fi" >> ~/.zshrc
            source ~/.zshrc;
        fi
    fi
    #安装vim 配置
    if [ ! -e  ./.vim/authload/plug.vim ]
    then 
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    #安装dotfiles/.vimrc
    ln -s `pwd`/.vimrc ~/.vimrc;
    #安装dotfiles/.vim
    ln -s `pwd`/.vim ~/.vim;
    #安装dotfiles/.viminfo
    ln -s `pwd`/.viminfo ~/.viminfo;
    #安装.ssh
    #ln -s `pwd`/.ssh ~/.ssh;
    vim +PlugInstall! +q "+source ~/.vimrc"
}


#####################################################
#	               卸载 
#####################################################
function delete()
{
    unlink ~/.vim;
    unlink ~/.vimrc;
    unlink ~/.viminfo;
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
             ?)
                echo -e "argument error; please type of \e[1;32m sh ./start.sh  -h \e[0m to show detail info" ; exit ;;
         esac
done

