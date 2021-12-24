# !/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#set -euo pipefail
#IFS=$'\n\t'

# install brew
if ! command -v brew &> /dev/null
then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update
brew upgrade

# install via brew
brew bundle --file=./brew/Brewfile

brew cleanup
brew doctor
