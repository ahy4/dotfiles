#!/bin/fish

# alias
if ! type pbcopy ^/dev/null >/dev/null
  alias pbcopy='xsel --clipboard --input'
end
alias g='git'
alias docker='sudo docker'
alias vim='nvim'

# vi key binding on fish
fish_vi_key_bindings

