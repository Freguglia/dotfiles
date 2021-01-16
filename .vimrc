" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Rmarkdown plugins
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'jalvesaq/Nvim-R'
Plugin 'preservim/nerdtree'
Plugin 'lervag/vimtex' 
Plugin 'ycm-core/YouCompleteMe' 
Plugin 'tomasiser/vim-code-dark'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
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

colorscheme codedark

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

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
let R_rnowebchunk = 0
let R_rmdchunk = 0

"R devel
autocmd FileType r,cpp nnoremap <C-B> :RSend devtools::document();devtools::install('.', quick = TRUE)


let g:tex_flavor = 'latex'

" fix weird identation
let r_indent_align_args = 1

" prevent conceal
let g:pandoc#syntax#conceal#use = 0 

