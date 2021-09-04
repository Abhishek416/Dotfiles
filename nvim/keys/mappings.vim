"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>
nnoremap <C-c> <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vs :vs<CR>
map <Leader>vh :sp<CR>
map <Leader>vv :Vifm<CR>
map <Leader>vq <C-w>q


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search in buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>bs :Buffers<CR>
map <Leader>bl :BLines<CR>
map <Leader>bb :Lines<CR>
map <Leader>bq :bd
" TAB in general mode will move to text buffer
nnoremap <TAB>   :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :vnew term://bash<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>


" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>
