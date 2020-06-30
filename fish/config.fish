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

# default key binding on fish
# 覚えて! https://bacchi.me/linux/terminal-tips/
fish_default_key_bindings

### plugins
fundle plugin 'jethrokuan/z'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'tuvistavie/fundle' --path 'completions'
fundle init
# fundle install
# fundle update
