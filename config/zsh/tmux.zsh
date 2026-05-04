# resume tmux sessions,
tmux-attach() { tmux new-session -A -s ${1:-main}; }

# zsh/tmux window title integration
function tmux_title() {
  if [[ `pwd -P` =~ $HOME/([^/]+)/.* ]]; then
    tmux rename-window "${match[1]}"
  else
    tmux rename-window "$(basename "`pwd`")"
  fi
}
if [[ ! -z "$TMUX" ]]; then
  precmd_functions+=(tmux_title)
fi

# Auto-start tmux main session locally.
if [[ -z "$SSH_CONNECTION" && -z "$TMUX" ]]; then
  if ! tmux list-sessions &>/dev/null; then
    tmux-attach
  fi
fi

