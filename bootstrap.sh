#!/usr/bin/env bash

# Needs to be moved to config management tool

PACKAGES=(
    arp-scan
    git
    hub
    jq
    gpg
    tmux
    vim
    wget
)

CASKS=(
    dropbox
    google-chrome
    iterm2
    keybase
    skype
    slack
    vagrant
    virtualbox
)

FONTS=(
    font-inconsolidata
    font-roboto
    font-clear-sans
)

RUBY_GEMS=(
    bundler
)

PYTHON_PACKAGES=(
    ipython
    virtualenv
    virtualenvwrapper
)

echo "Starting bootstrapping"

install_brew(){
# Check for Homebrew, install if we don't have it
  if test ! $(which brew); then
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_base_tools(){
  # Update homebrew recipes
  brew update

  # Install GNU core utilities (those that come with OS X are outdated)
  brew tap homebrew/dupes
  brew install coreutils
  brew install gnu-sed --with-default-names
  brew install gnu-tar --with-default-names
  brew install gnu-indent --with-default-names
  brew install gnu-which --with-default-names
  brew install gnu-grep --with-default-names

  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
  brew install findutils

  # Install zsh
  brew install zsh
}

install_packages(){
  echo "Installing packages..."
  brew install ${PACKAGES[@]}

  echo "Cleaning up..."
  brew cleanup

  echo "Installing cask..."
  brew install caskroom/cask/brew-cask
}

install_casks(){
  echo "Installing cask apps..."
  brew cask install ${CASKS[@]}

  echo "Installing fonts..."
  brew tap caskroom/fonts
}

install_fonts(){
  brew cask install ${FONTS[@]}
}

install_python_packages(){
  echo "Installing Python packages..."
  sudo pip install ${PYTHON_PACKAGES[@]}
}

install_ruby_gems() {
  echo "Installing Ruby gems"
  sudo gem install ${RUBY_GEMS[@]}
}

echo "Configuring OSX..."

# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable "natural" scroll
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Creating folder structure..."
[[ ! -d Code ]] && mkdir Code
[[ ! -d Projects ]] && mkdir Projects

# Configure Dropbox first
# echo "Installing dotfiles and vim plugins.."
# ./install_dotfiles.sh

echo "Bootstrapping complete"
