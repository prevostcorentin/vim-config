echomsg "Loading base settings ..."
" Vi-compatibility {{{
set nocompatible
" }}}
" Indentation {{{
set shiftwidth=3 tabstop=3 expandtab
" }}}
" Backup settings {{{
let $_BKP_DIRPATH = $MYTMPDIR.'/backup'
let &backupdir = $_BKP_DIRPATH
set backup
if !isdirectory($_BKP_DIRPATH)
   call mkdir($_BKP_DIRPATH)
endif
" }}}
" Swap settings {{{
set swapfile
let $_SWAP_DIRPATH = $MYTMPDIR.'/swap'
let &directory = $_SWAP_DIRPATH
if !isdirectory($_SWAP_DIRPATH)
   call mkdir($_SWAP_DIRPATH)
endif
" }}}
" Column highlighting {{{
set cursorcolumn
" }}}
" Syntax highlighting {{{
syntax on
" }}}
" Backspace behavior {{{ 
" Modern: erase full tabulations and end of lines
set backspace=indent,eol,start
" }}}
" Line numbering {{{
  " Line number relative to current cursor position  {{{
  set relativenumber
  " }}}
  " Line number viewport part width {{{
  set numberwidth=4 
  " }}}
" }}}
" History size {{{
set history=1000
" }}}
" Line wrap {{{
set nowrap
" }}}
" Whitespaces {{{
  " Characters for whitespaces {{{
  set listchars=eo▼,tab:➤\ ,trail:•
  set list " Replaces whitespaces 
  " }}}
" }}}
" Case-sensitivity {{{
set ignorecase
" }}}
