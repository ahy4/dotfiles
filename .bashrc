#
# ~/.bashrc
#

if [[ -z "$TMUX" ]]; then
  tmux new-session;
  exit;
fi

exec bash -c "source ~/.config/fish/bash-setup.sh; exec fish"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
