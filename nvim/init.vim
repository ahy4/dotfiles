"*****************************************************************************
"",Dein.vim
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

  " CoC.nvim
  call dein#add('neoclide/coc.nvim', { 'merge': 0, 'build': './install.sh nightly' })

  " Typescript
  " :CocInstall coc-tsserver coc-tslint-plugin
  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')


  " Mustache (handlebars) syntax highlight
  call dein#add('mustache/vim-mustache-handlebars')

  " json
  " :CocInstall coc-json

  " PHP
  " :CocInstall coc-phpls

  " surround.vim
  "call dein#add('tpope/vim-surround')

  " lexima.vim
  call dein#add('cohama/lexima.vim')

  " sneak.vim
  call dein#add('justinmk/vim-sneak')

  " winresizer.vim
  call dein#add('simeji/winresizer')

  " comment gcc, gci, gcui
  call dein#add('tyru/caw.vim')

  " Vaffle filer
  call dein#add('ahyahya/vaffle.vim')

  " Multi Cursor
  call dein#add('terryma/vim-multiple-cursors')

  " markdown
  call dein#add('tpope/vim-markdown')
  call dein#add('dhruvasagar/vim-table-mode')

  " Find and Replace
  call dein#add('brooth/far.vim')

  " colorscheme
  call dein#add('arcticicestudio/nord-vim')


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

"" Colorscheme
colorscheme nord

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" * で勝手に次の結果に移動しないようにする
noremap * *``

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

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"*****************************************************************************
"" Plugin settings
"*****************************************************************************

"*** fzf ***

" files
nnoremap <Leader>sf :FZF<CR>

" ripgrep search (needs install)
nnoremap <Leader>ss :Rg<CR>

" buffer
nnoremap <Leader>sb :Buffers<CR>

" execute :Fardo
nnoremap <Leader>sr :Fardo<CR>

" v:oldfiles
nnoremap <Leader>sh :History<CR>

" command list
nnoremap <Leader>sc :Commands<CR>

" normal mode keybindings
nnoremap <Leader>sm :Maps<CR>

" search current word
nnoremap <Leader>sw "ayiw:Rg <C-r>a<CR>

"*** coc.nvim ***
nnoremap <Leader>sd :call CocAction('jumpDefinition', 'tab drop')<CR>zz

nnoremap <Leader>sl :CocList<CR>

"*** Git Gutter***

" Refresh on Save
nnoremap <Leader>fs :w<CR>:GitGutter<CR>:echo "saved"<CR>

" Disable Keybind
let g:gitgutter_map_keys = 0

"*** ranger ***

" disable default keybind
let g:ranger_map_keys = 0

nnoremap <Leader>fr :tab sp<CR>:Ranger<CR>

"*** Vaffle ***

" open current directory
"nnoremap <Leader>fv :<C-u>execute "Vaffle" . expand('%:p:h')<CR>
nnoremap <Leader>fv :<C-u>execute "e " . expand('%:p:h')<CR>


" open current working directory
nnoremap <Leader>fw :Vaffle<CR>:call vaffle#toggle_hidden()<CR>

"*** sneak.vim ***

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map s <Plug>SneakNext
map S <Plug>SneakPrevious

"*** markdown table ***
let g:table_mode_corner="|"

"*** far.vim ***
set lazyredraw
set regexpengine=1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on

"" 相対行表示
set number relativenumber
"" toggle
nnoremap <Leader>tn :set number! relativenumber!<CR>

"" paste toggle
nnoremap <Leader>tp :set paste!<CR>

"" show tab and trail space
set list
set listchars=tab:>-,trail:-

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
noremap <Leader>- :<C-u>split<CR><C-w>j
noremap <Leader>= :<C-u>split<CR><C-w>j
noremap <Leader>\| :<C-u>vsplit<CR><C-w>l
noremap <Leader><Bslash> :<C-u>vsplit<CR><C-w>l

"" Move Pane
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

"" Vimrc 編集用
nnoremap <Leader>ve :tabe ~/workspace/dotfiles/nvim/init.vim<CR>
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

"" 折返し行の移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap T :tabnew<CR>

nnoremap <Leader>qq :q<CR>

"" Force fxxk
nnoremap <Leader>fSS :w !sudo -S tee > /dev/null %<CR>

"" Set working directory
nnoremap <leader>tw :lcd %:p:h<CR>

"" Buffer nav
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bd :bd<CR>
noremap <leader>br :bufdo e<CR>
noremap <leader>bc :checktime<CR>

"" Cursor
nnoremap <C-j> }zz
nnoremap <C-k> {zz
vnoremap <C-j> }zz
vnoremap <C-k> {zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap H ^
nnoremap L $

"" Replace
nnoremap gS :<C-u>%s///g<Left><Left><Left>

"" Replace by far
vnoremap gS "hy:Far <C-r>h  **/*.ts --source=rg<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

"" Replace Current Word
nnoremap gs :%s/\<<C-r><C-w>\>//g<Left><Left>

"" Replace Selected Word
vnoremap gs "hy:%s/<C-r>h//gc<left><left><left>

"" Search Selected Word
vnoremap // "hy/<C-r>h<CR>N

"" Replace line up/down
" https://stackoverflow.com/questions/15296393/line-swapping-in-vim
" クソコードそのうちなおす
nnoremap <Leader>K :execute (line(".")) . 'm' . (line(".") - 1) . '\|' . (line(".") - 1) . 'm' . (line("."))<CR>k
nnoremap <Leader>J :execute (line(".")) . 'm' . (line(".") + 1) . '\|' . (line(".") + 1) . 'm' . (line("."))<CR>

"" ESC
inoremap jk <Esc>
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <Leader>qq <C-\><C-n>:close<CR>

"" nohl
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

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

"" continuously indent
vnoremap > >gv
vnoremap < <gv

"" use register `a`.
"" example: mdiw mp
nnoremap m "a
vnoremap m "a

"*****************************************************************************
"" Multicorsor
"*****************************************************************************

let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

" multiedit per word (repeat: .)
nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

" multiedit by macro (repeat: enter)
nnoremap cm :call SetupCR()<CR>*``qz
nnoremap cM :call SetupCR()<CR>#``qz
nnoremap cl :call SetupCR()<CR>/$<CR>Nqz
nnoremap cL :call SetupCR()<CR>?$<CR>Nqz

vnoremap <expr> cm ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cM ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" multipaste
function! MultiPaste()
  let lineContent=split(@", "\n")
  let lineNo=line(".")
  execute (lineNo) . ',' . (lineNo+len(lineContent)-1) . 's/$/\=remove(lineContent, 0)/'
  let @/ = ""
endfunction

nnoremap cp :call MultiPaste()<CR>
