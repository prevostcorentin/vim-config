" This script sets various configuration options as variables
"
" MYVIMDIR - Directory where lies the main configuration file {{{
if has('win32')
  let $MYVIMDIR = $HOME.'\vimfiles'
elseif has('nvim')
  let $MYVIMDIR = $HOME.'/.config/nvim'
else
  let $MYVIMDIR = $HOME.'/.vim'
endif
" }}}
" MYVIMRC - Main configuration file path {{{
if has('nvim')
  let $MYVIMRC = $MYVIMDIR.'/init.vim'
else
  let $MYVIMRC = $MYVIMDIR.'/vimrc'
endif
" }}}
" MYVIMDISTRIBUTION - Current distribution of Vim (nvim, nvim-qt, vim, vi ...) {{{
if has('nvim')
  let $MYVIMDISTRIBUTION = 'nvim'
else
  let $MYVIMDISTRIBUTION = 'vim'
endif
" }}}
" MYDATADIR - Directory with unshared static data inside {{{
if !has('win32')
  let $MYDATADIR = $HOME.'/.local/share/'.$MYVIMDISTRIBUTION
else
  let $MYDATADIR = $MYVIMDIR.'\local'
endif
" }}}
" MYTMPDIR - Directory where goes Vim temporary files {{{
if !has('win32')
  let $MYTMPDIR = '/tmp/'.$MYVIMDISTRIBUTION
else
  let $MYTMPDIR = $MYVIMDIR.'\tmp'
endif
" }}}
" MYLOOKFILE - Path to a script that overrides default UI theming {{{
let $MYLOOKFILE = $MYDATADIR.'/look.vim'
" }}}
" MYSCRIPTSDIR - Folder where to look for custom Vim scripts {{{
let $MYSCRIPTSDIR = $MYVIMDIR.'/vimrc.d'
" }}}
"
" Modifying runtime to add custom scripts {{{
set runtimepath+=$MYSCRIPTSDIR
" }}}
