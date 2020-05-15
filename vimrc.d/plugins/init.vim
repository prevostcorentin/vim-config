echomsg "Loading external plugins ..."

call plug#begin() " {{{
  " Autocompletion {{{
    " Engine (Deactivated) {{{
    " Plug 'neoclide/coc.nvim'
    " }}}
    " Languages {{{ C# {{{
      " Plug 'OmniSharp/omnisharp-vim'
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
  Plug 'preservim/nerdtree'
  Plug 'vimplugin/project.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'vim-scripts/taglist.vim'
  " }}}
  " UI {{{
    " Fancy start screen {{{
    Plug 'mhinz/vim-startify'
    " }}}
    " Colorschemes {{{
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'NLKNguyen/papercolor-theme' " Comes with dark and light flavours
    Plug 'dracula/vim'
    Plug 'tomasiser/vim-code-dark'
    " }}}
  " }}}
  "python
  "Plug 'davidhalter/jedi-vim'
  "Plug 'vim-python/python-syntax'
  "Plug 'nvie/vim-flake8'
  "C/C++
  " Plug 'vim-scripts/OmniCppComplete'
  Plug 'octol/vim-cpp-enhanced-highlight'
  "misc
  "javascript
  Plug 'posva/vim-vue'
call plug#end() " }}}

runtime plugins/imports.vim
