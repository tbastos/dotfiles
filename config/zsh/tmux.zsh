# resume tmux sessions,
tmux-attach() { tmux new-session -A -s ${1:-main}; }

# Auto-start tmux main session locally.
if [[ -z "$SSH_CONNECTION" && -z "$TMUX" ]]; then
  if ! tmux list-sessions &>/dev/null; then
    tmux-attach
  fi
fi

