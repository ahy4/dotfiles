#
# ~/.bashrc
#

if [[ -z "$TMUX" ]]; then
  tmux new-session;
  exit;
fi

exec bash -c "source ~/.config/fish/bash-setup.sh; exec fish"

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/ahy/n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/ahy/n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/ahy/n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/ahy/n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/ahy/n/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /home/ahy/n/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash