# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# If you need to have postgresql@11 first in your PATH run:
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

# For compilers to find postgresql@11 you may need to set:
#export LDFLAGS="-L/usr/local/opt/postgresql@11/lib"
#export CPPFLAGS="-I/usr/local/opt/postgresql@11/include"

#For pkg-config to find postgresql@11 you may need to set:
#export PKG_CONFIG_PATH="/usr/local/opt/postgresql@11/lib/pkgconfig"

# zsh-completition
fpath=(/usr/local/share/zsh-completions $fpath)
# auto-suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# google
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

fpath=(~/.zsh-completione $fpath)
autoload -Uz compinit && compinit -i

eval "$(direnv hook zsh)"

# Path to your oh-my-zsh installation.
export ZSH=/Users/alex/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context root_indicator history dir_writable dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='007'
POWERLEVEL9K_DIR_HOME_FOREGROUND='006'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='007'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump brew common-aliases docker encode64 git-extras jsontools macos screen sublime sudo wd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias reload="exec ${SHELL} -l"
alias flush_dns="sudo killall -HUP mDNSResponder"
alias show_files='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hide_files='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias osxrestartfinder="killall -KILL Finder"
alias osxrestartdock="killall -KILL Dock"
alias osxrestartmenu="killall -KILL SystemUIServer"
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias sshrsa="ssh-add ~/.ssh/*_rsa"

alias brewup="brew update && brew upgrade && brew cask upgrade && brew cleanup"

# Dummy
alias shrug="printf '¯\_(ツ)_/¯' | pbcopy"
alias flipt="printf '(╯°□°)╯︵ ┻━┻' | pbcopy"
alias fight="printf '(ง'̀-'́)ง' | pbcopy"
alias docker_remove_stopped='docker rm $(docker container ls -aq --filter status=exited)'

export PATH="/Users/alex/.local/bin:$PATH"

###-tns-completion-start-###
if [ -f /Users/alex/.tnsrc ]; then
  source /Users/alex/.tnsrc
fi
###-tns-completion-end-###

# ASDF
. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

export ERL_AFLAGS="-kernel shell_history enabled"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
export PATH="$PYENV_ROOT/shims:${PATH}"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Kubernetes

alias k="kubectl"

# # Postgres Operator

# export PATH=/Users/alex/.pgo/pgo:$PATH
# export PGOUSER=/Users/alex/.pgo/pgo/pgouser
# export PGO_CA_CERT=/Users/alex/.pgo/pgo/client.crt
# export PGO_CLIENT_CERT=/Users/alex/.pgo/pgo/client.crt
# export PGO_CLIENT_KEY=/Users/alex/.pgo/pgo/client.key
# export PGO_APISERVER_URL='https://127.0.0.1:8443'
# export PGO_NAMESPACE=pgo

# Elixir

source ~/.mix_autocomplete.zsh

# JAVA

source ~/.asdf/plugins/java/set-java-home.zsh
