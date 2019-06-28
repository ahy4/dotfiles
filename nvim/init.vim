"*****************************************************************************
"" Dein.vim
"*****************************************************************************

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Dein manages itself
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Fuzzy Finder
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Git
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

 " Ranger dependency for neovim
  call dein#add('rbgrouleff/bclose.vim')

  " Ranger
  call dein#add('francoiscabrol/ranger.vim')

  " Typescript
  call dein#add('neoclide/coc.nvim', { 'merge': 0, 'build': './install.sh nightly' })
  " and :CocInstall coc-tsserver coc-tslint-plugin
  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')

  " surround.vim
  "call dein#add('tpope/vim-surround')

  " lexima.vim
  call dein#add('cohama/lexima.vim')

  " sneak.vim
  call dein#add('justinmk/vim-sneak')

  " winresizer.vim
  call dein#add('simeji/winresizer')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"*****************************************************************************
"" Basic Setup
"*****************************************************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to space
let mapleader = "\<Space>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" * で勝手に次の結果に移動しないようにする
noremap * *N

set fileformats=unix,dos,mac

"" デフォルトシェルを設定する
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"" コマンドラインの補完をさせる
set wildmenu
set wildmode=full

"" undo 履歴をもつ
if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile
  set undolevels=1000
endif

"" 矩形選択のとき、文字が存在しない場所も選択可能にする
set virtualedit=block

"*****************************************************************************
"" Plugin settings
"*****************************************************************************

"*** fzf ***

" files
nnoremap <Leader>ff :FZF<CR>

" ag search (needs install)
nnoremap <Leader>fa :Ag<CR>

" ripgrep search (needs install)
nnoremap <Leader>fr :Rg<CR>

" buffer
nnoremap <Leader>fb :Buffers<CR>

" v:oldfiles
nnoremap <Leader>fh :History<CR>

" command list
nnoremap <Leader>fc :Commands<CR>

" normal mode keybindings
nnoremap <Leader>fm :Maps<CR>

"*** Git Gutter***

" Refresh on Save
nnoremap <Leader>fs :w<CR>:GitGutter<CR>:echo "saved"<CR>

"*** ranger ***

" disable default keybind
let g:ranger_map_keys = 0

" set new keybind
nnoremap <Leader>ft :Ranger<CR>

"*** sneak.vim ***

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on

"" 相対行表示
set number relativenumber
"" toggle
nnoremap <Leader>Tn :set number! relativenumber!<CR>

"" カーソル行ハイライト
set cursorline

set mousemodel=popup
set t_Co=256

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

nnoremap n nzzzv
nnoremap N Nzzzv

" terminal emulation
nnoremap <leader>tt :tabnew<CR>:terminal<CR>i


""" Status Line
" https://shapeshed.com/vim-statuslines/
let g:last_update_timestamp_git_branch = 0
let g:last_update_git_branch_name = ''
function! GitBranch()
  if strftime('%s') > g:last_update_timestamp_git_branch + 60 " clear cache by 60 sec
    let g:last_update_timestamp_git_branch = strftime('%s')
    let g:last_update_git_branch_name = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endif
  return g:last_update_git_branch_name
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '  ' . l:branchname . ' ' : ''
endfunction

set statusline=
set statusline+=%#CursorColumn#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>

"" Vimrc 編集用
nnoremap <Leader>ve :e ~/workspace/dotfiles/nvim/init.vim<CR>
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap T :tabnew<CR>

nnoremap <Leader>qq :q<CR>

"" Force fxxk
nnoremap <Leader>fSS :w !sudo -S tee > /dev/null %<CR>

"" Set working directory
nnoremap <leader>fw :lcd %:p:h<CR>

"" Buffer nav
noremap <leader>bp :bp<CR>
noremap <leader>bp :bn<CR>
noremap <leader>bd :bd<CR>

"" Cursor
nnoremap <C-j> }zz
nnoremap <C-k> {zz
nnoremap <C-d> <C-d>
nnoremap <C-u> <C-u>zz
nnoremap H ^
nnoremap L $

"" Replace
nnoremap <Leader>sr :<C-u>%s///g<Left><Left><Left>
vnoremap <Leader>sr :s///g<Left><Left><Left>

"" ESC
inoremap jk <Esc>
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <Leader>qq <C-\><C-n>:close<CR>

"" nohl
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

"" Line Add
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Disable danger command
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Tab by single press
nnoremap < <<
nnoremap > >>

