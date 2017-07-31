#!/bin/bash

# set -x

GIT=`which git`
PATHOGEN="https://github.com/tpope/vim-pathogen"
VIM_PLUGINS=( 
  https://github.com/vim-scripts/indentpython.vim
  https://github.com/tomasr/molokai
  https://github.com/python-mode/python-mode
  https://github.com/fatih/vim-go.git
  https://github.com/lepture/vim-jinja
  https://github.com/hashivim/vim-terraform.git
)

if [ $? -ne 0 ]
then
  echo "git is not available" && exit 1
fi

if [ ! -x $GIT  ]
then
  echo "git is not executable" && exit 1
fi

get_zim(){
  git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim
	setopt EXTENDED_GLOB
	for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
		user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
		touch ${user_file}
		( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
	done
}

get_fzf(){
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

get_pathogen() {
  mkdir -p ~/.vim/bundle 
  git clone $PATHGONE ~/.vim
}

get_dotfiles() {
  git clone https://github.com/murat1985/mydotfiles_osx ~/mydotfiles
}

symlink_dotfiles(){
  DOT_FILES=( `ls ~/mydotfiles/dotfiles` )
  for dot in ${DOT_FILES[@]}; do
    ln -s ~/mydotfiles/dotfiles/$dot ~/$dot
  done
}


get_vim_plugins() {
  cd ~/.vim/bundle
  for plugin in ${VIM_PLUGINS[@]}; do
    git clone $plugin
  done
}

get_ssh_keys(){
  if [ -f ~/Dropbox/ac24dc966bc7/ecb74017c0cd0a5fcf56 ]
  then
    openssl enc -aes-256-cbc -d -in ~/Dropbox/ac24dc966bc7/ecb74017c0cd0a5fcf56 | tar xz
  else
    echo "Dropbox is not available, skipping"
  fi
}

run_all(){
  get_zim
  get_fzf
  get_pathogen
  get_vim_plugins
  get_dotfiles
  symlink_dotfiles
  get_ssh_keus
}

run_all
