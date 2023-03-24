set number

call plug#begin()

Plug 'lissaferreira/dalton-vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'cohama/lexima.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'a': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>

set encoding=UTF-8

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme='dracula'

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

colorscheme dracula

hi Normal guibg=NONE ctermbg=NONE

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
