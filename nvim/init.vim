" ------------------------------------------------------------------------
" set theruntime path to include Vundle and initialize
set hidden
set autochdir
set clipboard^=unnamed " This sets the clipboard as the default register. Useful for copy paste from tmux

set nocompatible " This tells vim not to act like it predecessor vi
syntax enable " enables syntax highlighting
"filetype off
filetype plugin indent on    " identify the kind of filetype automatically

set rtp+=~/.config/nvim/autoload/plug.vim
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'tikhomirov/vim-glsl'
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
"Plug 'OmniSharp/omnisharp-vim'  " autocomplete
call plug#end()
" -------------------------------------------------------------------------
set relativenumber
" prevent vim from giving a warning it the swp file is open 
set shortmess=A
"set foldmethod=syntax
set cursorline
set encoding=utf8
set ignorecase
set nobackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set virtualedit=onemore
set laststatus=0
" -----------------------------------------------------------------------------------------
" This sets the color scheme
set background=dark
colorscheme gruvbox

"set TERM=rxvt-unicode256color
" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]

" -----------------------------------------------------------------------------------------
" scrolling up and down multiple lines atonce
:nmap <c-j> +3
:vmap <c-j> +3
:nmap <c-k> -3
:vmap <c-k> -3

" -----------------------------------------------------------------------------------------
" autocomplete 
let g:ycm_global_ycm_extra_conf = '$HOME/config_files/nvim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
set backspace=indent,eol,start

" autocompelte using omnisharp
" let g:OmniSharp_server_use_mono = 1

" -----------------------------------------------------------------------------------------
" other editor settings
set number
set mouse=a
set tabstop=4
set shiftwidth=4

" -----------------------------------------------------------------------------------------
" Nerd Tree file manager
let g:NERDTreeWinSize=60 
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
" -----------------------------------------------------------------------------------------
" navigates to the next buffer
:nmap <c-n> :bnext<CR>
:nmap <c-p> :bprev<CR>
:ab Wq :wq
:ab W :w
:ab WQ :wq
:ab Q :q
:ab Ww :w
:ab wW :w
:set guitablabel=%t  " show only the file name an not the path 
:au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)

" start the terminal in the given path by typing :t on the minibuffer
:ab _terminal_ :!urxvt -bg black --geometry 85x47+683+0&\|<CR> 
:ab fpath :echo expand('%:p')
" -----------------------------------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" -----------------------------------------------------------------------------------------
" toggling between insert, normal and visual mode upon triple key press
:imap vv <Esc>v
:nmap vv <Esc>v
:imap <c-l> <Esc>la
:nmap <C-Right> e


" -----------------------------------------------------------------------------------------
" matching autopairs
"inoremap " ""<left>
"inoremap ' ''<left>

"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap () ()<left>
"inoremap [] []<left>
"inoremap {} {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


" ------------------------------------------------------------------------------
" terminal and make commands
" when using vim use this
":imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:!rxvt-unicode -bg black --geometry 85x47+683+0 -e sh -c "make && make run; bash"&<CR>\|<CR>  
":nmap <c-x><c-x> :update<CR>\|<Esc>:!rxvt-unicode -bg black --geometry 85x47+683+0 -e sh -c "make && make run; bash"&<CR>\|<CR>
:imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:!make && make run<CR>  
:nmap <c-x><c-x> :update<CR>\|<Esc>:!make && make run<CR>

" ------------------------------------------------------------------------------
" UltiSnips stuff 
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['/$HOME/.config/nvim/UltiSnips', 'UltiSnips']
" -------------------------------------------------------------------------------
" latex stuff 
filetype plugin on
filetype indent on
let g:tex_flavor='latex'

" -------------------------------------------------------------------------------
"changes cursor color between insert mode and normal mode - use this only when using vim and not nvim
"if &term =~ "xterm\\|urxvt"
  "" use an orange cursor in insert mode
  "let &t_SI = "\<Esc>]12;green\x7"
  "" use a red cursor otherwise
  "let &t_EI = "\<Esc>]12;red\x7"
  "silent !echo -ne "\033]12;red\007"
  "" reset cursor when vim exits
  "autocmd VimLeave * silent !echo -ne "\033]112\007"
  "" use \003]12;gray\007 for gnome-terminal and urxvt up to version 9.21
"endif

" -------------------------------------------------------------------------------
" remember where the cursor was in the previous session; not if the file is gitcommit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
	\ execute("normal `\"") |
\ endif


" -------------------------------------------------------------------------------
" highlight a TODO occurrence with bright red
:highlight TODO cterm=italic ctermfg=196 guifg=#ff0000
:match TODO /TODO/

" -------------------------------------------------------------------------------
" spell check
:set spellfile=~/.config/nvim/spell/en.utf-8.add

" -------------------------------------------------------------------------------
" vim aliases
:command Landslide e /home/ram/Dropbox/study/landslide
:command Tasklist e /home/ram/Dropbox/tasklist/tasklist.txt
:command Thesis e /home/ram/workarea/thesis/chapters

" -------------------------------------------------------------------------------
" quit the terminal upon pressing esc
":tnoremap <Esc> <C-\><C-n>

"autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
"set title
