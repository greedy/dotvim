let g:pathogen_disabled = []
runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
exec pathogen#infect()
syntax on
filetype plugin indent on

set ruler
set et sts=2 sw=2
