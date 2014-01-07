set nocompatible
let mapleader = ";"
let maplocalleader = mapleader

let g:airline_left_sep="▙"
let g:airline_right_sep="▜"
let g:NERDTreeHijackNetrw=0

if has('gui')
    " no menu
    set guioptions-=m
    " no toolbar
    set guioptions-=T
    " no scrollbars
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
    set guifont=Envy\ Code\ R\ 14px
endif

let g:pathogen_disabled = []
runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
exec pathogen#infect()
syntax on
filetype plugin indent on

" nnoremap <Leader>n :<C-u>NERDTreeToggle<CR>
" nnoremap <Leader>N :<C-u>NERDTreeFind<CR>
nnoremap <Leader>b :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>f :<C-u>CtrlP<CR>
nnoremap <Leader>F :<C-u>CtrlPMixed<CR>
nnoremap <Leader>t :<C-u>CtrlPTag<CR>
nnoremap <Leader>r :<C-u>CtrlPBufTag<CR>

colors jellybeans
set ruler
set et sts=4 sw=4
