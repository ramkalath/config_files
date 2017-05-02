" set the runtime path to include Vundle and initialize--------------
set hidden
set autochdir
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
Plugin 'vim-latex/vim-latex'
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
:imap <c-s> <Esc>:w<CR>\|i
"-------------------------------------------------------------------
:imap <c-z> <Esc>:u<CR>\|i
" scrolling up and down multiple lines atonce-----------------------
:nmap <c-up> -3
:nmap <c-down> +3
:vmap <c-up> -3
:vmap <c-down> +3
"-------------------------------------------------------------------

" other editor settings---------------------------------------------
set tabstop=4
set number
set mouse=a

"file manager------------------------------------------------------
" Increased NERDTree window size
let g:NERDTreeWinSize=80 
" navigates to the next buffer
:imap <c-t> :bnext<CR>
:vmap <c-t> :bnext<CR>
:nmap <c-t> :bnext<CR>
:imap <c-w> :w\|bd<cr>
:vmap <c-w> :w\|bd<cr>
:nmap <c-w> :w\|bd<cr>

" maps ctrl-o to open the files------------------------------------
:map <c-o> :NERDTree<CR> 
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
" save and close only current file not vim entirely
:ab wq :w\|bd
"-----------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>
"-----------------------------------------------------------------
" toggling between insert and visual mode upon triple key press
:imap vvv <Esc>v
:nmap vvv <Esc>v
:vmap iii <Esc>i
:nmap iii <Esc>i
"-----------------------------------------------------------------
" once the header trigger is entered, ultisnips expands when enter is pressed
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
"-----------------------------------------------------------------
" short cut to open tasklist
:ab tasklist :e ~/Dropbox/tasklist/tasklist.txt
"----------------------------------------------------------------

