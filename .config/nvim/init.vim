set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
filetype plugin indent on

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set hlsearch
set ruler
set foldenable
set ignorecase
set smartcase
let g:airline_theme='wombat'
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:tex_fold_enabled = 0

let g:tex_flavor = "latex"
let g:tex_conceal = ''
let g:airline_powerline_fonts = 1

if strftime("%H") < 18
  set background=light
else
  set background=dark
endif
colorscheme PaperColor

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
	\ 'envs' : {
	\	'whitelist': ['enumerate','itemize','math', 'abstract'],
	\ },
\ }

set clipboard=unnamedplus
set mouse=a

autocmd FileType rmd nnoremap <F3> :! knit %
autocmd FileType tex nnoremap <F3> :! btex %

autocmd FileType rmd nnoremap <C-S-I> i```{r}<ESC>o<ESC>o```<ESC>ki
let R_assign = 0
let R_rmdchunk = 0
autocmd FileType r,cpp nnoremap <C-B> :RSend devtools::document();devtools::install('.', quick = TRUE)
let r_indent_align_args = 1
let g:pandoc#syntax#conceal#use = 0 
