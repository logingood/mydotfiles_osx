#!/bin/zsh

DOTFILES="mydotfiles_osx"
DROPBOX_PATH="Dropbox/ac24dc966bc7/ecb74017c0cd0a5fcf56"
GIT=`which git`
PATHOGEN="https://github.com/tpope/vim-pathogen"
VIM_PLUGINS=( \
  https://github.com/airblade/vim-gitgutter \
  https://github.com/saltstack/salt-vim.git \
  https://github.com/tpope/vim-fugitive \
  https://github.com/vim-scripts/indentpython.vim \
  https://github.com/tomasr/molokai \
  https://github.com/python-mode/python-mode \
  https://github.com/fatih/vim-go.git \
  https://github.com/lepture/vim-jinja \
  https://github.com/hashivim/vim-terraform.git )

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
  git clone $PATHOGEN ~/.vim
  mkdir -p ~/.vim/bundle
}

get_dotfiles() {
  git clone https://github.com/logingood/$DOTFILES ~/$DOTFILES
}

symlink_dotfiles(){
  cd ~/
  DOT_FILES=( `ls ~/$DOTFILES/dotfiles/.*` )
  for dot in ${DOT_FILES[@]}; do
    ln -s $dot ~/$(echo $dot | cut -d '/' -f 6) || true
  done
}

install_ycmd() {
  cd ~/.nvim/bundle/YouCompleteMe
  ./install.py --clang-completer --go-completer
}

get_vim_plugins() {
  cd ~/.vim/bundle
  for plugin in ${VIM_PLUGINS[@]}; do
    git clone $plugin || true
  done
}

get_ssh_keys(){
  cd /Users/$USER
  cp /Users/$USER/$DROPBOX_PATH /tmp/
  SSH_KEYS=/tmp/$(echo $DROPBOX_PATH | cut -d '/' -f 3)
  echo $SSH_KEYS
  test -f ${SSH_KEYS} || (echo "SSH keys not found"; exit 1)
  openssl enc -aes-256-cbc -d -in $SSH_KEYS | tar xz
  rm $SSH_KEYS
}

run_all(){
#  get_zim
  get_fzf
#  get_pathogen
#  get_vim_plugins
#  get_dotfiles
#  symlink_dotfiles
#  get_ssh_keys
}

run_all

source ~/.zshrc
