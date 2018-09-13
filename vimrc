if has('win32')
  let $MYVIMDIR = $HOME.'\vimfiles'
else
  let $MYVIMDIR = $HOME.'/.vim'
endif

let $MYVIMRC = $MYVIMDIR."/vimrc"

" don't want Vi
set nocompatible
" enable per project configuration
set exrc

call plug#begin() " {{{
"status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"file/Project browsing
Plug 'vimplugin/project.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
"python
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8'
"C/C++
Plug 'vim-scripts/OmniCppComplete'
Plug 'octol/vim-cpp-enhanced-highlight'
"misc
Plug 'mhinz/vim-startify'
"colorschemes
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'
"javascript
Plug 'posva/vim-vue'
call plug#end() " }}}
" Settings {{{
set shiftwidth=3 tabstop=3 expandtab
"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
"fugitive
let g:fugitive_git_command='git'
"python-syntax
let g:python_highlight_all = 1
"show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<cr>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
augroup kiwiconf_colorization " {{{
  autocmd BufNewFile,BufRead,BufEnter *.conf set filetype=yaml ts=2 sw=2 expandtab
augroup END" }}}
augroup autocompletion_cpp " {{{
  autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h,*.c setlocal omnifunc=omni#cpp#complete#Main
  autocmd FileType cpp setlocal tags+=$HOME/vimfiles/autocomplete/tags/cpp
augroup END " }}}
"backup files
set backup
let &backupdir = $MYVIMDIR.'/backup'
"swap files
set swapfile
let &directory = $MYVIMDIR.'/swap'
"iterate through search results
set incsearch
"highlight matches
set hlsearch
"enable syntax
syntax on
"modern using of backspace in insert mode
set backspace=indent,eol,start
"relative line number with true line count for cursor position
set relativenumber numberwidth=4 number
"history size
set history=1000
"always show status line
set laststatus=2
"don't wrap lines
set nowrap
"display tabs and trailing spaces
set listchars=eol:▼,tab:➤\ ,trail:•
set list
"case-insensitive
set ignorecase

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8,latin1
end

if has('win32')
  set fileformats=dos
else
	set fileformats=unix
endif

filetype plugin on
augroup filetype_conf " {{{
  autocmd!
  autocmd FileType conf setlocal foldmethod=indent
  autocmd FileType conf setlocal foldlevelstart=0
  autocmd FileType conf setlocal autoindent
  autocmd FileType conf setlocal tabstop=4 shiftwidth=4
  autocmd FileType conf setlocal filetype=yaml
augroup END " }}}
augroup filetype_cpp " {{{
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
augroup END " }}}
augroup filetype_html_php " {{{
  autocmd!
  autocmd FileType html,php setlocal tabstop=2 shiftwidth=2
  autocmd FileType html,php setlocal nowrap
  autocmd FileType html,php setlocal cindent
  autocmd FileType html,php setlocal foldmethod=indent
  autocmd FileType html,php setlocal foldlevelstart=0
augroup END " }}}
augroup linux_scripts " {{{
  autocmd!
  autocmd FileType zsh,bash,csh,sh setlocal tabstop=2 shiftwidth=2 noexpandtab
augroup END " }}}
augroup filetype_makefile " {{{
  autocmd!
  autocmd Filetype make setlocal tabstop=2 shiftwidth=2
augroup END " }}}
augroup filetype_markdown " {{{
  autocmd!
  autocmd Filetype vim setlocal list
  autocmd BufNewFile *.txt :write
augroup END " }}}
augroup filetype_python " {{{
  autocmd!
  " tabs are trailing spaces are displayed
  autocmd FileType python setlocal nolist
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType python setlocal textwidth=81 wrapmargin=0 colorcolumn=81
  autocmd FileType python setlocal foldmethod=indent foldlevelstart=0
  autocmd FileType python setlocal nowrap
  autocmd FileType python setlocal cindent
  autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END " }}}
augroup filetype_vim " {{{
  autocmd!
  autocmd Filetype vim setlocal nolist
  autocmd Filetype vim setlocal textwidth=90
  autocmd FileType vim setlocal nowrap
  autocmd FileType vim setlocal foldmethod=marker
  " Fold every fold at opening
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType vim setlocal autoindent
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2
augroup END " }}}
augroup filetype_vue " {{{
	autocmd!
	autocmd FileType vue,javascript setlocal nowrap
	autocmd FileType vue,javascript setlocal tabstop=2 shiftwidth=2 expandtab
	autocmd FileType vue,javascript setlocal list
	autocmd FileType vue,javascript set filetype=js
augroup END " }}}
augroup filetype_yaml " {{{
  autocmd!
  autocmd FileType conf setlocal foldmethod=indent
  autocmd FileType conf setlocal foldlevelstart=0
  autocmd FileType conf setlocal autoindent
  autocmd FileType conf setlocal tabstop=4 shiftwidth=4
  autocmd FileType conf setlocal filetype=yaml
augroup END "}}}

if filereadable($MYVIMDIR."/local/look.vim")
	source $MYVIMDIR/local/look.vim
else
	if has('gui')
		"no menu, sidebar etc...
    set guioptions=
    " set background=light
    " colorscheme PaperColor
    let g:airline_theme = 'papercolor'
		set background=dark
    colorscheme dracula
    let g:airline_theme = 'dark'
		if has('win32')
			set guifont=Lucida_Console:h11:cANSI:qDRAFT
		else
			set guifont=Hack,Monospace
		endif
	else
		set background=light
		colorscheme default
	endif
endif
" }}}
" Mappings {{{
let mapleader = ','
let localmapleader = ';'

"" Normal mode {{{
"fold/unfold
nnoremap <leader>f :set foldlevel=0<cr>
nnoremap <leader><S-f> :set foldlevel=50<cr>
"go to end of line
nnoremap L $
"go to beginning of line
nnoremap H 0
"move through viewports
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"edit Makefile
nnoremap <leader>em :edit Makefile
"execute make
nnoremap <leader>m :make
"navigate through buffers
nnoremap <F1> :bprev<cr>
nnoremap <F2> :bnext<cr>
"navigate through tabs
nnoremap <leader>k :tabnext<cr>
nnoremap <leader>j :tabprev<cr>
"new viewports (split)
nnoremap <C-s>l :rightbelow vnew<cr>
nnoremap <C-s>h :leftabove vnew<cr>
nnoremap <C-s>j :rightbelow new<cr>
nnoremap <C-s>k :leftabove new<cr>
"resize viewport
noremap <C-o> :vertical resize +5<cr>
noremap <C-i> :vertical resize -5<cr>
noremap <C-d> :resize +5<cr>
noremap <C-c> :resize -5<cr>
"save
nnoremap <silent> ! ma:%s/ \+$//g<cr>w<cr>`a
"select buffer
nnoremap <F5> :buffers<cr>:buffer
"select current word in visual mode
noremap <space> viw
" source vimrc
nnoremap <leader>v :source $MYVIMRC<cr>
" invoke Project
nnoremap <leader>p :Project<cr>
" new tab
nnoremap <leader>t :tabnew
"" }}}
"" Insert mode {{{
" capitalize current word
inoremap <C-u> <esc>viwU<esc>wi
" delete current line without leaving mode
inoremap <C-d> <esc>ddi
" exit
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>
" move one line down
inoremap <C-k> <esc>kddpki
" move one line up
inoremap <C-j> <esc>ddpi
"" }}}
" }}}
" Misc {{{
if !has('gui')
  " enable full mouse support
  set mouse=a
endif
" }}}
" vim: set ts=2 sw=2 noet fdm=marker fdl=0
