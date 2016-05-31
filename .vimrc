set nocompatible

set shell=bash
set t_Co=16
set background=dark
syntax on
colorscheme dracula

filetype off

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/Shougo/unite.vim.git'
Plug 'https://github.com/Shougo/neocomplcache.git'
Plug 'https://github.com/Shougo/neosnippet.git'
Plug 'https://github.com/Shougo/neosnippet-snippets.git'
Plug 'https://github.com/Shougo/vimshell.git'
Plug 'https://github.com/Shougo/vimfiler.git'
Plug 'https://github.com/Shougo/vimproc.git'
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/othree/yajs.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plug 'https://github.com/othree/html5.vim.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/mustache/vim-mustache-handlebars.git'
Plug 'https://github.com/cakebaker/scss-syntax.vim.git'
Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'
Plug 'https://github.com/marijnh/tern_for_vim.git'
Plug 'https://github.com/maksimr/vim-jsbeautify.git'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/lilydjwg/colorizer.git'
Plug 'https://github.com/tmhedberg/matchit.git'
Plug 'https://github.com/docunext/closetag.vim.git'
Plug 'https://github.com/glidenote/memolist.vim.git'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'https://github.com/shime/vim-livedown.git'
Plug 'https://github.com/briancollins/vim-jst.git'
Plug 'https://github.com/soramugi/auto-ctags.vim.git'
Plug 'https://github.com/elzr/vim-json.git'
Plug 'https://github.com/tpope/vim-rails.git'
Plug 'https://github.com/zenorocha/dracula-theme.git'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
Plug 'https://github.com/slim-template/vim-slim.git'
Plug 'https://github.com/fatih/vim-go.git'
Plug 'https://github.com/rking/ag.vim.git'

call plug#end()

filetype plugin indent on

if has('gui_macvim')
  set showtabline=2
  set guifont=SourceCodePro-Light:h10
  set transparency=4
endif

"<leader>
let mapleader = " "
":e $HOME/.vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

"fullscreen
if has('gui_running')
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

set number
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set noundofile
set encoding=utf-8
set fileencodings=utf8,cp932,sjis,euc-jp
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait10
set hlsearch
set nobackup
set noswapfile
set iminsert=0
set imsearch=0
set modifiable
set write
set noexpandtab
set showcmd
set cmdheight=1
set showmatch
set hidden
set ruler
set title
set clipboard=unnamed
set cryptmethod=blowfish
set incsearch
set ignorecase smartcase


hi NonText guibg=NONE guifg=IndianRed3
hi SpecialKey guibg=NONE guifg=Gray23

"json conceal
let g:vim_json_syntax_conceal = 0

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

au   BufEnter *   execute ":lcd " . expand("%:p:h")

"search highlight

"ノーマルモードの<C-^>を無効化
nnoremap <silent> <C-^> <Nop>

" highlightサーチをEsc2回で消去
nnoremap <Esc><Esc> :nohlsearch<CR>

command!
      \	-bar -nargs=1 -complete=customlist,s:coding_style_complete
      \	CodingStyle
      \	execute get(s:coding_styles, <f-args>, '')

function! s:coding_style_complete(...) "{{{
  return keys(s:coding_styles)
endfunction "}}}

" HTML Tidy
autocmd FileType html :compiler tidy
autocmd FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\" 
autocmd FileType xhtml :compiler tidy
autocmd FileType xhtml :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\" 

" CSS tidy
autocmd FileType css :compiler css

"plugin key-mappings
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

"neocomplcache
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_max_list = 7
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_smart_case = 1
"" like AutoComplPop
let g:neocomplcache_enable_auto_select = 1
"" search with camel case like Eclipse
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"" <CR>: close popup and save indent.
"inoremap <expr><CR> neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
"dictionary
" js / including node
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \  'css' : $HOME . '/.vim/dict/css.dict',
      \  'javascript' : $HOME . '/.vim/dict/javascript.dict',
      \  'html' : $HOME . '/.vim/dict/html.dict'
      \ }

"enable omni
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,hbs,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" unite.vim
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 20

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
noremap <C-U> :Unite -buffer-name=file file<CR>
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
noremap <C-B> :Unite buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"vimfiler
let g:vimfiler_as_default_explorer = 1

"css color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" nerdtree
autocmd vimenter * NERDTree
let g:NERDTreeShowHidden = 1

"markdown
autocmd BufRead,BufNewFile *.mkd  setfiletype mkd
autocmd BufRead,BufNewFile *.md  setfiletype mkd

autocmd BufNewFile,BufRead *.css,*.less set filetype=css

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" sass
au! BufRead,BufNewFile *.sass setfiletype sass

" mustache
let g:mustache_abbreviations = 1

" js lib syntax
let g:used_javascript_libs = 'underscore, backbone, angularjs, requirejs, jquery, react'

" tern_for_vim
let g:tern_map_keys=1
let tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints='on_hold'

" lightline
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo',  'syntastic' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.{js,css}, call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

"syntastic 
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": ["ruby", "python", "javascript", "css"],
      \ "passive_filetypes": ["html", "scss", "php"]
      \ }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ruby_checkers = ['rubocop']

"beautify
map <c-f> :call JsBeautify()<cr>

" easymotion
let g:EasyMotion_use_upper = 1

" memolist
let g:memolist_memo_suffix = "md"
let g:memolist_unite = 1

" ctags
let g:auto_ctags_directory_list = ['.git']
set tags+=.git/tags

" highlight CursorLine
set cursorline
hi CursorLine term=bold cterm=bold guibg=gray30
highlight Cursor guifg=white guibg=SpringGreen3
highlight iCursor guifg=white guibg=LawnGreen
hi Search guibg=LawnGreen guifg=SkyBlue2

hi NonText guibg=NONE guifg=IndianRed3
hi SpecialKey guibg=NONE guifg=Gray23

" golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

cd $HOME
