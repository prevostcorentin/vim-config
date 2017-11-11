"" Basic settings {{{
set nocompatible 

syntax on

" modern using of backspace in insert mode
set backspace=indent,eol,start

" line numbering
set number numberwidth=4
set relativenumber

" history size
set history=100

" always show status line
set laststatus=2

augroup insert_group
	autocmd!
	autocmd InsertEnter * setlocal norelativenumber number cursorcolumn
	autocmd InsertLeave * setlocal relativenumber nonumber nocursorcolumn
augroup END
"" }}}
"" Filetype specific settings {{{
augroup filetype_others
	autocmd!
	autocmd BufNewFile *.txt :write
	" Inside header block delimited by =
	autocmd FileType markdown onoremap <buffer> ih1 :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
	" Around header block delimited by =
	autocmd FileType markdown onoremap <buffer> ah1 :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
	" Inside subheader block delimited by -
	autocmd FileType markdown onoremap <buffer> ih2 :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
	" Around header block delimited by -
	autocmd FileType markdown onoremap <buffer> ah1 :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	" Fold every fold at opening
	autocmd FileType vim setlocal foldlevelstart=0
	autocmd FileType vim setlocal autoindent
	autocmd FileType vim setlocal nowrap
	autocmd FileType vim setlocal wrapmargin=5
augroup END

augroup filetype_html
	autocmd!
	autocmd BufNewFile, BufRead *.html setlocal nowrap
	autocmd BufWritePre *.html :normal gg=G
augroup END

augroup filetype_python
	autocmd!
	" tabs are trailing spaces are displayed
	set listchars=tab:>-,trail:-
	" Comment line
	autocmd FileType python nnoremap <buffer> <localleader>c I#<space>:normal
	" PEP 8 tabs
	autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd FileType python setlocal wrap 
	autocmd FileType python setlocal list
	autocmd FileType python setlocal cindent
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_cpp
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>c I//<space>:normal
	autocmd FileType cpp setlocal nowrap
augroup END
"" }}}
"" Mappings {{{

let mapleader=','
let maplocalleader='^'

" Move line up
nnoremap <C-j> ddp
nnoremap <C-k> kddpk

nnoremap <leader>x :source 
nnoremap <leader>o :e 

nnoremap L $

" Shortcuts to vimrc file
nnoremap <leader>xv :source $HOME\vimfiles\vimrc<CR><LF>
nnoremap <leader>ov :vsplit $HOME\vimfiles\vimrc<CR><LF>

nnoremap H <esc>
" save file
nnoremap ! :w<CR>
nnoremap \ dd

vnoremap <space> e
vnoremap \ U

vnoremap <leader>" <esc>a"<esc>v`<<esc>i"<esc>v

noremap <space> viw
noremap <A-k> <C-w>k
noremap <A-j> <C-w>j
noremap <A-l> <C-w>l
noremap <A-h> <C-w>h

noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

inoremap <C-d> <esc>ddi
inoremap <C-u> <esc>viwU<esc>wi

inoremap jk <esc>
inoremap <esc> <nop>

onoremap p i(
onoremap b /return<cr>

" Inside next
onoremap in( :<C-u>normal! f(vi(<cr>
" Inside last
onoremap il( :<C-u>normal! F)vi(<cr>
" Around next
onoremap an( :<C-u>normal! f(va(<cr>
" Around last
onoremap al( :<C-u>normal! F)va(<cr>

" Inside next
onoremap in{ :<C-u>normal! f{vi{<cr>
" Inside last
onoremap il{ :<C-u>normal! F}vi{<cr>
" Around next
onoremap an{ :<C-u>normal! f{va{<cr>
" Around last
onoremap al{ :<C-u>normal! F}va}<cr>
" }}}
"" Statusline {{{
" absolute filename
set statusline=%-50F
" filetype
set statusline+=%-25.15y
" current percentage for cursor position in whole file
set statusline+=%25p%%
" current line for cursor position in whole file
set statusline+=%54l
set statusline+=/
" line number in whole file
set statusline+=%4L

augroup statusline_c_filetype
	autocmd!
	" Only filename
	autocmd FileType cpp setlocal statusline=%-30t
	autocmd FileType cpp setlocal statusline+=%3m
	" Byte hexadecimal value of current character
	autocmd FileType cpp setlocal statusline+=%3r
	autocmd FileType cpp setlocal statusline+=\   
	autocmd FileType cpp setlocal statusline+=\{%B
	autocmd FileType cpp setlocal statusline+=:
	" Byte decimal value of current character
	autocmd FileType cpp setlocal statusline+=%b\}
	autocmd FileType cpp setlocal statusline+=\ 
	autocmd FileType cpp setlocal statusline+=[%l
	autocmd FileType cpp setlocal statusline+=/
	autocmd FileType cpp setlocal statusline+=%L]
augroup END
"" }}}
