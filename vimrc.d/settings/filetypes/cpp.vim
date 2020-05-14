augroup filetype_cpp
  autocmd!
  autocmd FileType cpp setlocal listchars=tab:╬═,trail:•
  autocmd FileType cpp setlocal list
  autocmd FileType cpp setlocal nowrap
  autocmd FileType cpp setlocal cindent
  autocmd FileType cpp setlocal smarttab
  autocmd FileType cpp setlocal foldmethod=indent
  autocmd FileType cpp setlocal foldlevelstart=0
  autocmd FileType cpp setlocal tabstop=3 shiftwidth=3 noexpandtab
augroup END
