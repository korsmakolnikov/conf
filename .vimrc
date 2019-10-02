call plug#begin('~/.vim/plugged')
" General plugin
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'vim-scripts/ZoomWin'
Plug 'jremmen/vim-ripgrep'
Plug 'zivyangll/git-blame.vim'

" Git plugin

" Docker plugin
Plug 'ekalinin/Dockerfile.vim'

" Languages plugin 
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
call plug#end()

syntax enable
colorscheme darcula
set number

" Editor configuration
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Fix backspace
:set bs=2

" NERDTree
" nerdtree on the right
let g:NERDTreeWinPos = "right"
autocmd VimEnter * NERDTree
let NERDTreeWinSize = 50
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif
" automatically quit if nerdtree is the only windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" git blame configuration
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Airline configuration
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" correct jsonc highlights
autocmd FileType json syntax match Comment +\/\/.\+$+

" deoplete config
let g:deoplete#enable_at_startup = 1
set completeopt=menu,noinsert

" Required for operations modifying multiple buffers like rename.
set hidden

" Inactive language servers bind
" \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'go': ['go-languageserver -gocodecompletion'],
    \ }

" hie configuration 
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
