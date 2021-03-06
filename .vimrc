" General
set nocompatible
set number                      " Show line numbers
set linebreak                   " Break lines at word (requires Wrap lines)
set showbreak=+++               " Wrap-broken line prefix
set textwidth=100               " Line wrap (number of cols)
set showmatch                   " Highlight matching brace
set errorbells                  " Beep or flash screen on errors

set hlsearch                    " Highlight all search results
set smartcase                   " Enable smart-case search
set ignorecase                  " Always case-insensitive
set incsearch                   " Searches for strings incrementally
 
set autoindent                  " Auto-indent new lines
set expandtab                   " Use spaces instead of tabs
set shiftwidth=4                " Number of auto-indent spaces
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs
set softtabstop=4               " Number of spaces per Tab


"" Advanced
set ruler                       " Show row and column ruler information
set showtabline=1               " Always show Tabline
set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set spell
let mapleader ="\<Space>"       " Leader = Space
inoremap jk <Esc>
nnoremap <leader><leader> :
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
filetype plugin on

" VIM ALE Preload
let g:ale_completion_enabled = 1

call plug#begin('~/.vim/plugged')
" File Manager with GIT plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" NERD Commenter
Plug 'preservim/nerdcommenter'

" VIM Airline Features
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" VIM Minimalist Theme
Plug 'dikiaap/minimalist'

" VIM Git Gutter
Plug 'https://github.com/airblade/vim-gitgutter.git'

" VIM Fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'

" VIM Polyglot for Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" VIM Surround
Plug 'https://github.com/tpope/vim-surround.git'

" VIM Rainbow Parentheses
Plug 'luochen1990/rainbow'

" VIM UndoTree
Plug 'simnalamburt/vim-mundo'

" VIM ALE Code Analysis
Plug 'dense-analysis/ale'

" VIM Jedi Language Server
Plug 'davidhalter/jedi-vim'

" Python REPL Loop
Plug 'sillybun/vim-repl'

" Sort Python Import Packages 
Plug 'nkantar/SPI.vim'

" VIM FZF
Plug 'junegunn/fzf.vim'

" VIM CTRL+P
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()


"  Minimalist Theme
syntax on
set t_Co=256
colorscheme minimalist
set lazyredraw 

" Tab Configurations
nnoremap <C-t> :tabedit<CR>
nnoremap <C-h> :tabprevious<CR>                                                                            
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t>t  :tabclose<CR>


" NERDTree Configurations
let g:NERDTreeShowIgnoredStatus = 1
map <leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" VIM Airline Configurations
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0 
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'minimalist'


" VIM Git Gutter Settings
set updatetime=300
let g:gitgutter_max_signs = 3000 
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" VIM UndoTree
nnoremap <leader>u :MundoToggle<CR>
set undofile                    " Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undo

" VIM Rainbow Parentheses
let g:rainbow_active = 1

" VIM ALE Code Analysis
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_tsserver_autoimport = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" VIM Linters
let g:ale_linters = {
\   'python': ['flake8'],
\}

" VIM REPL Python Toggle
nnoremap <leader>r :REPLToggle<CR>

" VIM FZF 
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
inoremap <expr> <c-x><c-f> <plug>(fzf#complete#path({'left': '15%'})
inoremap <expr> <c-x><c-j> <plug>(fzf#complete#file#ag({'left': '15%'}))
inoremap <expr> <c-x><c-l> <plug>(fzf#complete#line({'left': '15%'}))
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" CIM CTRL + P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
