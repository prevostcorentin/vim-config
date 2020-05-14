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
