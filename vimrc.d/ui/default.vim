if has('gui')
    set guioptions=
    let g:airline_theme = 'papercolor'
    set background=dark
    colorscheme dracula
    let g:airline_theme = 'dark'

    if has('win32')
        set guifont=Lucida_Console:h11:cANSI:qDRAFT
    else
        set guifont=Source\ Code\ Pro\ Light\ 12,Hack,Monospace
    endif
else
    set background=light
    colorscheme dracula
endif
" Misc {{{
if !has('gui')
  " enable full mouse support
  set mouse=a
endif
" }}}
