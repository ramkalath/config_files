set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'eparreno/vim-l9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/UltiSnips'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/Son-of-Obisidian'
"Plugin 'vim-scripts/CSApprox'
"Plugin 'evgenyzinoviev/vim-vendetta'
"Plugin 'vim-scripts/Solarized'
"Plugin 'gosukiwi/vim-atom-dark'
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible hidden backspace=indent,eol,start
set history=5000 undofile undolevels=1000 undoreload=10000
filetype plugin on
syntax enable

let g:ycm_global_ycm_extra_conf = "/home/ram/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


map <c-t> :FufFile **/<CR>

set tabstop=4
set autoindent
syntax enable
set clipboard=unnamedplus
set guioptions+=a
set number
set runtimepath^=/home/ram/.vim/bundle/vim-nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim
set mouse=a

set term=screen-256color
colorscheme desert

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

:au FocusLost * silent! wa
:set autowriteall

:vmap <C-c> "+y
:vmap <C-v> p
:nmap <C-a> ggVG
:vnoremap <C-X> "+x


