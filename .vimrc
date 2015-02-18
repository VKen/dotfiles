""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Global Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"modern vim, forget about vi compatibility
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/vundle'

"Original repos on github
Bundle 'airblade/vim-rooter'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'gregsexton/gitv'
Bundle 'scrooloose/syntastic'
Bundle 'hallettj/jslint.vim'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'kogakure/vim-sparkup'
Bundle 'marcusm/python_ifold'
"Bundle 'ocim/htmljinja.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle '2072/PHP-Indenting-for-VIm'
"Bundle 'Shougo/neocomplcache'
"Bundle 'sjl/threesome.vim'
Bundle 'sjl/splice.vim'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
"Bundle 'tsaleh/vim-matchit'
Bundle 'tmhedberg/matchit'
"Snipmate dependencies
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"Vim Scripts Repos
Bundle 'EasyMotion'
Bundle 'Jinja'
Bundle 'JSON.vim'
Bundle 'pep8--Driessen'
Bundle 'python.vim--Vasiliev'
Bundle 'pythoncomplete'
Bundle 'renamer.vim'
Bundle 'The-NERD-Commenter'
Bundle 'vim-indent-object'
"Bundle 'VimClojure'
Bundle 'ZoomWin'

call vundle#end()

""Enable loading filetype and indentation plugins
filetype plugin indent on
syntax on

"check if running in terminal and set to 256 colors
if !has('gui_running')
    set t_Co=256
endif

set fileformat=unix
set incsearch
set ignorecase
set smartcase "overrides ignorecase if search contains uppercase
set hlsearch
set showmode "Shows the current editing mode
set ruler

set title "Set title of the window
set backspace=indent,eol,start "backspace for dummies

"Status line
set laststatus=2
""set statusline=%-3.3n\ "buffer number
""set statusline+=%f\ "filename
""set statusline+=%h%m%r%w "status flags
""set statusline+=\[%{strlen(&ft)?&ft:'none'}] "file type
""set statusline+=\ [%{&ff}] "unix/dos
""set statusline+=%= "right align remainder
""set statusline+=0x%-8B "character value
""set statusline+=%-14(%l,%c%V%) "line, character
""set statusline+=%<%P "file position
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set showcmd "show (partial) commands (or size of selection in Visual mode) in status line
set number


"Remember up to 1000 'colon' commmands and search patterns
set history=1000
"Always show number of lines changed
set report=0

set showmatch
set matchtime=2 "briefly jump to a matching bracket for 0.2s

set nrformats=octal,hex,alpha "enable <c-a>/<c-x> to work on octal, hex and chars

set scrolloff=5 "scroll when cursor gets within 5 lines of top/bottom edge
set scrolljump=5 "jump 5 lines when running out of the screen

"Use 4 spaces for <Tab> and :retab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround "round indent to multiple of 'shiftwidth' for > and < commands

set encoding=utf-8
set termencoding=utf-8

set cursorline "Better highlighting of the current line

set magic "some characters in pattern are taken literally
set hidden "Allows u to have unwritten buffers
"selecting text in visual mode automatically copies it
set clipboard=autoselect

"Fix broken vim regexes when searching
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
nnoremap / /\v
vnoremap / /\v

"Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
"n    - set name of viminfo file
set viminfo='20,\"50,:20,n~/.viminfo

"Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

"Use menu to show command-line completion (in 'full' case)
"improve the way autocomplete works

"Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu

set wildmode=list:longest,list:full
set wildmenu
"ignore certain types of files on completion
set wildignore+=*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*.sqlite,_generated_media,imported-sass-frameworks,env,uploads
set completeopt=menu,preview,longest
set pumheight=15 "menu contains a max of 15 items

"change to a centralised swap directory
set directory=/tmp
set viewdir=/tmp
set undodir=/tmp
"do not use backups
set nobackup

"Remove the toolbar with icons
set guioptions -=T

"right clicking produces a menu
set mousemodel=popup
set mousehide "hides the mouse while typing

"Show 3 lines between a change and a fold that contains unchanged lines
set diffopt+=context:3

"Set user interface options
set anti
set guifont=DejaVu\ Sans\ Mono\ 10
colorscheme vividchalk
set smartindent
set autoindent

set noerrorbells
set shortmess=atToOI "disable welcome message

let mapleader = "," "Set mapleader
set timeoutlen=500 "Lower the timeout after typing the leader key
set nomodeline "do not use modelines

set virtualedit=block "virtual edit mode in visual block so can go past EOL
set shell=zsh "set the shell to zsh
set gdefault "set substitution to be global by default e.g. :s///g
set ttyfast "set fast terminal for better redrawing
set listchars=tab:▸\ ,eol:¬ "textmate style listing of invisible chars

"swap exists warning, damn annoying, edit anyway
:au SwapExists * let v:swapchoice = 'e'

" Remove trailing whitespace from end of file
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufEnter * lcd %:p:h

" automatically give executable permissions if file begins with #! and contains
" '/bin/' in the path
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

set foldlevelstart=0
set foldcolumn=0
set foldenable "auto fold code

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"fix page up and page down so that cursor doesnt move
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>
imap <PageUp> <C-O><C-U><C-O><C-U>
imap <PageDown> <C-O><C-D><C-O><C-D>

"To save, press ctrl-s.
nmap <c-s> :up<CR>
imap <c-s> <Esc>:up<CR>a
vmap <c-s> :up<CR>

" L is easier to type, and I never use the default behavior.
noremap L $

"Y copies to end of line
map Y y$

"visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"Generic highlight changes
hi Comment cterm=none ctermfg=Gray
hi IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
hi String cterm=none ctermfg=DarkGreen
hi ColorColumn guibg=#333333
"Omni menu colors
hi Pmenu guibg=#333333 guifg=#FF6600
hi PmenuSel guibg=#555555 guifg=#FFFFFF


"spacebar to open or close a fold
nnoremap <space> za
vnoremap <space> za

"Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

"Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

"Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

"Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"Toggle menu bar
set guioptions -=m
nnoremap <F10> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

set pastetoggle=<F12>

"Copy to X CLIPBOARD
nmap <leader>y "+y
vmap <leader>y "+y
"Paste from X CLIPBOARD
nmap <leader>p "+gp
vmap <leader>p "+gp
nmap <leader>P "+gP
vmap <leader>P "+gP

nnoremap <leader>/ :noh<cr>

"prevent the f1 key from triggering
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"easy buffer switching
nnoremap <C-Tab> :bnext<cr>
nnoremap <C-S-Tab> :bprevious<cr>

"save on losing focus, saves file when tabbing away from the editor
"do not save if buffer is untitled
au FocusLost ^(\[No Name\]) :wa

"jj now exits insert mode
inoremap jj <ESC>

" disable escape key in input mode, use jk key to escape
inoremap <esc> <nop>
inoremap jk <esc>

"toggle relative and absolute line numbering
function! ToggleNumber()
  if &number == 1
    set relativenumber
  else
    set number
  endif
endfunction
nnoremap <A-n> :call ToggleNumber()<CR>

"center display after searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> a<esc>kywgi<esc>Pla<bs>

"easily enter visual block mode
nnoremap vv <C-v>

"vv now enters visual mode
"nnoremap vv <C-v>

" ; is an alias for :
"nnoremap ; :

" Draw lines of dashes or equal signs based on the length of the line
" immediately above.
inoremap <C-U>- <Esc>kyyp^v$r-ja
inoremap <C-U>= <Esc>kyyp^v$r=ja

"View differences between the current buffer and the original file.
"(Based on code from $VIMRUNTIME/vimrc_example.vim.)
if !exists(":DiffOrig")
    command DiffOrig vertical new | set buftype=nofile | read # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


" Map Control+Up/Down to move lines and selections up and down.
" Based on http://vim.wikia.com/wiki/VimTip646

" Normal mode
nnoremap <silent> <C-Up> :move -2<CR>
nnoremap <silent> <C-Down> :move +<CR>

" Visual mode (only; does not include Select mode)
xnoremap <silent> <C-Up> :move '<-2<CR>gv
xnoremap <silent> <C-Down> :move '>+<CR>gv

" Insert mode
imap <silent> <C-Up> <C-O><C-Up>
imap <silent> <C-Down> <C-O><C-Down>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

""twiddles the case of characters in selection in visual mode
"http://vim.wikia.com/wiki/Switching_case_of_characters
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"REMAPS TO PREVENT BAD HABITS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"mappings for convenience of browsing lines
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_dotfiles = 0
let g:ctrlp_mru_files = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_height = 20

" search project directory
noremap <leader>ff :CtrlP<cr>
"search buffer
noremap <leader>fb :CtrlPBuffer<cr>
"search MRU
noremap <leader>fm :CtrlPMRUFiles<cr>
" search buffer, MRU and files at the same time
noremap <leader>fa :CtrlPMixed<cr>
"search with regex
noremap <leader>fr :CtrlP<cr><c-r>
"search current directory
noremap <leader>fd :CtrlPCurFile<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Search
" Search for visual highlighted text (similar to *)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"From an idea by Michael Naumann
function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"
	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")
	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	else
		execute "normal /" . l:pattern . "^M"
	endif
	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> <F7> :Rooter<cr>:NERDTreeToggle
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExpl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let miniBufExplMapCTabSwitchBufs = 1
" let miniBufExplModSelTarget = 1
let miniBufExplUseSingleClick = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sparkup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let sparkupExecuteMapping = '<leader>z'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_autoclose = 1
let delimitMate_balance_matchpairs = 1
au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" splice formerly threesome
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let splice_initial_layout_grid = 1
let splice_initial_scrollbind_grid = 1
let splice_initial_scrollbind_loupe = 1
let splice_initial_scrollbind_compare = 1
let splice_initial_scrollbind_path = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let xml_use_xhtml = 1
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1
au FileType html imap <buffer> <tab> <c-p>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript / Coffeescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType javascript setlocal foldmethod=syntax
au BufNewFile,BufRead *.coffee set filetype=coffee

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let python_highlight_all=1

au FileType python setlocal colorcolumn=80 foldcolumn=0

function! DetectJinja()
    let n = 1
    while n < 10 && n < line("$")
        if getline(n) =~ '{%\s*\(extends\|block\)\>'
            setf htmljinja
            return
        endif
        let n = n + 1
    endwhile
    setf html
endfun

" Automatic syntax highlighting for jinja files
au BufRead,BufNewFile *.html call DetectJinja()

" Automatic checking of pep8 compliance when saving
"au BufWrite *.py call Pep8()

" Actionscript

au BufNewFile,BufRead *.as set filetype=javascript

" Automatic syntax highlighting for twig templates
au BufRead,BufNewFile *.html.twig set filetype=htmldjango
