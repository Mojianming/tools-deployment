#!/bin/bash
set -e
# set -x

# exec &> install-vim.log

# check linux distribution
# DIST=$(lsb_release -i|cut -f2|tr '[A-Z]' '[a-z'])
DIST=$(cat /etc/*release|grep -E "^ID="|awk -F= '{print $2}'|tr '[A-Z]' '[a-z]')

if [ ${DIST} == 'fedora' -o ${DIST} == 'centos' -o ${DIST} == 'redhat' ];then
    echo -e "linux distribution is \e[32;31m${DIST}\e[0m"
    CMD="yum"
elif [ ${DIST} == 'ubuntu' -o ${DIST} == 'debian' -o ${DIST} == 'mint' ];then
    echo -e "linux distribution is \e[32;31${DIST}\e[0m"
    CMD='apt-get'
else
    echo -e "\e[32;31mcan't not recognize your system distribution!\e[0m"
    exit 1
fi

# check vim
vim --version &> /dev/null
if [[ $? -eq 0 ]];then
    echo -e -n "\e[32;33mWARNING: you don't have installed vim, install vim through the Repositories [Y/N]: \e[0m"
    while true
    do
        read -n 1 choice
        echo
        case ${choice} in
            Y|y)
                echo -e "\e[32;33minstalling vim ...\e[0m"
                sudo ${CMD} -y install vim gvim
                break
                ;;
            N|n)
                echo -e "\033[32;31mscript exit, please install vim first.\033[0m"
                exit 1
                ;;
            *)
                echo -e -n "\e[32;33m请输入'Y'或者'N': \e[0m"
        esac
    done
fi

# install dependent package
if [[ ${CMD} == 'yum' ]];then
    sudo ${CMD} -y install git curl ctags npm ack xdg-utils
    sudo ${CMD} -y install automake gcc gcc-c++ kernel-devel cmake
    sudo ${CMD} -y install python-devel python3-devel
elif [[ ${CMD} == 'apt-get' ]];then
    sudo ${CMD} -y install git curl ctags npm ack-grep xdg-utils
    sudo ${CMD} -y install build-essential cmake
    sudo ${CMD} -y install python-dev python3-dev
else
    echo -e "\e[32;31mcan't not recognize your system distribution!\e[0m"
    exit 1
fi


# copy .vimrc file to home dir
cp ./.vimrc ~/.

# config for markdown plugin
sudo npm -g install instant-markdown-d

# install autopep8 and jedi
sudo pip install autopep8 jedi pep8

# install plug manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugin
vim +PlugInstall +qall

YCM="${HOME}/.vim/plugged/YouCompleteMe"
# compile YCM
if [[ -d ${YCM} ]];then
    cd ${YCM}
    ./install.py
else
    echo "YouCompleteMe plugin is not in list!"
fi

echo -e "\e[42;34mdeploy finished!\e[0m"
