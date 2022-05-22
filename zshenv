ZDOTDIR=~/.dotfiles/config/zsh

# OS-specific settings
case "$OSTYPE" in
  darwin*)
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export CLICOLOR=1
  ;;
  linux*)
    # ...
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    export CLICOLOR=1
  ;;
esac

# EDITOR
if (( $+commands[nvim] )); then
  export EDITOR=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
else
  export EDITOR=vi
fi
alias e=$EDITOR
