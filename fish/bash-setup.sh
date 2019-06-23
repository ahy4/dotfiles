#!/bin/bash

if [[ -z "$TMUX" ]]; then
  tmux new-session;
  exit;
fi


export EDITOR=nvim

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g "" | cat'

#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
