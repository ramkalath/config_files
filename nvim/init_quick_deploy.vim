" for gvim remove these
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
" ------------------------------------------------------------------------
" editor settings
set hidden "unsaved buffer wont close when opening a new buffer/file
set autochdir "keep up with the directory path when changing files
set clipboard^=unnamed "This sets the clipboard as the default register. Useful for copy paste from tmux
set nocompatible "This tells vim not to act like it predecessor vi
syntax enable "enables syntax highlighting
set number " displays line number
set relativenumber
set shortmess=A "prevent vim from giving a warning it the swp file is open 
set cursorline
set encoding=utf8
set ignorecase
set nobackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set virtualedit=onemore "cursor goes one more position than the usual
set laststatus=0
set mouse=a "sane selection without line numbers
set tabstop=4
set shiftwidth=4
filetype plugin indent on "identify the kind of filetype automatically
set listchars=tab:\|\ 
set list

" ------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdcommenter'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'morhetz/gruvbox'
call vundle#end()            " required

" -----------------------------------------------------------------------------------------
" This sets the color scheme
set background=dark
colorscheme gruvbox
let g:gruvbox_italic='1'
let g:gruvbox_italicize_comments='1'
" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,] "(TODO: check what this does)

" -----------------------------------------------------------------------------------------
" scrolling up and down multiple lines atonce
nmap <c-j> +3
vmap <c-j> +3
nmap <c-k> -3
vmap <c-k> -3

" -----------------------------------------------------------------------------------------
" keyboard shortcuts 
"nmap <c-n> :bnext<CR>
"nmap <c-p> :bprev<CR>
nmap <c-n> :tabnext<CR>
nmap <c-p> :tabprevious<CR>
ab Wq :wq
ab W :w
ab WQ :wq
ab Q :q
ab Ww :w
ab wW :w
ab WW :w
set guitablabel=%t  " show only the file name an not the path 
au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)
imap vv <Esc>v
nmap vv <Esc>v
imap <c-l> <Esc>la
ab e tabedit
set showtabline=2

" start the terminal in the given path by typing :t on the minibuffer
ab _terminal_ :!urxvt +bl -bg black --geometry 85x47+683+0&\|<CR> 
ab fpath :echo expand('%:p')

" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" terminal and make commands
tnoremap <Esc> <C-\><C-n>
imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:split term://make && make run<CR>Gi<Esc><C-w><C-r>
nmap <c-x><c-x> :update<CR>\|<Esc>:split term://make && make run<CR>Gi<Esc><C-w><C-r>
ab shell :tabe term://.//bash

" -------------------------------------------------------------------------------
" remember where the cursor was in the previous session; not if the file is gitcommit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
	\ execute("normal `\"") |
\ endif

" -------------------------------------------------------------------------------
" highlight a TODO occurrence in bright red
highlight TODO cterm=italic ctermfg=196 guifg=#ff0000
match TODO /TODO/

