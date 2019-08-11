export ZDOTDIR="$HOME/dotfiles/zsh"

# avoid loading /etc/profile (not to execute /usr/libexec/path_helper)
setopt no_global_rcs

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.rbenv/bin:$PATH"
typeset -U path PATH
