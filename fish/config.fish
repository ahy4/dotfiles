#!/bin/fish

### alias

if ! type pbcopy ^/dev/null >/dev/null
  alias pbcopy='xsel --clipboard --input'
end
if ! type pbpaste ^/dev/null >/dev/null
  alias pbpaste='xsel --clipboard --output'
end

alias g='git'
alias docker='sudo docker'
alias vim='nvim'
alias r='ranger'
alias c='clear'

### key bindings

# vi key binding on fish
fish_vi_key_bindings


### plugins
fundle plugin 'jethrokuan/z'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'tuvistavie/fundle' --path 'completions'
fundle init
# fundle install
# fundle update

### for fish prompt
function fish_mode_prompt; end # erase default fish_mode_prompt for vi

