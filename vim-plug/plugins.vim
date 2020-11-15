" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Nerdtree 
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'scrooloose/NERDTree'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    " Intelisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " LF
    Plug 'ptzz/lf.vim'
    Plug 'rbgrouleff/bclose.vim'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'   
    " Whichkey
    Plug 'liuchengxu/vim-which-key'
    " Floaterm 
    Plug 'voldikss/vim-floaterm'
    " Snippets
    Plug 'honza/vim-snippets'
    " Tmux Navigator
    Plug 'christoomey/vim-tmux-navigator'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
    " Surround
    Plug 'tpope/vim-surround'   
    " Start Screen
    Plug 'mhinz/vim-startify'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " Better Comments
    Plug 'tpope/vim-commentary'
    " Better tabline
    Plug 'mg979/vim-xtabline'


call plug#end()

" Install missing plugins on Vim startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
