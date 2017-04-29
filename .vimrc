" set the runtime path to include Vundle and initialize--------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'evgenyzinoviev/vim-vendetta'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
call vundle#end()            " required
filetype plugin indent on    " required
"---------------------------------------------------------------------

" This enables the airline extension
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" This sets the color scheme-----------------------------------------
colorscheme vendetta 
"--------------------------------------------------------------------


" This is for mapping ctrl-c, ctrl-v, ctrl-a------------------------
:vmap <C-c> "+y
:vmap <C-v> p
:nmap <C-a> ggVG
:vnoremap <C-X> "+x
"-------------------------------------------------------------------


" this is for ctrl-s saving both in insert and normal mode----------
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>
"-------------------------------------------------------------------

" scrolling up and down multiple lines atonce-----------------------
:nmap <c-up> -10
:nmap <c-down> +10
:vmap <c-up> -10
:vmap <c-down> +10
"-------------------------------------------------------------------


" other editor settings---------------------------------------------
set tabstop=4
set number
set mouse=a

"file manager------------------------------------------------------
" Increased NERDTree window size
let g:NERDTreeWinSize=80 
" navigates to the next buffer
:ab n :bnext
" navigates to the previous buffer
:ab p :bprevious
" maps ctrl-o to open the files------------------------------------
:map <c-o> :NERDTree<CR> 
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
" next line kill the open tab
:ab k :bd
"-----------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>
"-----------------------------------------------------------------
