""" Options {{{
"" Global {{{
set nocompatible 

syntax on

" modern using of backspace in insert mode
set backspace=indent,eol,start

" line numbering
set relativenumber numberwidth=4

" history size
set history=100

" always show status line
set laststatus=2

set nobackup
set noswapfile

" display line number in insert mode {{{
augroup insert_group
	autocmd!
	autocmd InsertEnter * setlocal norelativenumber number cursorcolumn
	autocmd InsertLeave * setlocal relativenumber nonumber nocursorcolumn
augroup END
" }}}
"" }}}
"" Filetype specific {{{
let maplocalleader=';'
" help {{{
augroup filetype_help
	autocmd!
	autocmd Filetype help nnoremap <buffer> <localleader>?k :cprev<CR>
	autocmd Filetype help nnoremap <buffer> <localleader>?j :cnext<CR>
augroup END
" }}}
" markdown {{{
augroup filetype_markdown
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
" }}}
" vim {{{
augroup filetype_vim

	autocmd!
	autocmd FileType vim inoremap <buffer> fun~ function ()<Return>endfunction:normal k
	autocmd Filetype vim setlocal textwidth=90
	autocmd FileType vim setlocal wrap
	autocmd FileType vim setlocal foldmethod=marker
	" Fold every fold at opening
	autocmd FileType vim setlocal foldlevelstart=0
	autocmd FileType vim setlocal autoindent
	autocmd FileType vim setlocal tabstop=2 shiftwidth=2
augroup END
" }}}
" html {{{
augroup filetype_html
	autocmd!
	autocmd BufNewFile, BufRead *.html setlocal nowrap
	autocmd BufWritePre *.html :normal gg=G
augroup END
" }}}
" python {{{
augroup filetype_python
	autocmd!
	" tabs are trailing spaces are displayed
	set listchars=tab:>-,trail:-
	" Comment line
	autocmd FileType python nnoremap <buffer> <localleader>c I#<space>:normal
	" PEP 8 tabs
	autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd FileType python setlocal textwidth=81 
	autocmd FileType python setlocal wrap 
	autocmd FileType python setlocal list
	autocmd FileType python setlocal cindent
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" }}}
" cpp {{{
augroup filetype_cpp
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>c I//<space>:normal
	autocmd FileType cpp setlocal nowrap
	autocmd FileType cpp setlocal cindent
	" always insert spaces
	autocmd FileType cpp setlocal tabstop=3 shiftwidth=3 expandtab
augroup END
" }}}
"" }}}
""" }}}
"" Mappings {{{
let mapleader=','
" Global {{{
" select current word in visual mode
noremap <space> viw
" disable arrow keys
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
" }}}
" Normal {{{
" move through splits
nnoremap <A-k> <C-w>k
nnoremap <A-j> <C-w>j
nnoremap <A-l> <C-w>l
nnoremap <A-h> <C-w>h
" undo 2 changes one at a time
nnoremap <leader>d "1dd"2dd:let @"=@1<CR>
" create splits
" vertical for new buffer
nnoremap <C-s>jn :execute "rightbelow new ."<CR>
nnoremap <C-s>kn :execute "leftabove new ."<CR>
" horizontal for new buffer
nnoremap <C-s>ln :execute "rightbelow vnew ."<CR>
nnoremap <C-s>hn :execute "leftabove vnew ."<CR>
" vertical for previous buffer
nnoremap <C-s>jk :execute "rightbelow split " . bufname(bufnr('#')-1)<CR>
nnoremap <C-s>kk :execute "leftabove split " . bufname(bufnr('#')-1)<CR>
" horizontal for previous buffer
nnoremap <C-s>lk :execute "rightabove vsplit " . bufname(bufnr('#')-1)<CR>
nnoremap <C-s>hk :execute "leftabove vsplit " . bufname(bufnr('#')-1)<CR>
" vertical for next buffer
nnoremap <C-s>jj :execute "rightbelow split " . bufname(bufnr('#')+1)<CR>
nnoremap <C-s>kj :execute "leftabove split " . bufname(bufnr('#')+1)<CR>
" horizontal for next buffer
nnoremap <C-s>hj :execute "rightabove vsplit " . bufname(bufnr('#')+1)<CR>
nnoremap <C-s>lj :execute "leftabove vsplit " . bufname(bufnr('#')+1)<CR>
" source file
nnoremap <leader>x :source 
" edit a file
nnoremap <leader>o :e 
" Shortcuts to vimrc file
nnoremap <leader>xv :source $HOME\vimfiles\vimrc<CR><LF>
nnoremap <leader>ov :vsplit $HOME\vimfiles\vimrc<CR><LF>
" go to end of line with Shift-l
nnoremap L $
" go to beginning of line with Shift-h
nnoremap H 0
" save
nnoremap ! :w<CR>
" delete line
nnoremap \ dd
" }}}
" Visual  {{{
vnoremap <space> e
" exit visual mode
vnoremap jk <Esc>
" capitalize
vnoremap \ U
" add quotes around selection
vnoremap <leader>" <esc>a"<esc>v`<<esc>i"<esc>v
" }}}
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
" unmap default exit
inoremap <esc> <nop>
" }}}
" Pending  {{{
onoremap p i(
onoremap b /return<cr>
" Parentheses {{{
" Inside next
onoremap in( :<C-u>normal! f(vi(<cr>
" Inside last
onoremap il( :<C-u>normal! F)vi(<cr>
" Around next
onoremap an( :<C-u>normal! f(va(<cr>
" Around last
onoremap al( :<C-u>normal! F)va(<cr>
" }}}
" Curly braces {{{
" Inside next
onoremap in{ :<C-u>normal! f{vi{<cr>
" Inside last
onoremap il{ :<C-u>normal! F}vi{<cr>
" Around next
onoremap an{ :<C-u>normal! f{va{<cr>
" Around last
onoremap al{ :<C-u>normal! F}va}<cr>
" }}}
" }}}
"" }}}
""" Statusline {{{
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
"" Filetype specific {{{
" cpp {{{
augroup statusline_cpp_filetype
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
" }}}
"" }}}
""" }}}
""" Abbreviations {{{
"" Filetype Specific
" vim {{{
augroup filetype_vim_abbrev
  autocmd!
augroup end
" }}}
"" }}}
" Look {{{
set guifont=Lucida\ Console
autocmd FileType vim highlight Normal guifg=#1A1B37
autocmd FileType vim highlight vimHighlight gui=bold guifg=#DFC932
autocmd FileType vim highlight vimMap guifg=#133A44
autocmd FileType vim highlight vimAugroupKey gui=bold guifg=#133A44
autocmd FileType vim highlight vimAutocmd guifg=#234154
autocmd FileType vim highlight vimIsCommand guifg=#537A74
autocmd FileType vim highlight vimAutoCmdSfxList guifg=#537A74
autocmd FileType vim highlight vimOper guifg=#000000
autocmd FileType vim highlight vimHiGroup guifg=#000000
" }}}
""" Imported {{{
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
""" }}}
