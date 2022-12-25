set background=light
colorscheme PaperColor
let g:airline_theme = 'papercolor'
set mouse=a

if has('gui')
    set guioptions=
    if has('win32')
        set guifont=Lucida_Console:h22:cANSI:qDRAFT
    else
        set guifont=Source\ Code\ Pro\ Light\ 22,Hack,Monospace
    endif
endif
