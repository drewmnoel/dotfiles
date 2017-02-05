set nocompatible
set nu
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set statusline+=%f
set ignorecase
set clipboard=unnamedplus
set colorcolumn=80

set omnifunc=syntaxcomplete#Complete
imap jj <Esc>
syntax on
filetype off

call vundle#rc()

filetype plugin indent on
set ai
syntax on

autocmd FileType css,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'

let g:indent_guides_enable_on_vim_startup = 1
