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
augroup linux_shell
  autocmd!
  autocmd FileType zsh,bash,csh,sh setlocal tabstop=2 shiftwidth=2 noexpandtab
augroup END
runtime settings/filetypes/cpp.vim
runtime settings/filetypes/csharp.vim
runtime settings/filetypes/html.vim
runtime settings/filetypes/makefile.vim
runtime settings/filetypes/markdown.vim
runtime settings/filetypes/python.vim
runtime settings/filetypes/shell.vim
runtime settings/filetypes/vimfile.vim
runtime settings/filetypes/vue.vim
runtime settings/filetypes/yaml.vim
echomsg "Loading filetype plugins ..."
filetype plugin on
runtime settings/filetypes/imports.vim
augroup filetype_makefile " {{{
  autocmd!
  autocmd Filetype make setlocal tabstop=2 shiftwidth=2
augroup END " }}}
augroup filetype_markdown
  autocmd!
  autocmd Filetype vim setlocal list
  autocmd BufNewFile *.txt :write
augroup END
augroup filetype_python " {{{
  autocmd!
  """ Settings {{{
  autocmd FileType python setlocal list
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType python setlocal textwidth=81 wrapmargin=0 colorcolumn=81
  autocmd FileType python setlocal foldmethod=indent foldlevelstart=0
  autocmd FileType python setlocal nowrap
  autocmd FileType python setlocal cindent
  """ }}}
  """ Abbreviations {{{
  autocmd FileType python :iabbrev <buffer> class class():<left><left><left>
  autocmd FileType python :iabbrev <buffer> cls class():<left><left><left>
  autocmd FileType python :iabbrev <buffer> def def():<left><left><left>
  autocmd FileType python :iabbrev <buffer> cdef def(self):<left><left><left><left><left><left><left>
  autocmd FileType python :iabbrev <buffer> for for:<left>
  autocmd FileType python :iabbrev <buffer> if if:<left>
  autocmd FileType python :iabbrev <buffer> whl while:<left>
  autocmd FileType python :iabbrev <buffer> while while:<left>
  """ }}}
augroup END " }}}
augroup filetype_html
  autocmd!
  autocmd FileType html setlocal tabstop=2 shiftwidth=2
  autocmd FileType html setlocal nowrap
  autocmd FileType html setlocal cindent
  autocmd FileType html setlocal foldmethod=indent
  autocmd FileType html setlocal foldlevelstart=0
augroup END
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
augroup filetype_vue
	autocmd!
	autocmd FileType vue,javascript setlocal nowrap
	autocmd FileType vue,javascript setlocal tabstop=2 shiftwidth=2 expandtab
	autocmd FileType vue,javascript setlocal list
	autocmd FileType vue,javascript set filetype=js
augroup END
augroup filetype_yaml
  autocmd!
  autocmd FileType conf setlocal foldmethod=indent
  autocmd FileType conf setlocal foldlevelstart=0
  autocmd FileType conf setlocal autoindent
  autocmd FileType conf setlocal tabstop=4 shiftwidth=4
  autocmd FileType conf setlocal filetype=yaml
augroup END
