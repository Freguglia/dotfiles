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
call vundle#end()
filetype plugin indent on

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set relativenumber
set hlsearch
set ruler

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
autocmd FileType r,cpp nnoremap <C-B> :! rpkgc %:h

" highlight column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v./

" fix weird identation
let r_indent_align_args = 0

" prevent conceal
let g:pandoc#syntax#conceal#use = 0 

hi Comment ctermfg=243
hi Constant ctermfg=83
hi LineNr ctermfg=243
hi CursorLineNr term=underline ctermfg=0 ctermbg=15
hi Statement ctermfg=141
hi SpellBad ctermfg=1 ctermbg=0
hi PreProc ctermfg=176
hi Type ctermfg=214
hi pandocCiteKey ctermfg=227
hi pandocCiteAnchor ctermfg=227
hi link pandocCiteLocator pandocCiteKey
hi link pandocPCite pandocCiteKey
hi pandocListItemBulletId cterm=bold ctermfg=215
hi Title cterm=bold ctermfg=15 ctermbg=241
hi pandocAtxStart ctermfg=0 ctermbg=15
hi yamlBlockMappingKey ctermfg=214 cterm=bold
hi link yamlKeyValueDelimiter yamlBlockMappingKey
hi link yamlDocumentStart yamlBlockMappingKey
hi link yamlBlockCollectionItemStart yamlBlockMappingKey
hi link yamlFlowIndicator yamlBlockMappingKey
hi link yamlFlowStringDelimiter yamlBlockMappingKey
hi yamlPlainScalar ctermfg=255
hi link yamlFlowString yamlPlainScalar
hi link yamlEscape yamlPlainScalar
hi link rBoolean Boolean
hi link yamlBool Boolean
hi link texMathZoneX Statement
hi link texMathZoneC Statement
hi link texTypeStyle Statement
hi link Delimiter Statement
hi texMathMatcher ctermfg=141
hi texRefZone ctermfg=227
hi texItalBoldStyle ctermfg=141
hi link texSpecialChar Statement
hi link texInputFileOpt Statement
hi link texInputFile Constant
hi pandocLaTeXRegion ctermfg=15
hi link pandocNoFormatted Statement
hi texBeginEndName ctermfg=141 cterm=bold
hi texStatement ctermfg=141
hi link texBeginEnd texStatement
hi pandocDelimitedCodeBlockLanguage ctermfg=35
hi link pandocDelimitedCodeBlockStart pandocDelimitedCodeBlockLanguage
hi link pandocDelimitedCodeBlockEnd pandocDelimitedCodeBlockLanguage
hi rFunction ctermfg=214
hi rNameWSpace ctermfg=35
hi rPreProc ctermfg=35
hi link rDollar Delimiter
hi rOTitle ctermfg=141 cterm=bold
hi link rOTag rOTitle
hi rOCommentKey ctermfg=230
hi link rOBlock rOCommentKey
hi link rOExamples rOCommentKey
hi link rString Constant
hi link rSpecial rString
hi Folded cterm=underline ctermfg=244 ctermbg=235
hi FoldColumn ctermfg=239 ctermbg=16
