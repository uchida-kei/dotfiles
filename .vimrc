" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp932
" バックアップファイルを作らない
set nobackup
set noundofile
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
set list listchars=tab:\|\ 
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
"クリップボードを他のアプリと共有
set clipboard=unnamed

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
	call dein#begin('~/.vim/bundles')

	call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.vim/deinlazy.toml', {'lazy' : 1})

	call dein#end()
	call dein#save_state()
endif

"color scheme
colorscheme iceberg


if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif

