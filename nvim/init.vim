" Plugin configuration before loading
"let g:neomake_python_python_exe = 'python3'

" deoplete
"let g:deoplete#enable_at_startup = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_conceal_code_blocks = 0

" vim-polyglot
let g:polyglot_disabled = ['latex', 'python']

" gruvbox
let g:gruvbox_contrast_light='hard'


" Load plugins
call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'arzg/vim-corvine'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'lervag/vimtex'
Plug 'chrisbra/csv.vim'

" Motions
Plug 'justinmk/vim-sneak'

" Make/linting
Plug 'neomake/neomake'

" Other
Plug 'farmergreg/vim-lastplace'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-sleuth'

call plug#end()

" neomake
"call neomake#configure#automake('nrw', 500)


" key bindings
let mapleader = ' '
tnoremap <Leader>e <C-\><C-n>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>r :set relativenumber!<CR>
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>
nmap <Leader>o o<Esc>k
nmap <Leader>O O<Esc>j
nmap <Leader>n :NeomakeDisableBuffer<Bar>:NeomakeClean<CR>
nmap <Leader>N :NeomakeEnableBuffer<Bar>:Neomake<CR>
nmap <Leader>W :%s/\s\+$\<Bar> \+\ze\t//g<CR>

" visuals
set relativenumber
set number
set ruler
set list listchars=tab:>·,nbsp:⍽,trail:•
set cursorline
set scrolloff=1  " show at least one line above/below cursor

" color
syntax on
set colorcolumn=80
hi ColorColumn ctermbg=235
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/
set termguicolors
set background=light
colorscheme corvine_light

" tabs
set breakindent "indent wrapped lines to line indent level
set tabstop=4
set shiftwidth=4
set expandtab
let g:python_recommended_style = 0

" tex
let g:tex_flavor = "latex"

" misc
set grepprg=grep\ -nH\ $*
set wildmode=longest,list  " bash-like tab completion
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
