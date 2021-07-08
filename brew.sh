#!/usr/bin/env bash

echo "Installing homebrew & relevant apps"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install other useful binaries
brew install git
# Let's properly set up python while we're here
if test ! $(which pyenv); then
    brew install pyenv
    # Assume we used this script to install pyenv just now
    echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
fi
LATEST_PYTHON_VER=3.9.6 # Latest as of 2020/07/07
pyenv install -s $LATEST_PYTHON_VER
pyenv global $LATEST_PYTHON_VER

# Install useful apps
brew install --cask firefox
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask notion
brew install --cask spotify
brew install --cask rectangle
brew install --cask itsycal

# Other things useful for work
#brew install picocom
#brew install --cask 1password
#brew install --cask docker
#brew install --cask slack

# Remove outdated versions from the cellar.
brew cleanup
