#
# User configuration sourced by interactive shells
#

export PATH=$HOME/macports/bin:$HOME/macports/sbin:$PATH
export MANPATH=$HOME/macports/share/man:$MANPATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aws.sh ] && source ~/.aws.sh

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

# Save history
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
setopt appendhistory

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/bin

export LS_COLORS="$(vivid generate molokai)"
source ~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mmukhtarov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mmukhtarov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mmukhtarov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mmukhtarov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
