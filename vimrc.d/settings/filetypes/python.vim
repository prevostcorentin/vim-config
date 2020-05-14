augroup filetype_python " {{{
  autocmd!
  " tabs are trailing spaces are displayed
  autocmd FileType python setlocal nolist
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType python setlocal textwidth=81 wrapmargin=0 colorcolumn=81
  autocmd FileType python setlocal foldmethod=indent foldlevelstart=0
  autocmd FileType python setlocal nowrap
  autocmd FileType python setlocal cindent
  autocmd FileType python :iabbrev <buffer> iff if :<left>
augroup END " }}}
