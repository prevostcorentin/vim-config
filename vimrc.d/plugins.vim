echomsg "Loading external plugins ..."
call plug#begin() " {{{
  " Autocompletion {{{
    " Engine {{{
      " Prerequisite for ncm2 (for which purpose ?)
      Plug 'roxma/nvim-yarp'
      Plug 'ncm2/ncm2'
      Plug 'ncm2/ncm2-jedi'
      Plug 'ncm2/ncm2-bufword'
      Plug 'ncm2/ncm2-path'
    " }}}
    " Languages {{{
      " C# {{{
        " Plug 'OmniSharp/omnisharp-vim'
      " }}}
      " C++ {{{
        " Plug 'vim-scripts/OmniCppComplete'
      " }}}
      " Python {{{
        Plug 'davidhalter/jedi-vim'
      " }}}
    " }}}
  " }}}
  " Syntax highlighting {{{
    Plug 'sheerun/vim-polyglot'
  " }}}
  " Status line {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
  " }}}
  " Git integration {{{
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
  " }}}
  " File browsing {{{
    Plug 'kien/ctrlp.vim'
    Plug 'vim-scripts/taglist.vim'
  " }}}
  " UI {{{
    " Fancy start screen {{{
      Plug 'mhinz/vim-startify'
    " }}}
    " Colorschemes {{{
      Plug 'NLKNguyen/papercolor-theme' " Comes with dark and light flavours
    " }}}
  " }}}
  " Code highlighting {{{
    " C/C++ {{{
      Plug 'octol/vim-cpp-enhanced-highlight'
    " }}}
    " JavaScript {{{
      Plug 'posva/vim-vue'
    " }}}
    " Python {{{
      Plug 'vim-python/python-syntax'
    " }}}
  " }}}
  " Syntax checker {{{
    Plug 'nvie/vim-flake8'
  " }}}
call plug#end() " }}}
" External plugins settings {{{
" davidhalter/jedi-vim {{{
  let g:jedi#auto_initialization = 1
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#smart_auto_mappings = 0
  let g:jedi#popup_on_dot = 0
  let g:jedi#completions_command = ""
  let g:jedi#show_call_signatures = 1
" }}}
" ncm2/ncm2 {{{
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " Use fuzzy based matches
  let g:ncm2#matcher = 'substrfuzzy'
" }}}
  " octol/vim-cpp-enhanced-highlight {{{
    let g:cpp_class_scope_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_class_scope_highlight = 1
  " }}}
  " octol/vim-cpp-enhanced-highlight {{{
    let g:cpp_class_scope_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_class_scope_highlight = 1
  " }}}
  " vim-python/python-syntax {{{
    let g:python_highlight_all = 1
  " }}}
  " tpope/vim-fugitive {{{
    let g:fugitive_git_command='git'
  " }}}
" }}}
