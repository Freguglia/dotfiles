" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" R/Rmarkdown plugins
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'lervag/vimtex'
Plugin 'Konfekt/FastFold'

" Completion
Plugin 'neoclide/coc.nvim'
Plugin 'neoclide/coc-snippets'
Plugin 'neoclide/coc-vimtex'

" Snippets
Plugin 'honza/vim-snippets'

Plugin 'preservim/nerdtree'
Plugin 'tomasiser/vim-code-dark'
call vundle#end()
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

let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:tex_fold_enabled = 0

let g:tex_flavor = "latex"
let g:tex_conceal = ''

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
	\ 'envs' : {
	\	'whitelist': ['enumerate','itemize','math', 'abstract'],
	\ },
\ }

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <tab> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

"copy/paste across multiple sessions
set clipboard=unnamedplus

"use mouse
set mouse=a

" Knit with <F3>
autocmd FileType rmd nnoremap <F3> :! knit %
autocmd FileType tex nnoremap <F3> :! btex %


" insert R chunk with Ctrl-Shift-I
autocmd FileType rmd nnoremap <C-S-I> i```{r}<ESC>o<ESC>o```<ESC>ki
let R_assign = 0
let R_rmdchunk = 0

"R devel
autocmd FileType r,cpp nnoremap <C-B> :RSend devtools::document();devtools::install('.', quick = TRUE)

" fix weird identation
let r_indent_align_args = 1

" prevent conceal
let g:pandoc#syntax#conceal#use = 0 

