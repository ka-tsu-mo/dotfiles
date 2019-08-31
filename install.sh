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
    else
        echo "git or curl is required"
    fi
}

main() {
    check_os
    download_dotfiles
}

main
