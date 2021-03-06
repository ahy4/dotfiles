#!/bin/bash

if [[ -z "$TMUX" ]]; then
  tmux new-session;
  exit;
fi


export EDITOR=nvim

export FZF_DEFAULT_COMMAND='rg -l --hidden --ignore .git -g "" | cat'

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export GOPATH=$HOME/go

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$GOPATH/bin"
