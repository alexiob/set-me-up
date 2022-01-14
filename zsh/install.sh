# !/bin/bash

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# install nerd fonts
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy my zsh settings
cp ./zsh/.zshrc ~/.zshrc
chmod -R go-w '/opt/homebrew/share'

# install zsh theme
git clone https://github.com/romkatv/powerlevel10k.git /Users/$USER/.oh-my-zsh/themes/powerlevel10k

# starship setup
mkdir -p ~/.config && cp ./zsh/starship.toml ~/.config
