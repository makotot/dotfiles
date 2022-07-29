#!/usr/bin/env bash

# Install brew
if ! (which brew > /dev/null 2>&1); then
  echo "install brew... 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade
brew tap homebrew/bundle
brew bundle --file Brewfile
brew cleanup
