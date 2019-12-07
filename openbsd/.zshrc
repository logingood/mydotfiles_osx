[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias vi="nvim"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ll="ls -al"

if [[ -s `which direnv` ]]; then
  eval "$(direnv hook zsh)"
fi

eval "$(~/.cargo/bin/starship init zsh)"
# Save history
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
setopt appendhistory

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/bin

source ~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
export CLICOLOR=1
#export LSCOLORS=ExfxcxdxbxGxDxabagacad
export GREP_COLOR="37;45"
export GREP_COLORS="mt=37;45"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
