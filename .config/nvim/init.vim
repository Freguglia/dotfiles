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

inoremap <expr> <Tab> coc#pum#visible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
	\ 'envs' : {
	\	'whitelist': ['enumerate','itemize','math', 'abstract'],
	\ },
\ }

let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'Token',
      \ 'Foreign command',
      \ 'using breakurl while processing',
      \ 'bookmark levels',
      \ 'substituted on input line'
      \]

set clipboard=unnamedplus
set mouse=a

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd FileType rmd nnoremap <F3> :! knit %
autocmd FileType tex nnoremap <F3> :! btex %

autocmd FileType rmd nnoremap <C-S-I> i```{r}<ESC>o<ESC>o```<ESC>ki
let R_assign = 0
let R_rmdchunk = 0
autocmd FileType r,cpp nnoremap <C-B> :RSend devtools::document();devtools::install('.', quick = TRUE)
let r_indent_align_args = 1
let g:pandoc#syntax#conceal#use = 0
