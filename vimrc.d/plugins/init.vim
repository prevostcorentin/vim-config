echomsg "Loading external plugins ..."

call plug#begin() " {{{
  "status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  "file/Project browsing
  Plug 'vimplugin/project.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'vim-scripts/taglist.vim'
  "python
  Plug 'davidhalter/jedi-vim'
  Plug 'vim-python/python-syntax'
  Plug 'nvie/vim-flake8'
  "C/C++
  Plug 'vim-scripts/OmniCppComplete'
  Plug 'octol/vim-cpp-enhanced-highlight'
  "C#
  Plug 'OmniSharp/omnisharp-vim'
  "misc
  Plug 'mhinz/vim-startify'
  "colorschemes
  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'dracula/vim'
  Plug 'tomasiser/vim-code-dark'
  "javascript
  Plug 'posva/vim-vue'
  "navigation
  Plug 'preservim/nerdtree'
call plug#end() " }}}

runtime plugins/imports.vim
