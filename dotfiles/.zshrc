#
# User configuration sourced by interactive shells
#


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

# Save history
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
setopt appendhistory

export EDITOR=nvim
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/Library/Python/3.7/bin

export LS_COLORS="$(vivid generate molokai)"
source ~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mmukhtarov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mmukhtarov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mmukhtarov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mmukhtarov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export GO111MODULE=""
export GOSUMDB="off"
export GONOPROXY=""
export GOPRIVATE=""
