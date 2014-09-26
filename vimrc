" Early settings {{{

set nocompatible
let mapleader = ";"
let maplocalleader = mapleader

" Prevent jedi from loading (may be installed system-wide)
let g:loaded_jedi = 1

set suffixes+=.class,.pyc,.pyo
set suffixes-=.h
set suffixes+=.lo,.swo

" }}}

command MkDirs call mkdir(expand('%:h'), 'p')

" Airline configuration {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep="▓▒░"
let g:airline_right_sep="░▒▓"

let g:airline_inactive_collapse=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
" }}}

" CtrlP Configuration {{{
let g:ctrlp_custom_ignore = {
    \ 'file':   '\v\.(class|o|so|py[co])$',
    \ 'dir':    '\v/\.(git|hg|svn)$',
    \ }
" }}}

let g:NERDTreeHijackNetrw=0

" GUI options {{{
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
" }}}

" Pathogen invocation {{{
let g:pathogen_disabled = ['valloric-youcompleteme',]
runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
exec pathogen#infect()
syntax on
filetype plugin indent on
" }}}

function s:camel_word(dir)
    call search('\U\zs\u\|\<', a:dir)
endfunction

" Global mappings {{{

" nnoremap <Leader>n :<C-u>NERDTreeToggle<CR>
" nnoremap <Leader>N :<C-u>NERDTreeFind<CR>

nnoremap <Leader>u :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>f :<C-u>CtrlP<CR>
nnoremap <Leader><C-f> :<C-u>CtrlP %:h<CR>
nnoremap <Leader>F :<C-u>CtrlPMixed<CR>
nnoremap <Leader>t :<C-u>CtrlPTag<CR>
nnoremap <Leader>r :<C-u>CtrlPBufTag<CR>

nnoremap <Leader>h :nohls<CR>

nnoremap <Leader>c <C-w>c
nnoremap <Leader>o <C-w>o

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

nnoremap <silent> _ :aboveleft sp<CR>:exe "normal \<Plug>VinegarUp"<CR>
nnoremap <silent> <Bar> :rightbelow vsp<CR>:exe "normal \<Plug>VinegarUp"<CR>

noremap <F1> <Esc>
inoremap <F1> <Esc>
" }}}


" Basic configuration {{{
colors jellybeans
set ruler
set et sts=4 sw=4

set showcmd

set wildmenu wildmode=longest,list

set laststatus=2 "always include status line

if executable('grin')
    set grepprg=grin\ -nH\ --emacs
endif

set tags=./tags,./TAGS,tags,TAGS,./.tags,./.TAGS,.tags,.TAGS

set cino+=(0,g0
" }}}

let g:syntastic_mode_map = { 'mode': 'passive' }

" Python indenting {{{
function PythonParenIndent(lnum)
    call cursor(a:lnum, 1)
    let [pline, pcol] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
                        \ "synIDattr(synID(line('.'), col('.'), 1), 'name')" .
                        \ " =~ '\\(Comment\\|String\\)$'",
                        \ max([0,a:lnum-50]))
    let plinecontent = getline(pline)
    let lineend = match(plinecontent, '\s*$')
    if pcol >= lineend
        return &sw
    else
        return pcol-indent(pline)
    endif
endfunction

let g:pyindent_nested_paren='PythonParenIndent(a:lnum)'
let g:pyindent_open_paren='PythonParenIndent(a:lnum)'
" }}}

runtime ftplugin/man.vim

" vim: set foldmethod=marker :
