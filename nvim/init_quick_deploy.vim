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
set encoding=utf8
set ignorecase
set nobackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set laststatus=0
set mouse=a "sane selection without line numbers
set tabstop=4
set shiftwidth=4
filetype plugin indent on "identify the kind of filetype automatically
:set listchars=tab:\|\ 
:set list

colorscheme morning

" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,] "(TODO: check what this does)

" -----------------------------------------------------------------------------------------
" scrolling up and down multiple lines atonce
:nmap <c-j> +3
:vmap <c-j> +3
:nmap <c-k> -3
:vmap <c-k> -3

" -----------------------------------------------------------------------------------------
" keyboard shortcuts 
:nmap <c-n> :bnext<CR>
:nmap <c-p> :previous<CR>
:ab Wq :wq
:ab W :w
:ab WQ :wq
:ab Q :q
:ab Ww :w
:ab wW :w
:ab WW :w
:set guitablabel=%t  " show only the file name an not the path 
:au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)
:imap vv <Esc>v
:nmap vv <Esc>v
:imap <c-l> <Esc>la

" terminal and make commands
:tnoremap <Esc> <C-\><C-n>
:imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:split term://make && make run<CR>Gi
:nmap <c-x><c-x> :update<CR>\|<Esc>:split term://make && make run<CR>Gi
:ab shell :tabe term://.//bash
" -------------------------------------------------------------------------------
" remember where the cursor was in the previous session; not if the file is gitcommit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
	\ execute("normal `\"") |
\ endif

" -------------------------------------------------------------------------------
" highlight a TODO occurrence in bright red
:highlight TODO cterm=italic ctermfg=196 guifg=#ff0000
:match TODO /TODO/
" -------------------------------------------------------------------------------
