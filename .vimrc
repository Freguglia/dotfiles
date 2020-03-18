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
highlight Comment ctermfg=green

"copy/paste across multiple sessions
set clipboard=unnamedplus

"use mouse
set mouse=a

" Knit with <F3>
autocmd FileType rmd nnoremap <F3> :! knit %
autocmd FileType tex nnoremap <F3> :! btex %

" highlight column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v./

" fix weird identation
let r_indent_align_args = 0

" prevent conceal
let g:pandoc#syntax#conceal#use = 0
