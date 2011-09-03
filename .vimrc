set nocompatible "set non-compatible with old VI
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'kchmck/vim-coffee-script'
Bundle 'marcusm/python_ifold'
Bundle 'ocim/htmljinja.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'hallettj/jslint.vim'

" vim-scripts repos
Bundle 'Jinja'
Bundle 'vibrantink'

" non github repos



""Enable loading filetype and indentation plugins
filetype plugin indent on
syntax on


colorscheme vibrantink
set guifont=inconsolata\ 10
set number
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set nocompatible bs=2
set hlsearch
syntax on
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
nnoremap <space> za

" deal with jinja
autocmd BufRead,BufNewFile *.html.jin set filetype=html
autocmd BufRead,BufNewFile *.html.jin set syntax=htmljinja
" save document on focus-out and tab-out
au FocusLost * :wa

