let g:auto_addons = ['The_NERD_tree', 'Solarized','neocomplcache','vim-addon-goto-thing-at-cursor', 'fugitive']
runtime initialize_vam.vim

fun VAMPostInit()
  colors solarized
endfun

syntax on

filetype plugin indent on

set et sts=2 sw=2
