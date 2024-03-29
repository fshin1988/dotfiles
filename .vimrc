" setting
" Vimの内部文字コード
set encoding=utf-8
" ファイル編集時の文字コード
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボードにコピー可能にする
set clipboard=unnamed,autoselect
" grep時にQuickfixを開く
autocmd QuickFixCmdPost *grep* cwindow
" 改行コードの認識
set fileformats=unix
" メッセージを英語で表示
language C

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
" set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
" 120桁目に印をつける
set colorcolumn=120
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライト
syntax enable

" Tab系
" 不可視文字を可視化(タブ,スペース,改行)
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" Tab文字を半角スペースにする
set expandtab

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
"検索時に最後まで行ったら最初に戻らない
set nowrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 操作系
" Oで改行を挿入する
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
" 入力モードでバックスペースを有効にする
set backspace=indent,eol,start
" 削除キーでyankしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
" 対応するdo end等にカーソル移動
source $VIMRUNTIME/macros/matchit.vim
let mapleader = "\<Space>"

" 画面分割系
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sw <C-w>w
nnoremap so <C-w><Bar><C-w>_
nnoremap sO <C-w>=
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" バッファ操作系
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" tags関連
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
command GenerateRubyCtags :!ctags -R --languages=ruby --exclude=.git --exclude=log .

" その他
" cronを動かすためバックアップをスキップ
set backupskip=/tmp/*,/private/tmp/*
" 矢印キーは無効!
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" move for command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein/')
  call dein#begin('~/.cache/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('jpo/vim-railscasts-theme')
  call dein#add('tpope/vim-endwise')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('slim-template/vim-slim')
  call dein#add('cohama/lexima.vim')
  call dein#add('posva/vim-vue')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tpope/vim-markdown')
  call dein#add('tpope/vim-dispatch')
  call dein#add('thoughtbot/vim-rspec')
  call dein#add('kana/vim-submode')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('fatih/vim-go')
  call dein#add('buoto/gotests-vim')
  " call dein#add('szw/vim-tags')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" カラースキーマ
colorscheme railscasts

" 初期状態でインデントガイドを有効
let g:indent_guides_enable_on_vim_startup = 1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

" --------------------------------
" syntastic
" --------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
" let g:syntastic_ruby_rubocop_exe = 'bundle exec rubocop -D'
" let g:syntastic_ruby_checkers = ['rubocop']

" let g:syntastic_error_symbol='✗'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_style_warning_symbol = '⚠'

" --------------------------------
" ctrlp.vim
" --------------------------------
let g:ctrlp_clear_cache_on_exit = 1

" rspec
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
au FileType ruby nmap <leader>c :call RunCurrentSpecFile()<CR>
au FileType ruby nmap <leader>n :call RunNearestSpec()<CR>
au FileType ruby nmap <leader>l :call RunLastSpec()<CR>
au FileType ruby nmap <leader>a :call RunAllSpecs()<CR>

" vim-submode
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" go
au FileType go nmap <leader>c :GoBuild<CR>
au FileType go nmap <leader>t :GoTest<CR>
au FileType go nmap <C-b> :GoDefPop<CR>
let g:go_def_mode = 'godef'
" let g:go_snippet_engine = ""

" deoplete
" let g:deoplete#enable_at_startup = 1

" neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/'
