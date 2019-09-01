#!/bin/bash

DOTFILES_PATH="$HOME/dotfiles"

is_osx() {
    os_name=$(uname)
    if [ "$os_name" = "Darwin" ]; then
        return 0
    else
        return 1
    fi
}

check_os() {
    is_osx
    if [ "$?" = 1 ]; then
        echo "This script is intended for macOS"
        exit 1
    fi
}

exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

download_dotfiles() {
    if [ -d "$DOTFILES_PATH" ]; then
        echo  "$DOTFILES_PATH: already exists"
        exit 1
    fi

    if exists "git"; then
        git clone https://github.com/ka-tsu-mo/dotfiles.git "$DOTFILES_PATH"
    elif exists "curl"; then
        curl -L https://github.com/ka-tsu-mo/dotfiles/archive/master.tar.gz | tar xz
        mv dotfiles-master "$DOTFILES_PATH"
    else
        echo "git or curl is required"
        exit 1
    fi
}

deploy() {
    ln -s "$DOTFILES_PATH/zsh/.zshenv" ~/.zshenv
}

setup_homebrew() {
    if exists xcode-select; then
        echo "xcode-select is already exists"
    else
        xcode-select --install
    fi
    if [ "$?" = 1 ]; then
        echo "failed to install command line tool"
        exit 1
    fi
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [ "$?" = 1 ]; then
        echo "failed to install Homebrew"
        exit 1
    fi
    brew update
    if [ "$?" = 1 ]; then
        echo "failed to update Homebrew"
        exit 1
    fi
    brew doctor
    if [ "$?" = 1 ]; then
        echo "not ready to brew"
        exit 1
    fi
}

setup_zsh() {
    brew install zsh
    if [ "$?" = 1 ]; then
        echo "failed to install zsh"
        exit 1
    fi
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$DOTFILES_PATH/zsh/.zprezto"
    git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
    chsh -s /usr/local/bin/zsh
}

setup_nvim() {
    gem install neovim
    pip2 install neovim
    pip3 install neovim
    npm -g install neovim
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
    sh ~/installer.sh ~/.cache/dein
    rm ~/installer.sh
}

install_quiver_free_trial() {
    cd /Applications
    curl -OL http://happenapps.com/downloads/QuiverFreeTrial.zip
    unzip QuiverFreeTrial.zip
    rmdir __MACOSX
    rm QuiverFreeTrial.zip
    cd
}

initialize() {
    if exists "brew"; then
        echo "Homebrew is already installed"
    else
        setup_homebrew
    fi
    brew install git
    setup_zsh
    cd "$DOTFILES_PATH"
    brew bundle
    rbenv install 2.6.4
    rbenv global 2.6.4
    source ~/.zshenv
    source "$DOTFILES_PATH/zsh/.zshrc"
    setup_nvim
    install_quiver_free_trial
}

main() {
    check_os
    download_dotfiles
    deploy
    initialize
}

main
