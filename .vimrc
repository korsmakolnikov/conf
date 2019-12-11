" Basic conf
syntax enable
colorscheme darcula 

"autocmd! BufLeave *.go colorscheme darcula
"autocmd BufEnter,BufNewFile,BufRead *.go colorscheme monokai-bold
set number

" Load local .vimrc
set exrc

" Cursor configuration TODO not working
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Editor configuration
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
" Fix backspace
set bs=2

" consent to move freely in the page even if there are no spaces
set virtualedit=all 

call plug#begin('~/.vim/plugged')
" General plugin
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Airline is the toolbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mbbill/undotree'                                                         " print a tree of undo
Plug 'jremmen/vim-ripgrep'                                                     " fast grep inside project
Plug 'jlanzarotta/bufexplorer'                                                 " buf explorer window
Plug 'junegunn/goyo.vim'                                                       " disctraction free mode :Goyo, turn off by :Goyo!

" Git plugin
Plug 'airblade/vim-gitgutter'                                                  " print changes on left of line numbers
Plug 'zivyangll/git-blame.vim'                                                 " print blame in command bar

" Docker plugin
Plug 'ekalinin/Dockerfile.vim'

" Languages plugin (not working with js) 
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

" Deoplete autocompletition plugin
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'athom/more-colorful.vim' "fix color syntax highlighting for golang
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }                         " haskell language server client
Plug 'elixir-editors/vim-elixir'                                               " elixir plug in
Plug 'mxw/vim-jsx'                                                             " vim-jsx and vim-javascript fix js highlighting
Plug 'pangloss/vim-javascript'

" Color schemes
Plug 'Mcmartelle/vim-monokai-bold'

call plug#end()

" NERDTree
" nerdtree on the right
function! IsNerdTreeEnabled()
  return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! ToggleNerdTree()
  :if IsNerdTreeEnabled()
  :execute "NERDTreeClose" | echom "close nerdtree"
  :else
  :execute "NERDTree" | echom "toggle nerdtree"
  :endif
endfunction

nnoremap <silent> <F2> :call ToggleNerdTree()<CR>
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
" javascript does not work. I think server does not start
" \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
" \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'javascript': ['tcp://127.0.0.1:2089'],
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

" fix syntax highlighting
autocmd FileType javascript syn sync ccomment javaScriptComment

" bufexplorer
nnoremap <silent> <F4> :call BufExplorer()<CR>

" undotree 
nnoremap <silent> <F3> :UndotreeToggle<cr>

" open configuration
nnoremap <silent> <F12> :execute "e ~/.vimrc"<CR>
nnoremap <silent> <S-F12> :execute "source ~/.vimrc"<CR>

" quick find shortcuts
function! QuickSearch () 
  let currentWord = expand("<cword>")
  :execute "Rg ". currentWord
endfunction
nnoremap <C-f> :call QuickSearch()<CR>
nnoremap <C-c> :NERDTreeFind<CR>
function! UnixSearch (fileName)
  :execute "!find . -iname ". a:fileName
endfunction
:command -nargs=+ Us :call UnixSearch(<f-args>)
function! UnixSearchInsensitive (fileName)
  :execute "!find . -name ". a:fileName
endfunction
:command -nargs=+ Usi :call UnixSearchInsensitive(<f-args>)

" vim-go and golang rules
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_extra_types = 1

