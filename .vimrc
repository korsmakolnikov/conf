set nocompatible
filetype off
execute pathogen#infect()

"macvim character size
:set guifont=Andale\ Mono:h18

" highlighting
syntax on
set cursorline
set number				                "mostra i numeri di riga

"Tabbing
set autoindent				            "autoindenta dopo l'accapo
set tabstop=4
set shiftwidth=4
set expandtab

"other
set backspace=indent,eol,start		"permette il backspace in insertmode
set visualbell				            "sopprime la campanella
set autoread				              "ricarica i file modificati da altre sorgenti
set autowriteall			            "autosave
set nowrap                        "sopprime il textwrap 
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

"vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"clipboard
set clipboard=unnamed
Plugin 'gmarik/Vundle.vim'
call vundle#end()            
filetype plugin indent on 

"colorscheme
let g:solarized_termcolors=256
packadd! onedark.vim
syntax enable
set background=dark
colorscheme solarized
"colorscheme onedark

"nerdtree configuration
call pathogen#infect()
set autochdir
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
let g:NERDTreeShowHidden=1
let g:nerdtree_tabs_autofind=2
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.DS_Store$']
map <Leader>x :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=50

"Java/groovy and gradle configuration
au BufNewFile,BufRead *.gradle setf groovy
