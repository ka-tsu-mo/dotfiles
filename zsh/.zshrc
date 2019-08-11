# Created by newuser for 5.5.1

# 256 color emulater
export TERM="xterm-256color"

# java
alias javac='javac -J-Dfile.encoding=utf-8'
alias java='java -Dfile.encoding=utf-8'

:<<'BREW_WARNING'
$ brew doctor
  Warning: "config" scripts exist outside your system or Homebrew directories.
  `./configure` scripts often look for *-config scripts to determine if
  software packages are installed, and what additional flags to use when
  compiling and linking.
BREW_WARNING
alias brew='PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin brew'

if which rbenv > /dev/null; then 
  eval "$(rbenv init -)";
fi

# prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# ls -> lsd
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lt='lsd --tree'

# theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh
