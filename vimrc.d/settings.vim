echomsg "Loading base settings ..."

" Show status line {{{
  set laststatus=2
" }}}
" Disable vi-compatibility {{{
  set nocompatible
" }}}
" Default indentation {{{
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
" Highlight column & line {{{
  set cursorcolumn
  set cursorline
" }}}
" Activate syntax highlighting {{{
  syntax on
" }}}
" Backspace behavior {{{ 
" Modern: erase full tabulations and end of lines
  set backspace=indent,eol,start
" }}}
" Line numbering {{{
  " Line number relative to current cursor position {{{
    set relativenumber
  " }}}
  " Display current line number {{{
    set number
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
    set listchars=eol:▼,tab:➤\ ,trail:•
    set list " Replaces whitespaces 
  " }}}
" }}}
" Case-sensitivity {{{
  set ignorecase
" }}}
" netrw {{{
  " Don't need the banner {{{
    let g:netrw_banner = 0
  " }}}
  " Open file in a split {{{
    let g:netrw_browser_split = 1
  " }}}
  " Set width to 25% of the page {{{
    let g:netrw_winsize = 25
  " }}}
" }}}
" search {{{
  "iterate through search results {{{
    set incsearch
  " }}}
  " highlight matches {{{
    set hlsearch
  " }}}
" }}}
" autocompletion {{{
  set completeopt=menuone,noselect,noinsert
  set shortmess+=c
" }}}

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8,latin1
end

if has("win32")
  set fileformats=dos,unix
else
  set fileformats=unix
end
" }}}
