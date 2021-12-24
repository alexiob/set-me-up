# !/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#set -euo pipefail
#IFS=$'\n\t'

# Install updates, xcode
sudo softwareupdate --all --install --force
sudo softwareupdate --install-rosetta
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install

# install brew
source ./brew/install.sh

# setup XCode
sudo xcodebuild -license accept

# setup iterm2
source ./iterm2/install.sh

# setup zsh
source ./zsh/install.sh

# setup VSCode
source ./vscode/install.sh

# setup ssh
source ./ssh/install.sh

# Change Git Default branch name
git config --global init.defaultBranch main
git config --global user.name Alessandro Iob
git config --global user.email alessandro.iob@gmail.com

# MacOS specifics

# show Library folder in finder
chflags nohidden ~/Library
# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES
# Show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar in finder
defaults write com.apple.finder ShowStatusBar -bool true
