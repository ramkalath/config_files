" set theruntime path to include Vundle and initialize--------------
set hidden
set autochdir
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
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
call vundle#end()            " required
filetype plugin indent on    " required
"---------------------------------------------------------------------
" prevent vim from giving a warning it the swp file is open
set shortmess=A
"---------------------------------------------------------------------

 "This enables the airline extension
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_theme='solarized'
let g:airline#extensions#tabline#fnamemod = ':t'

" This sets the color scheme-----------------------------------------
"enable syntax highlighting
syntax enable
colorscheme solarized8_dark
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
"--------------------------------------------------------------------
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = "~/home/$USER/.vim/bundle/YouCompleteMe"
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
set completeopt-=preview
"let g:ycm_show_diagnostics_ui = 0
"'/home/ram/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_config.py'
" This is for mapping ctrl-c, ctrl-v, ctrl-a------------------------
:vmap <C-c> "*y
:nmap <C-v> "*p
:nmap <C-a> ggVG
:vnoremap <C-X> "+x
set backspace=indent,eol,start
"-------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]

" this is for ctrl-s saving both in insert and normal mode----------
:nmap <c-s> :w<CR>
:inoremap <c-s> <c-o>:update<CR>
"-------------------------------------------------------------------
" :imap <c-z> <Esc>:u<CR>\|i
" scrolling up and down multiple lines atonce-----------------------
:nmap <c-up> -3
:nmap <c-down> +3
:vmap <c-up> -3
:vmap <c-down> +3
"-------------------------------------------------------------------

" other editor settings---------------------------------------------
set number
set mouse=a

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
:imap <c-w> <Esc>:w\|bd<cr>
:vmap <c-w> :w\|bd<cr>
:nmap <c-w> :w\|bd<cr>
" Tab navigation like Firefox.

" save and close only current file not vim entirely
:ab Wq :wq
:set guitablabel=%t
:au FocusLost * :wa  " save when focus is lost
"-----------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>
"-----------------------------------------------------------------
" toggling between insert, normal and visual mode upon triple key press
:imap vv <Esc>v
:nmap vv <Esc>v
:vmap ii <Esc>i
:nmap ii <Esc>i

"for compiling, running and debugging press ctrl cc, ctrl ccr, ctrl ccd. It
"autosaves.
:imap <c-c><c-c> <Esc>:update<CR>\|<Esc>:!make<CR>
:nmap <c-c><c-c> :update<CR>\|<Esc>:!make<CR>
:imap <c-x><c-x> <Esc>:update <CR>\|<Esc>:!make run<CR>
:nmap <c-x><c-x> :update<CR>\|<Esc>:!make run<CR>
" lets add other simple features to this vimrc file
:imap qq <Esc>:
:vmap qq <Esc>:
:nmap qq <Esc>:
:vmap <Tab> >gv
:vmap <S-Tab> <gv
"-----------------------------------------------------------------
" once the header trigger is entered, ultisnips expands when enter is pressed
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
"-----------------------------------------------------------------
" short cut to open tasklist
:ab tasklist :e ~/Dropbox/tasklist/tasklist.txt
:ab _find /
:map <C-r> :%s!<!\&lt;!<cr>:%s!>!\&gt;!<cr>
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
" scroll line by display rather than line by linebreaks
:nnoremap j gj
:nnoremap k gk
:vnoremap j gj
:vnoremap k gk
:nnoremap <Down> gj
:nnoremap <Up> gk
:vnoremap <Down> gj
:vnoremap <Up> gk
:inoremap <Down> <C-o>gj
:inoremap <Up> <C-o>gk
"------------------------------------------------------------------
" in normal mode we cant navigate after the end of the line. This enables us
" to move a character after the end of the line.
set virtualedit=onemore 
":nnoremap <leader>ri :RunInInteractiveShell<space>

