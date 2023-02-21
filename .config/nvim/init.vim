set number
set termguicolors
set tabstop=4

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'cohama/lexima.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'cohama/lexima.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme='dracula'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.dirty='⚡'

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

let g:dracula_colorterm = 0
syntax enable
colorscheme dracula
