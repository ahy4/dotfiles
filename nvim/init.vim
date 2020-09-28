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

  " CoC.nvim
  call dein#add('neoclide/coc.nvim', {
   \ 'merge': 0,
   \ 'build': './install.sh nightly' })
  " CocInstall coc-json coc-phpls coc-tabnine coc-tsserver coc-tslint-plugin
  " coc-deno

  " Typescript
  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')

  " Mustache (handlebars) syntax highlight
  call dein#add('mustache/vim-mustache-handlebars')

  " surround.vim
  call dein#add('tpope/vim-surround')

  " lexima.vim
  call dein#add('cohama/lexima.vim')

  " sneak.vim
  call dein#add('justinmk/vim-sneak')

  " winresizer.vim
  call dein#add('simeji/winresizer')

  " auto resize panes
  call dein#add('camspiers/lens.vim')

  " comment gcc, gci, gcui
  call dein#add('tyru/caw.vim')

  " Vaffle filer
  " call dein#add('ahyahya/vaffle.vim')
  call dein#add('cocopon/vaffle.vim')

  " markdown
  call dein#add('tpope/vim-markdown')
  call dein#add('dhruvasagar/vim-table-mode')

  " Find and Replace
  call dein#add('brooth/far.vim')

  " colorscheme
  call dein#add('arcticicestudio/nord-vim')

  call dein#add('ap/vim-buftabline')

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
nnoremap <Leader>sg :GFiles<CR>

" ripgrep search (needs install)
nnoremap <Leader>ss :Rg<CR>

command! -bang -nargs=* Rg
 \ call fzf#vim#grep(
 \   'rg --column --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
 \   fzf#vim#with_preview(), <bang>0)

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
" <Plug>(coc-definition)
nnoremap <Leader>sd :call CocAction('jumpDefinition')<CR>zz
nnoremap <Leader>st :call CocAction('jumpTypeDefinition')<CR>zz
"nnoremap <Leader>st <Plug>(coc-type-definition)
nnoremap <Leader>si <Plug>(coc-implementation)
"nnoremap <Leader>sr <Plug>(coc-references)

nnoremap <Leader>sl :CocList<CR>
nnoremap gl :CocCommand eslint.executeAutofix

"*** Git Gutter***

" Refresh on Save
" TODO: autocmd FileWritePost に書き換える
nnoremap <Leader>fs :w<CR>:GitGutter<CR>:echo "saved"<CR>

" Disable Keybind
let g:gitgutter_map_keys = 0

"*** ranger ***

" disable default keybind
let g:ranger_map_keys = 0

nnoremap <Leader>fr :Ranger<CR>

"*** Vaffle ***

" open current directory
"nnoremap <Leader>fv :<C-u>execute "Vaffle" . expand('%:p:h')<CR>
nnoremap <Leader>fv :<C-u>execute "e " . expand('%:p:h')<CR>:call vaffle#toggle_hidden()<CR>


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
nnoremap <Leader>tt :terminal<CR>i

" window最小横幅
set winminwidth=10

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
nnoremap <Leader>ve :e ~/workspace/dotfiles/nvim/init.vim<CR>
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

"" 折返し行の移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"" Quit
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>qa :qall<CR>

autocmd VimLeave * call SaveSess()
" autocmd VimEnter * nested call RestoreSess()
nnoremap <Leader>tr :call RestoreSess()<CR>

set sessionoptions-=options  " Don't save options

"" Set working directory
nnoremap <leader>tw :lcd %:p:h<CR>

"" Buffer nav
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
noremap <leader>bd :bd<CR>
noremap <leader>br :bufdo e<CR>
noremap <leader>bD :call DeleteHiddenBuffers()<CR>
" noremap <leader>bD :bufdo bd<CR>
noremap <leader>bc :checktime<CR>

function DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

"" Cursor
nnoremap <C-j> }
nnoremap <C-k> {
vnoremap <C-j> }
vnoremap <C-k> {
nnoremap <C-d> <C-d>
nnoremap <C-u> <C-u>
noremap H ^
noremap L $

"" Move Capital
" https://stackoverflow.com/questions/7958309/how-do-i-move-to-the-next-capital-letter
" https://vim.fandom.com/wiki/Moving_through_camel_case_words
nnoremap gw /\u<CR>:<C-u>nohlsearch<CR>
nnoremap gb ?\u<CR>:<C-u>nohlsearch<CR>
vnoremap gw /\u<CR>:<C-U>nohlsearch<CR>v`>
vnoremap gb ?\u<CR>:<C-U>nohlsearch<CR>v`>o

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

"" Disable visualbell
set noerrorbells visualbell t_vb=
autocmd VimEnter * set visualbell t_vb=

"" Disable danger command
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

"" Move visual block
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

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

"" paste with auto indent
nnoremap <C-p> ]p

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
  let lineContent=split(@*, "\n")
  let lineNo=line(".")
  execute (lineNo) . ',' . (lineNo+len(lineContent)-1) . 's/$/\=remove(lineContent, 0)/'
  let @/ = ""
endfunction

nnoremap cp :call MultiPaste()<CR>


"*****************************************************************************
"" Disabled
"*****************************************************************************
""" Session
"fu! SaveSess()
"  execute 'mksession! ' . getcwd() . '/.session.vim'
"endfunction
"
"fu! RestoreSess()
"  if filereadable(getcwd() . '/.session.vim')
"    execute 'source ' . getcwd() . '/.session.vim'
"    if bufexists(1)
"      for l in range(1, bufnr('$'))
"        if bufwinnr(l) == -1
"          exec 'sbuffer ' . l
"        endif
"      endfor
"    endif
"  endif
"endfunction


