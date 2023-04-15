#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! $(which brew)
then
  echo "Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
#--with-default-names

brew install wget
brew install python3
#brew install postgresql

### Install Java 8#####
#brew tap AdoptOpenJDK/openjdk
#brew cask install adoptopenjdk/openjdk/adoptopenjdk8

# Install MongoDb community edition 
#brew tap mongodb/brew
#brew install mongodb-community@3.6

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

brew tap homebrew/cask-fonts
brew cask install font-iosevka
brew cask install font-fira-code

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install dns2tcp
brew install nmap
brew install socat
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.

# Install other useful binaries.
brew install bats
brew install git
# brew install git-lfs
brew install neovim
#brew install gpg
brew install imagemagick 
brew install wifi-password
brew install autojump
brew install fzf
#brew install curl
brew install htop
brew install httpie
brew install howdoi
brew install tldr
brew install yarn
brew install jq
brew install screenfetch
brew install neofetch
brew install m-cli
brew install pgcli
brew install mackup
brew install lynx
brew install pv
brew install rsync
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install youtube-dl
brew install nginx
brew install tmux
brew install reattach-to-user-namespace

# Installs Casks
brew tap homebrew/cask-cask

## Apps I use
brew cask install firefox # Firefox
#brew cask install homebrew/cask-versions/firefox-nightly # Nightly
brew cask install google-chrome #Chrome
#brew cask install homebrew/cask-versions/google-chrome-canary # Chrome Canary
brew cask install docker
#brew cask install virtualbox
brew cask install grammarly
#brew cask install sourcetree
#brew cask install geekbench
brew cask install iterm2
brew cask install postman
brew cask install skype
brew cask install slack
brew cask install spotify
#brew cask install visual-studio-code
#brew cask install jetbrains-toolbox

brew cask install gpg-suite # Useful for automatic GPG Signing

brew tap cjbassi/gotop
brew install gotop

### Install oh-my-zsh unattended###
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/denysdovhan/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt"
ln -s "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"

### Install nvim plugin manager ###
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install pynvim --user

### Install Tmux plugin manager ###
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew services start nginx
# Remove outdated versions from the cellar.
brew cleanup
