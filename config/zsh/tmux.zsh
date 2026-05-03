# Auto-start tmux main session locally.
if [[ -z "$SSH_CONNECTION" && -z "$TMUX" ]]; then
  if ! tmux list-sessions &>/dev/null; then
    tmux new-session -A -s main
  fi
fi
