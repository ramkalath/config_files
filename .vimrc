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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'evgenyzinoviev/vim-vendetta'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
" Plugin 'vim-latex/vim-latex'
call vundle#end()            " required
filetype plugin indent on    " required
"---------------------------------------------------------------------

" This enables the airline extension
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1 

"set background=light
set guifont=Monaco:h18
"let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let g:airline_left_alt_sep = '⟩'
let g:airline_right_alt_sep = '⟨'
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = ' '
let g:airline_right_alt_sep = '<'
let g:airline_right_sep = '<'
let g:airline_left_alt_sep= '>'
let g:airline_left_sep = '>'
" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" This sets the color scheme-----------------------------------------
colorscheme vendetta 
"--------------------------------------------------------------------

" This is for mapping ctrl-c, ctrl-v, ctrl-a------------------------
:vmap <C-c> "+y
:vmap <C-v> p
:nmap <C-a> ggVG
:vnoremap <C-X> "+x
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
:imap <c-w> <Esc>:w\|bd<cr>
:vmap <c-w> :w\|bd<cr>
:nmap <c-w> :w\|bd<cr>

" maps ctrl-o to open the files------------------------------------
:map <c-o> :NERDTree<CR> 
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
" save and close only current file not vim entirely
":ab wq :w\|bd
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
":imap <c-c><c-c> <Esc>:update<CR>\|<Esc>:!make<CR>
":nmap <c-c><c-c> :update<CR>\|<Esc>:!make<CR>
":imap <c-c><c-c><c-r> <Esc>:update<CR>\|<Esc>:!make && make run<CR>
":nmap <c-c><c-c><c-r> :update<CR>\|<Esc>:!make && make run<CR>
":imap <c-c><c-c><c-d> :update<CR>\|<Esc>:!make && make debug<CR>
":nmap <c-c><c-c><c-d> :update<CR>\|<Esc>:!make && make debug<CR>

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
