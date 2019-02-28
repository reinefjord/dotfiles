call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'lervag/vimtex'
Plug 'chrisbra/csv.vim'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'unblevable/quick-scope'
Plug 'godlygeek/tabular'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'davidhalter/jedi'
"Plug 'zchee/deoplete-jedi'
"Plug 'w0rp/ale'

call plug#end()


" key bindings
let mapleader = ' '
tnoremap <Leader>e <C-\><C-n>
nnoremap <Leader>h :set hlsearch!<CR>
nmap <Leader>o o<Esc>k
nmap <Leader>O O<Esc>j
nmap <Leader>n :NeomakeDisableBuffer<Bar>:NeomakeClean<CR>
nmap <Leader>N :NeomakeEnableBuffer<Bar>:Neomake<CR>

" visuals
set relativenumber
set number
set ruler
set list listchars=tab:>·,nbsp:␣,trail:•

" color
syntax on

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
colorscheme jellybeans

set background=dark
"set colorcolumn=80
"hi ColorColumn ctermbg=8
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

" tabs
set breakindent "indent wrapped lines to line indent level
set tabstop=4
set shiftwidth=4
set expandtab

" tex
let g:tex_flavor = "latex"

" misc
set grepprg=grep\ -nH\ $*
set wildmenu
set backspace=2
set mouse=c
au BufRead /tmp/mutt-* set tw=72
set hidden
set undofile
set undodir=$HOME/.local/share/nvim/undo
set nojoinspaces  " only one space after punctuation
set conceallevel=2  " conceal *text* _formatting_
set ignorecase
set smartcase

" neomake
call neomake#configure#automake('nrw', 500)

" deoplete
"let g:deoplete#enable_at_startup = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2

" vim-polyglot
let g:polyglot_disabled = ['latex', 'markdown']
