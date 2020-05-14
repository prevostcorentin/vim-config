augroup filetype_csharp " {{{
  autocmd!
  autocmd FileType cs setlocal listchars=tab:╬═,trail:•
  autocmd FileType cs setlocal list
  autocmd FileType cs setlocal nowrap
  autocmd FileType cs setlocal cindent
  autocmd FileType cs setlocal smarttab
  autocmd FileType cs setlocal foldmethod=indent
  autocmd FileType cs setlocal foldlevelstart=0
  autocmd FileType cs setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END " }}}
