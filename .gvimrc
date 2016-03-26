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

" syntax highlighting
set background=dark     " you can use `dark` or `light` as your background
syntax on

" highlight CursorLine
set cursorline
hi CursorLine term=bold cterm=bold guibg=gray25
highlight Cursor guifg=white guibg=SpringGreen3
highlight iCursor guifg=white guibg=LawnGreen
hi Search guibg=LawnGreen guifg=SkyBlue2

hi NonText guibg=NONE guifg=IndianRed3
hi SpecialKey guibg=NONE guifg=Gray23
