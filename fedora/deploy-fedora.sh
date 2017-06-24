#! /bin/bash
set -e

exec 2> /tmp/build.log

# TODO build my linux env

# update
# sudo yum -y update
# sudo yum -y upgrade

# install vim git
sudo yum -y install vim git wget

# disable selinux
sudo sed -i '/^SELINUX/s/enforcing/disabled/' /etc/selinux/config

# configure the calendar
sed -i 's/"default": "%A %B %e, %H:%M"/"default": "%Y-%m-%d  %H:%M  %A"/' ~/.cinnamon/configs/calendar@cinnamon.org/12.json
sed -i 's/"value": "%A %B %e, %H:%M"/"value": "%Y-%m-%d  %H:%M  %A"/' ~/.cinnamon/configs/calendar@cinnamon.org/12.json

# configure the menu
sed -i 's/"value": "Menu"/"value": false/' ~/.cinnamon/configs/menu@cinnamon.org/0.json

# change Chinese diretory to English

DIR="$HOME/下载"
if [[ -d $DIR ]];then
cat > ~/.config/user-dirs.dirs << EOF
XDG_DESKTOP_DIR="$HOME/desktop"
XDG_DOWNLOAD_DIR="$HOME/download"
XDG_TEMPLATES_DIR="$HOME/templates"
XDG_PUBLICSHARE_DIR="$HOME/public"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_VIDEOS_DIR="$HOME/videos"
EOF

mv ~/桌面 ~/desktop
mv ~/下载 ~/download
mv ~/模板 ~/templates
mv ~/公共 ~/public
mv ~/文档 ~/documents
mv ~/音乐 ~/music
mv ~/图片 ~/pictures
mv ~/视频 ~/videos
fi

# Add FZUG Repository
sudo dnf config-manager --add-repo=http://repo.fdzh.org/FZUG/FZUG.repo

# install sogoupinyin
sudo yum -y install sogoupinyin

# install sogoupinyin skin
# if [[ $? -eq 0 ]];then
    # cp ./package/skin/BlackGlory.ssf ~/.config/sogou-qimpanel/skin
    # sudo setsebool sogou_enable_homedirs=1
    # sogou-qimpanel ~/.config/sogou-qimpanel/skinBlackGlory.ssf
# fi

# download  add chrome repository
sudo wget https://repo.fdzh.org/chrome/google-chrome-mirrors.repo -P /etc/yum.repos.d/

# install chrome
# dnf install google-chrome-{stable,beta,unstable}
sudo yum -y install google-chrome-stable

# install libreoffice zh_hant zh_hans
sudo yum -y install libreoffice-langpack-zh-Han*

# install unar
sudo yum -y install unar

# install the theme
sudo tar -zxf ./package/theme/OSX-Arc-Darker-v1.3.9.tar.gz -C /usr/share/themes/ >> /dev/null
sudo tar -zxf ./package/icons/ComixCursors.tgz -C /usr/share/icons

# install xmind

# python virtualenv
sudo pip3 install virtualenv virtualenvwrapper

# Custom configuration
cat >> ~/.bashrc << EOF
alias rm='rm -i'
alias la='ls -A'
alias vi='vim'

# virtualenv
WORKON_HOME=~/.virtualenvs
PROJECT_HOME=~/workspace/pyproject
source /usr/bin/virtualenvwrapper.sh

# tmux
[ -z "$TMUX" ] && export TERM=xterm-256color
# ps1
# export PS1="\[\e[33;1m\]\u \[\e[36;1m\]\W\[\e[34;1m\] > \[\e[0m\]"
# show git branch
export color_prompt=yes
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [[ "$color_prompt" == yes ]];then
  PS1='\[\e[33;1m\]\u \[\e[36;1m\]\W\[\e[01;31m\]$(parse_git_branch)\[\e[34;1m\] > \[\e[0m\]'
else
  PS1='\[\e[33;1m\]\u \[\e[36;1m\]\W\[\e[34;1m\] > \[\e[0m\]'
fi
unset color_prompt
EOF



