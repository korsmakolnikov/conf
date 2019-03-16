set nocompatible
filetype off
execute pathogen#infect()

"macvim character size
:set guifont=Andale\ Mono:h18

" highlighting
syntax on
set cursorline
"hi CursorLine term=bold ctermbg=17 cterm=bold guibg=Grey40           "for standard theme
"hi CursorLine term=bold ctermbg=8 cterm=bold guibg=Grey40             "for inori theme
set number				                "mostra i numeri di riga

"Tabbing
set autoindent				            "autoindenta dopo l'accapo
set tabstop=4
set shiftwidth=4
set expandtab

" maps to delete by word
"map  bvex
"map d vex
"map!  <C-\><C-O>b<C-\><C-O>vex
"map! d <C-\><C-O>vex

"other
set backspace=indent,eol,start		"permette il backspace in insertmode
set visualbell				            "sopprime la campanella
set autoread				              "ricarica i file modificati da altre sorgenti
"set autowriteall			            "autosave
set nowrap                        "sopprime il textwrap 
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

"vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"clipboard
set clipboard=unnamed
Plugin 'gmarik/Vundle.vim'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'jgdavey/tslime.vim'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'duythinht/inori'
"Plugin 'jistr/vim-nerdtree-tabs'
call vundle#end()            
filetype plugin indent on 

"colorscheme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

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

"let g:tmux_sessionname = 'work'		"deaults di tslime per passare il comando rspec al giusto pannello
"let g:tmux_windowname = 'edit'
"let g:tmux_panenumber = '1'
"let g:rspec_command = 'call Send_to_Tmux("rspec spec/{spec}\n")'
"map <Leader>r :call system('tmux resize-pane -Z')<CR>
"map <Leader><S-r> :call system('tmux resize-pane -Z -t edit.1')<CR>

"ConqueTerm configuration
map <Leader>b :call ToggleConqueTerm()<CR>
let g:ConqueTerm_CWInsert = 1
let g:ConqueTermExistence = 0
let g:ConqueTermStatus = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_Color = 0

function! ToggleConqueTerm() 
  if g:ConqueTermExistence == 0 
    :execute "ConqueTermSplit bash"
    let g:ConqueTermExistence = 1
  endif

  if g:ConqueTermStatus 
    let g:ConqueTermStatus = 0
    :2hide
  else
    :2unhide
    let g:ConqueTermStatus = 1
  endif
endfunction

"Java/groovy and gradle configuration
au BufNewFile,BufRead *.gradle setf groovy
