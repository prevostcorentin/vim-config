"""" Imported {{{
""" Plugins {{{
call plug#begin() " {{{
" Status Line {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}
" File/Project browsing {{{
Plug 'vimplugin/project.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
" }}}
"" Python {{{
" Auto-completion {{{
Plug 'davidhalter/jedi-vim'
" }}}
" Syntax highlighting {{{
Plug 'vim-python/python-syntax'
" }}}
"" }}}
"" C/C++ {{{
" Auto-completion {{{
" Based on a ctag database
Plug 'vim-scripts/OmniCppComplete'
" }}}
" Syntax highlighting {{{
Plug 'octol/vim-cpp-enhanced-highlight'
" }}}
"" }}}
"" UI {{{
" Start screen {{{
Plug 'mhinz/vim-startify'
" }}}
" Colorschemes {{{
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'NLKNguyen/papercolor-theme'
" }}}
"" }}}
"" Javascript {{{
" Syntax highlighting {{{
Plug 'posva/vim-vue'
" }}}
"" }}}
call plug#end()   " }}}
"" Settings {{{
" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
" }}}
" Fugitive {{{
let g:fugitive_git_command='git'
" }}}
" python-syntax {{{
let g:python_highlight_all = 1
" }}}
"" }}}
""" }}}
"" Show syntax highlighting groups for word under cursor {{{
" Mapping {{{
nmap <C-S-P> :call <SID>SynStack()<CR>
" }}}
" Function {{{
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}
"" }}}
""" Filetype Specific {{{
"" C/C++ {{{
" autocompletion
augroup autocompletion_cpp
  autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h,*.c setlocal omnifunc=omni#cpp#complete#Main
  autocmd FileType cpp setlocal tags+=$HOME/vimfiles/autocomplete/tags/cpp
augroup END
"" }}}
""" }}}
"""" }}}
""" Options {{{
"" Global {{{
" don't want that good ol' Vi
set nocompatible
" Vim config paths {{{
if has('win32')
  let $VIM_DIR = "vimfiles"
else
  let $VIM_DIR = ".vim"
endif
let $MYVIM_DIR = $HOME."/".$VIM_DIR
let $MYVIMRC = $MYVIM_DIR."/vimrc"
" enable plugins
"set runtimepath+=$HOME/vimfiles/plugin
" enable per project configuration
set exrc
" }}}
" Backup files {{{
set backup
let &backupdir = $MYVIM_DIR.'/backup'
" }}}
" Swap files {{{
set swapfile
let &directory = $MYVIM_DIR.'/swap'
" }}}
" Search {{{
set incsearch
set hlsearch
" }}}
" File encoding {{{
if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8,latin1
end
" }}}
" enable syntax
syntax on
" modern using of backspace in insert mode
set backspace=indent,eol,start
" relative line number with true line count for cursor position
set relativenumber numberwidth=4 number
" history size
set history=1000
" always show status line
set laststatus=2
" don't wrap lines
set nowrap
" display tabs and trailing spaces
set listchars=eol:▼,tab:➤\ ,trail:•
set list

if has('win32')
  set fileformats=unix,dos
endif

" GUI Specific {{{
if has('gui')
" no menu, sidebar etc...
  set guioptions=
endif
" }}}
" Terminal Specific {{{
if !has('gui')
  " enable full mouse support
  set mouse=a
endif
" }}}
"" }}}
"" Filetype specific {{{
filetype plugin on
" conf {{{
augroup filetype_conf
  autocmd!
  autocmd FileType conf setlocal foldmethod=indent
  autocmd FileType conf setlocal foldlevelstart=0
  autocmd FileType conf setlocal autoindent
  autocmd FileType conf setlocal tabstop=4 shiftwidth=4
  autocmd FileType conf setlocal filetype=yaml
" }}}
" cpp {{{
augroup filetype_cpp
  autocmd!
  autocmd FileType cpp setlocal listchars=tab:╬═,trail:•
  autocmd FileType cpp setlocal list
  autocmd FileType cpp setlocal nowrap
  autocmd FileType cpp setlocal cindent
  autocmd FileType cpp setlocal smarttab
  autocmd FileType cpp setlocal foldmethod=indent
  autocmd FileType cpp setlocal foldlevelstart=0
  " insert tabs and display it as 3 spaces wide
  autocmd FileType cpp setlocal tabstop=3 shiftwidth=3 noexpandtab
augroup END
" }}}
" html {{{
augroup filetype_html_php
  autocmd!
  autocmd FileType html,php setlocal tabstop=2 shiftwidth=2
  autocmd FileType html,php setlocal nowrap
  autocmd FileType html,php setlocal cindent
  autocmd FileType html,php setlocal foldmethod=indent
  autocmd FileType html,php setlocal foldlevelstart=0
augroup END
" }}}
" linux scripts {{{
augroup linux_scripts
  autocmd!
  autocmd FileType zsh,bash,csh,sh setlocal tabstop=2 shiftwidth=2 noexpandtab
augroup END
" }}}
" makefile {{{
augroup filetype_makefile
  autocmd!
  autocmd Filetype make setlocal tabstop=2 shiftwidth=2
augroup END
" }}}
" markdown {{{
augroup filetype_markdown
  autocmd!
  autocmd Filetype vim setlocal list
  autocmd BufNewFile *.txt :write
augroup END
" }}}
" python {{{
augroup filetype_python
  autocmd!
  " tabs are trailing spaces are displayed
  autocmd FileType python setlocal nolist
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType python setlocal textwidth=81 wrapmargin=0 colorcolumn=81
  autocmd FileType python setlocal foldmethod=indent foldlevelstart=0
  autocmd FileType python setlocal nowrap
  autocmd FileType python setlocal cindent
  autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" }}}
" vim {{{
augroup filetype_vim
  autocmd!
  autocmd Filetype vim setlocal nolist
  autocmd Filetype vim setlocal textwidth=90
  autocmd FileType vim setlocal nowrap
  autocmd FileType vim setlocal foldmethod=marker
  " Fold every fold at opening
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType vim setlocal autoindent
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2
augroup END
" }}}
" vue {{{
augroup filetype_vue
  autocmd!
  autocmd FileType *.vue setlocal nowrap
  autocmd FileType *.vue setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType *.vue setlocal list
augroup END
" }}}
"" }}}
""" }}}
"""" Mappings {{{
let mapleader = ','

if has('win32')
  let $MYVIMDIR = $HOME.'\vimfiles\'
else
  let $MYVIMDIR = $HOME.'/.vim/'
endif

let $MYVIMRC = $MYVIMDIR.'vimrc'
" Global {{{
" select current word in visual mode
noremap <space> viw
" disable arrow keys
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

noremap <C-o> :vertical resize +5<cr><lf>
noremap <C-i> :vertical resize -5<cr><lf>
noremap <C-d> :resize +5<cr><lf>
noremap <C-c> :resize -5<cr><lf>

" }}}
""" Normal {{{
"" splits {{{
" create viewports {{{
" horizontal
nnoremap <C-s>l :execute "rightbelow vnew"<CR>
nnoremap <C-s>h :execute "leftabove vnew"<CR>
" vertical
nnoremap <C-s>j :execute "rightbelow new"<CR>
nnoremap <C-s>k :execute "leftabove new"<CR>
" move with <Ctrl-[vim move]>
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" }}}
"" }}}
" buffers {{{
" select in a list
nnoremap <F5> :buffers<cr>:buffer
" previous in current viewport
nnoremap <F1> :bprev<cr>
" next in current viewport
nnoremap <F2> :bnext<cr>
" }}}
" go to end of line with Shift-l
nnoremap L $
" go to beginning of line with Shift-h
nnoremap H 0
" save
nnoremap ! :w<CR>
""" }}}
" Insert {{{
" delete current line without leaving mode
inoremap <C-d> <esc>ddi
" capitalize current word
inoremap <C-u> <esc>viwU<esc>wi
" move one line up
inoremap <C-j> <esc>ddpi
" move one line down
inoremap <C-k> <esc>kddpki
" exit
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>
" }}}
"""" }}}
" Look {{{
if has('gui')
  if has('win32')
    set guifont=Lucida_Console:h14:cANSI:qDRAFT
  else
    set guifont=Monospace
  endif
endif
set background=light
colorscheme PaperColor
" }}}
" vim: set foldmethod=marker foldlevelstart=0
