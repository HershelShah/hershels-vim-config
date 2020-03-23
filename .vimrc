call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dikiaap/minimalist'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'dense-analysis/ale'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'luochen1990/rainbow'
call plug#end()

filetype plugin on

" Refine keys in VIM to make life easier
inoremap jk <Esc>
nnoremap <Space> :

set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set ruler
set smarttab

" NERDTree Configurations
map <C-n> :NERDTreeToggle<CR>
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

" VIM Airline Configurations with Minimalist Background
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set t_Co=256
syntax on
colorscheme minimalist
let g:airline_theme = 'minimalist'

" VIM Git Gutter Settings
set updatetime=100

" UNDO Tree
nnoremap <C-h> :UndotreeToggle<cr>

" ALE VIM
" ALE Lint options
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_delay = 100
" ALE Completion Implementation
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1

" ALE Move
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ALE Airline Status
let g:airline#extensions#ale#enabled = 1

" ALE Vim Linters

let b:ale_linters = {
	\ 'sh': ['language_server'],
	\ 'c': ['clangd'],
	\ 'cpp': ['clangd'],
	\ 'cuda': ['nvcc'],
	\ 'python': ['flake8', 'pylint'],
	\ }

" ALE Vim Fixers

let b:ale_fixers = {
	\ 'cuda': ['clang-format'],
	\ 'python': ['autopep8', 'yapf'],
	\ }

" Rainbow Parentheses Enable
let g:rainbow_active = 1
