" set theruntime path to include Vundle and initialize--------------
set hidden
set autochdir
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lifepillar/vim-solarized8'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'evgenyzinoviev/vim-vendetta'
Plugin 'tikhomirov/vim-glsl'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'gosukiwi/vim-atom-dark'
call vundle#end()            " required
filetype plugin indent on    " required
"---------------------------------------------------------------------
" prevent vim from giving a warning it the swp file is open
set shortmess=A
" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│
set ignorecase

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" remove autocomment in the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"---------------------------------------------------------------------
let g:ctrlp_show_hidden = 1
:nmap <c-t> :CtrlP ~/<CR>

 "This enables the airline extension
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#fnamemod = ':t'

" This sets the color scheme-----------------------------------------
"enable syntax highlighting
syntax enable
"colorscheme vendetta
"colorscheme solarized8_dark
"colorscheme sonofobsidian
colorscheme atom-dark-256
"--------------------------------------------------------------------
" This sets the relative numbering scheme
function! ToggleRelativeNumber()
	if &relativenumber
	   set norelativenumber
	else
	   set relativenumber
	endif
endfunction

nmap ;r :call ToggleRelativeNumber()<CR>
set relativenumber
"--------------------------------------------------------------------
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = "~/home/$USER/.vim/bundle/YouCompleteMe"
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
"let g:ycm_show_diagnostics_ui = 0
"'/home/ram/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_config.py'
" This is for mapping ctrl-c, ctrl-v, ctrl-a------------------------
":nmap <C-a> ggVG
set backspace=indent,eol,start
"-------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]

" this is for ctrl-s saving both in insert and normal mode----------
":nmap <c-s> :w<CR>
":inoremap <c-s> <c-o>:update<CR>
"-------------------------------------------------------------------
" :imap <c-z> <Esc>:u<CR>\|i
" scrolling up and down multiple lines atonce-----------------------
:nmap <c-k> -3
:nmap <c-j> +3
:vmap <c-k> -3
:vmap <c-j> +3
:nmap <c-Up> -3
:nmap <c-Down> +3
:vmap <c-Up> -3
:nmap <c-Down> +3
"-------------------------------------------------------------------

" other editor settings---------------------------------------------
set number
set mouse=a
set tabstop=4
"file manager------------------------------------------------------
" Increased NERDTree window size
let g:NERDTreeWinSize=60 

map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" -----------------------------------------------------------------

" navigates to the next buffer
:vmap gt :bnext<CR>
:nmap gt :bnext<CR>

" save and close only current file not vim entirely
:ab Wq :wq
:set guitablabel=%t  " show only the file name an not the path 
:au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)
"-----------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>
"-----------------------------------------------------------------
" toggling between insert, normal and visual mode upon triple key press
:imap vv <Esc>v
:nmap vv <Esc>v
"for compiling, running and debugging press ctrl cc, ctrl ccr, ctrl ccd. It
"autosaves.
:imap <c-c><c-c> <Esc>:update<CR>\|<Esc>:!make<CR>
:nmap <c-c><c-c> :update<CR>\|<Esc>:!make<CR>
:imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:!make && make run<CR>
:nmap <c-x><c-x> :update<CR>\|<Esc>:!make && make run<CR>
"-----------------------------------------------------------------
:nmap <C-Right> e
" once the header trigger is entered, ultisnips expands when enter is pressed
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['/home/ram/.config/nvim/UltiSnips', 'UltiSnips']
"-----------------------------------------------------------------
" short cut to open tasklist
:ab tasklist :e ~/Dropbox/tasklist/tasklist.txt
:ab _find /
"----------------------------------------------------------------
" some vim-latex stuff that they said is necessary to be put in bashrc--------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"-------------------------------------------------------------------
" in normal mode we cant navigate after the end of the line. This enables us
" to move a character after the end of the line.
set virtualedit=onemore 
":nnoremap <leader>ri :RunInInteractiveShell<space>

