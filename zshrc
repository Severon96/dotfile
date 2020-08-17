#
# Author: Marco Quinten <splittydev@gmail.com>
# Description: A simple zshrc to aid productivity
#

brewInstall() {
   echo Installing $1
   brew cask install $1
}

# download antigen if needed
if [[ ! -a $HOME/antigen.zsh ]]; then
    echo Antigen not found! Installing...
    curl -L git.io/antigen > $HOME/antigen.zsh
    echo Antigen ready!
fi

# source antigen
source $HOME/antigen.zsh

# use the oh-my-zsh framework
antigen use oh-my-zsh

# full git productivity suite
antigen bundle git

# node support
antigen bundle npm
antigen bundle npx
antigen bundle nvm

# python support
antigen bundle python
antigen bundle pip

# container support
antigen bundle docker
antigen bundle vagrant

# vim ctrl-z auto-unsuspend
antigen bundle fancy-ctrl-z

# esc-esc auto-sudo
antigen bundle sudo

# command-not-found handler
antigen bundle command-not-found

# syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# huge completion suite
antigen bundle zsh-users/zsh-completions

# fish-like autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# the best theme ever, period
antigen theme half-life

# magic
antigen apply

# aliases
if type "bat" > /dev/null; then alias cat='bat'; fi

alias efimount='sudo diskutil mount disk0s1'
alias configedit='cd /Users/doctor/Documents/git/ProperTree; ./ProperTree.command /Volumes/EFI/EFI/OC/config.plist;'

if ! command -v brew &> /dev/null
then 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brewInstall iterm2

brewInstall alfred

brewInstall kext-updater

brewInstall google-chrome

brewInstall visual-studio-code

brewInstall sublime-merge

brewInstall spotify

brewInstall discord

brewInstall franz

brewInstall deepl

brewInstall intellij-idea

fi


