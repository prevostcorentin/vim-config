let mapleader=','
let localmapleader=';'

" INSERT mode {{{
  " Exit insert mode {{{
    inoremap jk <esc>
    inoremap Jk <esc>
    inoremap jK <esc>
    inoremap JK <esc>
  " }}}
  " Delete current line {{{
    inoremap <C-d> <esc>ddi
  " }}}
  " Move line down {{{
    inoremap <C-k> <esc>kddpki
  " }}}
  " Move line up {{{
    inoremap <C-j> <esc>ddpi
  " }}}
  " Capitalize current word {{{
    inoremap <C-u> <esc>viwU<esc>wi
  " }}}
" }}}
" NORMAL mode {{{
  " Buffers {{{
    nnoremap <F1> :bprev<cr>
    nnoremap <F2> :bnext<cr>
    nnoremap <F5> :buffers<cr>
  " }}}
  " Folding {{{
    nnoremap <leader>f :set foldlevel=0<cr>
    nnoremap <leader><S-f> :set foldlevel=50<cr>
  " }}}
  " Move {{{
    " Lines {{{
      " Line beginning {{{
        nnoremap H 0
      " }}}
      " Line end {{{
        nnoremap L $
      " }}}
    " }}}
  " }}}
  " Tabs {{{
    nnoremap <leader>k :tabnext<cr>
    nnoremap <leader>j :tabprev<cr>
    nnoremap <leader>t :tabnew<cr>
  " }}}
  " Viewports {{{
    " Create {{{
      nnoremap <C-s>l :rightbelow vnew<cr>
      nnoremap <C-s>h :leftabove vnew<cr>
      nnoremap <C-s>j :rightbelow new<cr>
      nnoremap <C-s>k :leftabove new<cr>
    " }}}
    " Move {{{
      " Up {{{
        nnoremap <C-k> <C-w>k
      " }}}
      " Down {{{
        nnoremap <C-j> <C-w>j
      " }}}
      " Right {{{
        nnoremap <C-l> <C-w>l
      " }}}
      " Left {{{
        nnoremap <C-h> <C-w>h
      " }}}
    " }}}
    " Resize {{{
      noremap <C-o> :vertical resize +5<cr>
      noremap <C-i> :vertical resize -5<cr>
      noremap <C-d> :resize +5<cr>
      noremap <C-c> :resize -5<cr>
    " }}}
  " }}}
  " Choose current word in visual mode {{{
    nnoremap <space> viw
  " }}}
  " Reload vimrc {{{
    nnoremap <leader>v :source $MYVIMRC<cr>
  " }}}
  " Save current buffer {{{
nnoremap <silent> ! :write<cr>
  " }}}
" }}}
