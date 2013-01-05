set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

if has('vim_starting')
	call vundle#rc()
endif

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
Bundle 'lepture/vim-css'
Bundle 'wavded/vim-stylus'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'digitaltoad/vim-jade'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on

set shell=bash

"show line number
set number


"���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

au   BufEnter *   execute ":lcd " . expand("%:p:h")


"�m�[�}�����[�h��<C-^>�𖳌���
nnoremap <silent> <C-^> <Nop>

"no backup swp
set nobackup
set noswapfile

"ime
set iminsert=0
set imsearch=0

set modifiable
set write

set noexpandtab


"
set showcmd
set cmdheight=1

"�o�b�t�@�֘A
"�ҏW���ł��o�b�t�@��؂�ւ����悤�ɂ��Ă���
set hidden

"���[���[��\��
set ruler
set title


" highlight�T�[�`��Esc2��ŏ���
nnoremap <Esc><Esc> :nohlsearch<CR>


"�^�u�������Z�b�g
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".rhtml��.rb��.yml�Ń^�u����ύX
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2

"for jquery syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


"for JSON syntax
au! BufRead,BufNewFile *.json setfiletype json 

"for Markdown
autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
au BufNewFile,BufRead *.{md,mkd,mkdn,mark*} setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" .py�Ń^�u����ύX�E�X�y�[�X�ŃC���f���g�ɕύX
au BufNewFile,BufRead *.py setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"javascript tab
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufNewFile,BufRead *.js set tabstop=4 shiftwidth=4 softtabstop=4

" �R�[�f�B���O�X�^�C���؂�ւ�
let s:coding_styles = {}
let s:coding_styles['Default'] = 'setl tabstop=4 shiftwidth=4 shiftwidth=4 softtabstop=4 noexpandtab'
let s:coding_styles['ShortExpandStyle'] = 'setl tabstop=2 shiftwidth=2 shiftwidth=2 softtabstop=2 expandtab'

command!
			\	-bar -nargs=1 -complete=customlist,s:coding_style_complete
			\	CodingStyle
			\	execute get(s:coding_styles, <f-args>, '')

function! s:coding_style_complete(...) "{{{
	return keys(s:coding_styles)
endfunction "}}}

au FileType javascript set ts=4 sw=4 noexpandtab
au BufNewFile *.js set ft=javascript fenc=utf-8

set laststatus=2
set statusline=%<%f\ %m%r
set statusline+=[%{&fenc!=''?&fenc:&enc}][%{&ff}]
set statusline+=%l:%L

set cmdheight=1

au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict


"NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"plugin key-mappings
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

"neocomplcache
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_max_list = 5
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


" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"dictionary
" js / including node
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \  'css' : $HOME . '/.vim/dict/css.dict',
  \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
  \ }


" unite.vim
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
 
"unite general settings
"�C���T�[�g���[�h�ŊJ�n
let g:unite_enable_start_insert = 1
"�ŋߊJ�����t�@�C�������̕ۑ���
let g:unite_source_file_mru_limit = 50
 
"file_mru�̕\���t�H�[�}�b�g���w��B��ɂ���ƕ\���X�s�[�h�������������
let g:unite_source_file_mru_filename_format = ''
 
"���݊J���Ă���t�@�C���̃f�B���N�g�����̃t�@�C���ꗗ�B
"�J���Ă��Ȃ��ꍇ�̓J�����g�f�B���N�g��
noremap <C-U> :Unite -buffer-name=file file<CR>
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"�o�b�t�@�ꗗ
noremap <C-B> :Unite buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"���W�X�^�ꗗ
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"�ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"�u�b�N�}�[�N�ꗗ
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"�u�b�N�}�[�N�ɒǉ�
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"unite���J���Ă���Ԃ̃L�[�}�b�s���O
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESC��unite���I��
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "���̓��[�h�̂Ƃ�jj�Ńm�[�}�����[�h�Ɉړ�
  imap <buffer> jj <Plug>(unite_insert_leave)
  "���̓��[�h�̂Ƃ�ctrl+w�Ńo�b�N�X���b�V�����폜
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+j�ŏc�ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+j�ŉ��ɕ������ĊJ��
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+o�ł��̏ꏊ�ɊJ��
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}


"easymotion
let g:EasyMotion_leader_key = '<Leader>'
