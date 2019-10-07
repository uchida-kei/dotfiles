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
set nowritebackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
"Tab, 改行の可視化
set list
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set lcs=tab:>-,trail:-
"set lcs=tab:>-,eol:<,nbsp:%
"set lcs=extends:>,precedes:<
"set list listchars=tab:|_
set nolist
" Tab文字を半角スペースにする
"set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
"クリップボードを他のアプリと共有
set clipboard+=unnamedplus
"タイトル表示
set title
"ルーラ表示
set ruler
"マウス操作
if has('mouse')
	set mouse=a
	if has('mouse_sgr')
		set ttymouse=sgr
	endif
endif
"端末vimでtrueColorを使用
if has('nvim')
	set termguicolors
endif
"Use nightly rustfmt in all versions
"let g:rustfmt_command = 'rustup run nightly-2018-12-27 rustfmt'
"Auto format when saving 
"let g:rustfmt_autosave = 1

set hidden

function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif

if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
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

filetype plugin indent on
syntax enable
