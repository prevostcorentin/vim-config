augroup filetype_markdown
  autocmd!
  autocmd Filetype vim setlocal list
  autocmd BufNewFile *.txt :write
augroup END
