" for gvim remove these
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
" ------------------------------------------------------------------------
" editor settings
set termguicolors
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
set splitbelow

" ------------------------------------------------------------------------
set rtp+=~/.config/nvim/autoload/plug.vim
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
call plug#end()

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
" autocomplete 
let g:ycm_global_ycm_extra_conf = '$HOME/config_files/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set backspace=indent,eol,start
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl', 're!GL'] }
"let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] } " gives autocomplete without the need to press C-Space
" autocompelte using omnisharp
 "let g:OmniSharp_server_use_mono = 1

" -----------------------------------------------------------------------------------------
" Nerd Tree file manager
let g:NERDTreeWinSize=60 
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
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
imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:split term://make && make run<CR>Gi
nmap <c-x><c-x> :update<CR>\|<Esc>:split term://make && make run<CR>Gi
ab shell :tabe term://.//bash

" ------------------------------------------------------------------------------
" UltiSnips stuff 
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['/$HOME/.config/nvim/UltiSnips', 'UltiSnips']

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

" -------------------------------------------------------------------------------
" spell check
set spellfile=~/.config/nvim/spell/en.utf-8.add

" -------------------------------------------------------------------------------
"changes cursor color between insert mode and normal mode - use this only when using vim and not nvim
"if &term =~ "xterm\\|urxvt"
  "" use an orange cursor in insert mode
  "let &t_SI = "\<Esc>]12;green\x7"
   "use a red cursor otherwise
  "let &t_EI = "\<Esc>]12;red\x7"
  "silent !echo -ne "\033]12;red\007"
   "reset cursor when vim exits
  "autocmd VimLeave * silent !echo -ne "\033]112\007"
  "" use \003]12;gray\007 for gnome-terminal and urxvt up to version 9.21
"endif
