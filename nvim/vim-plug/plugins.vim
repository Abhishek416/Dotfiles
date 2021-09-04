" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
"{{ The Basic }}
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'mhinz/vim-startify'

"{{ Web development pins }}
    Plug 'alvan/vim-closetag' 
    Plug 'mattn/emmet-vim'
"{{ Productivity }}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"{{ Themes }}
    Plug 'joshdick/onedark.vim'
"{{ File Explorer }}
    Plug 'scrooloose/NERDTree'
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
    Plug 'vifm/vifm.vim'                               " Vifm

call plug#end()
