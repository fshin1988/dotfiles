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

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
" 128桁目に印をつける
set colorcolumn=128
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
" 対応するdo end等にカーソル移動
source $VIMRUNTIME/macros/matchit.vim

" tags関連
" ファイル保存時にtagsを作成
let g:auto_ctags = 1
let g:auto_ctags_tags_args = '--exclude="*.js" --tag-relative --recurse --sort=yes  --append=no'
let g:auto_ctags_directory_list = ['.git']
" .gitからtags読み込み
set tags+=.git/tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" その他
" cronを動かすためバックアップをスキップ
set backupskip=/tmp/*,/private/tmp/*

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein_vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein_vim/')
  call dein#begin('~/.vim/dein_vim/')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein_vim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('jpo/vim-railscasts-theme')
  call dein#add('tpope/vim-endwise')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('soramugi/auto-ctags.vim')
  call dein#add('vim-syntastic/syntastic')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'