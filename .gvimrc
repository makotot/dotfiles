"set font
set encoding=cp932
set ambiwidth=double
set guifont=Ricty:h12
"set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h10
"set guifont=gohufont-14:h14 guifontwide=MS_Gothic:h10
" 文字コードを元に戻す
set encoding=utf8

"set alpha
"gui
"set transparency=250

" for solarized
"let g:solarized_termcolors=16
"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_contrast='normal'
"let g:solarized_visibility='normal'

" color scheme
"colorscheme slate
"colorscheme desert
"colorscheme wombat
"
"syntax enable
"set background=dark
"colorscheme solarized
"colorscheme railscasts
"colorscheme vitamins
"colorscheme ir_black
"colorscheme luna
"colorscheme luna-term
"colorscheme jellybeans
colorscheme hybrid
"colorscheme twilight


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

