"set font
set encoding=cp932
set ambiwidth=double
"set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h10
set guifont=gohufont-14:h14 guifontwide=MS_Gothic:h10
" 文字コードを元に戻す
set encoding=utf8

"set alpha
gui
set transparency=250

"color sheme
"colorscheme slate
colorscheme desert

set list
set listchars=tab:>-,extends:^,precedes:^
"set listchars=tab:≫-,trail:-,eol:?,extends:≫,precedes:≪,nbsp:%
set shortmess+=I


set autoindent
set smartindent
set smarttab
set tabstop=4

"display tab
set showtabline=2

"メニュー日本語文字化け対応
"http://d.hatena.ne.jp/sea_mountain/20100906/1283792259
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"full screen
au GUIEnter * simalt ~x


set guioptions-=T	"ツールバーを非表示
set guioptions-=m

