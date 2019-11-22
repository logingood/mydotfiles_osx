#
# User configuration sourced by interactive shells
#

export PATH=$HOME/macports/bin:$HOME/macports/sbin:$PATH
export MANPATH=$HOME/macports/share/man:$MANPATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias vi="nvim"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ls="gls --color"
alias ll="ls -al"

if [[ -s `which direnv` ]]; then
  eval "$(direnv hook zsh)"
fi

eval "$(starship init zsh)"
export GPG_TTY=`tty`
export SAVEHIST=1000000
export HISTFILE=~/.zhistory
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/bin

export LS_COLORS="$(vivid generate molokai)"
source ~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
