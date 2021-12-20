# !/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# install brew
source ./brew/install.sh
# setup XCode
sudo xcodebuild -license accept
# setup iterm2
source ./iterm2/install.sh
# setup VSCode
source ./vscode/install.sh
# Change Git Default branch name
git config --global init.defaultBranch main
