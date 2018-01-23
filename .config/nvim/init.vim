"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let g:python_host_prog =  expand("$HOME/.asdf/installs/python/2.7.14/bin/python2")
let g:python3_host_prog =  expand("$HOME/.asdf/installs/python/3.6.4/bin/python3")
let g:dein_dir = expand("$HOME/.cache/dein")
let g:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:rc_dir = expand("$HOME/.config/nvim")

if !isdirectory(g:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' g:dein_repo_dir
endif

" Required:
execute 'set runtimepath^=' . g:dein_repo_dir

" Required:
if dein#load_state(g:dein_dir)
  call dein#begin(g:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(g:dein_repo_dir)

  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

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

"set background=dark
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

set encoding=utf8
set notitle
set ruler               "Show the cursor position
set number              "行番号の表示
set cursorline          "Change the cursor line color
set list                "Show invisible characters
set listchars=tab:»\ ,trail:·,nbsp:·,eol:↲
set tabstop=2           "タブ幅
set softtabstop=2       "バックスペースなどで削除する空白の数
set shiftwidth=2        "インデント幅
set expandtab           "タブを空白に置き換える
set autoindent          "改行時に入力された行のインデントを継続する
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set whichwrap=b,s,h,l,<,>,[,]] "カーソルを行頭、行末で止まらないようにする
set backspace=indent,eol,start "バックスペースを有効にする
set colorcolumn=100

set nobackup            "ファイル保存時にバックアップファイルを作らない
set noswapfile          "ファイル編集中にスワップファイルを作らない

set wildmenu            "コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set history=50          "keep command line history
set viminfo='50,\"3000,:0,n~/.config/nvim/.viminfo

set hlsearch            "検索文字列をハイライトする
set incsearch           "do incremental searching
set ignorecase          "大文字と小文字を区別しない
set smartcase           "大文字と小文字が混在している場合は大文字と小文字を区別する
set laststatus=2        "display status line

set clipboard=unnamed
set mouse=a

set visualbell t_vb=
set noerrorbells        "エラーメッセージの表示時にビーブを鳴らさない

augroup FiletypeGroup
  autocmd!
  au BufRead,BufNewFile *.jsx set filetype=javascript
  au BufRead,BufNewFile *.eex,*.erb set filetype=html
augroup END

nnoremap ; :
nnoremap : ;
