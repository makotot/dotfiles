"set font
"set encoding=cp932
"set encoding=utf8
"set ambiwidth=double
"set guifont=Ricty:h11
"set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h10
"set guifont=gohufont-14:h14 guifontwide=MS_Gothic:h10
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
" 文字コードを元に戻す
"set encoding=utf8


" color scheme
colorscheme pencil



set shortmess+=I



" syntax highlighting
set background=dark     " you can use `dark` or `light` as your background
syntax on
"color mango

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

" highlight CursorLine
set cursorline
hi CursorLine term=bold cterm=bold guibg=gray25
highlight Cursor guifg=white guibg=SpringGreen3
highlight iCursor guifg=white guibg=LawnGreen
"set list
"set listchars=tab:>-,extends:^,precedes:^
hi Search guibg=LawnGreen guifg=SkyBlue2


