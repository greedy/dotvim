set nocompatible
let mapleader = ";"
let maplocalleader = mapleader

let g:pathogen_disabled = []
runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
exec pathogen#infect()
syntax on
filetype plugin indent on

nnoremap <Leader>n :<C-u>NERDTreeToggle<CR>
nnoremap <Leader>N :<C-u>NERDTreeFind<CR>
nnoremap <Leader>b :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>f :<C-u>CtrlP<CR>
nnoremap <Leader>F :<C-u>CtrlPMixed<CR>
nnoremap <Leader>t :<C-u>CtrlPTag<CR>

colors jellybeans
set ruler
set et sts=4 sw=4
