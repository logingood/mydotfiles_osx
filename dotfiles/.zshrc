

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

if [[ -s `which direnv` ]]; then
  eval "$(direnv hook zsh)"
fi


[ -d /usr/local/sbin ] && PATH=/usr/local/sbin:$PATH

[ -f ~/.secrets.zsh ] && source ~/.secrets.zsh
[ -f ~/.local.zsh ] && source ~/.local.zsh
