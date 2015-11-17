set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

set shortmess+=I

set autoindent

"display tab
set showtabline=2

"メニュー日本語文字化け対応
"http://d.hatena.ne.jp/sea_mountain/20100906/1283792259
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"full screen
"au GUIEnter * simalt ~x

"ツールバーを非表示
set guioptions-=T
set guioptions-=m
