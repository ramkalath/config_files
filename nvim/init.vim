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
Plug 'tikhomirov/vim-glsl'
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
call plug#end()
" -------------------------------------------------------------------------
:set relativenumber
" prevent vim from giving a warning it the swp file is open 
set shortmess=A
"set foldmethod=syntax
set cursorline
set encoding=utf8
set ignorecase
set nobackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set virtualedit=onemore

" -----------------------------------------------------------------------------------------
set laststatus=0
" -----------------------------------------------------------------------------------------
" This sets the color scheme
set background=dark
colorscheme gruvbox

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
" deoplete autocomplete 
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <C-Space> <C-x><C-o>
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std#cpp = 'c++11'
"set completeopt+=noinsert
"set completeopt=longest,menuone,preview,noinsert
set backspace=indent,eol,start

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
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '>'

" -----------------------------------------------------------------------------------------
" navigates to the next buffer
:nmap <c-n> :bnext<CR>
:nmap <c-p> :bprev<CR>
:ab Wq :wq
:ab W :w
:ab WQ :wq
:ab Q :q
:set guitablabel=%t  " show only the file name an not the path 
:au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)

" start the terminal in the given path by typing :t on the minibuffer
:ab _terminal_ :!urxvt -bg black --geometry 85x47+683+0&\|<CR> 
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


set iskeyword-=_

