" ------------------------------------------------------------------------
" set theruntime path to include Vundle and initialize
set hidden
set autochdir
set cursorline
set nocompatible " This tells vim not to act like it predecessor vi
syntax enable " enables syntax highlighting
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'tikhomirov/vim-glsl'
"Plug 'gosukiwi/vim-atom-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'matze/vim-tex-fold'
Plug 'morhetz/gruvbox'
"Plug 'romainl/flattened'
call plug#end()

filetype plugin indent on    " required

" -------------------------------------------------------------------------
"" prevent vim from giving a warning it the swp file is open 
"set shortmess=A
"set encoding=utf8
set ignorecase
set nobackup
" -------------------------------------------------------------------------
" inserts an automatic header for c, cpp, h and hpp files and modifies the time 
function! s:insert_description()
	let template = "$HOME/config_files/nvim/UltiSnips/cpp.template"
	let file_name = expand("%:t") " Get file name without path
	let date = strftime(strftime('%c')) " Get the current year in format YYYY
	let i = 0
	for line in readfile(template)
		let line = substitute(line, "<file_name>", file_name, "ge")
		let line = substitute(line, "<date>", date, "ge")
		call append(i, line)
		let i += 1
	endfor
	execute "normal! Go\<Esc>k"
endfunction
autocmd BufNewFile *.{c++,cpp,cc,c,h,hpp} call <SID>insert_description()

" ----------------------------------------------------------------------------------------
" inserts an automatic header for python files and modifies the time
function! s:insert_description_py()
	let template = "$HOME/config_files/nvim/UltiSnips/python.template"
	let file_name = expand("%:t") " Get file name without path
	let date = strftime(strftime('%c')) " Get the current year in format YYYY
	let i = 0
	for line in readfile(template)
		let line = substitute(line, "<file_name>", file_name, "ge")
		let line = substitute(line, "<date>", date, "ge")
		let line = substitute(line, "<modified_date>", date, "ge")
		call append(i, line)
		let i += 1
	endfor
	execute "normal! Go\<Esc>k"
endfunction
autocmd BufNewFile *.py call <SID>insert_description_py()

" -----------------------------------------------------------------------------------------
" This enables the airline extension 
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_theme='angr'
let g:airline#extensions#tabline#fnamemod = ':t'

" -----------------------------------------------------------------------------------------
" This sets the color scheme
set background=dark
"colorscheme solarized
"colorscheme atom-dark-256
colorscheme gruvbox
" -----------------------------------------------------------------------------------------
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

" -----------------------------------------------------------------------------------------
" youcomplete me configurations
let g:ycm_global_ycm_extra_conf = '$HOME/config_files/nvim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_confirm_extra_conf = 0
"set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1
set backspace=indent,eol,start

" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]
" -----------------------------------------------------------------------------------------
" scrolling up and down multiple lines atonce
:nmap <c-j> +3
:vmap <c-j> +3
:nmap <c-k> -3
:vmap <c-k> -3
:nmap <c-Up> -3
:nmap <c-Down> +3
:vmap <c-Up> -3
:nmap <c-Down> +3

" -----------------------------------------------------------------------------------------
" other editor settings
set number
set mouse=a
set tabstop=4
set shiftwidth=4
set list lcs=tab:\¦\ 
" -----------------------------------------------------------------------------------------
" Nerd Tree file manager
let g:NERDTreeWinSize=60 
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" -----------------------------------------------------------------------------------------
" navigates to the next buffer
:nmap <c-n> :bnext<CR>
:nmap <c-p> :bprev<CR>
:ab Wq :wq
:ab W :w
:set guitablabel=%t  " show only the file name an not the path 
:au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)

" -----------------------------------------------------------------------------------------
" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" -----------------------------------------------------------------------------------------
" toggling between insert, normal and visual mode upon triple key press
:imap vv <Esc>v
:nmap vv <Esc>v
:imap <c-l> <Esc>la
:nmap <c-l> e
:nmap <c-h> b
:imap jj <Esc>
:imap <c-c><c-c> <Esc>:update<CR>\|<Esc>:!make<CR>  
:nmap <c-c><c-c> :update<CR>\|<Esc>:!make<CR>
:imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:!make && make run<CR>
:nmap <c-x><c-x> :update<CR>\|<Esc>:!make && make run<CR>
:nmap <C-Right> e

" -----------------------------------------------------------------------------------------
" UltiSnips stuff 
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['/$HOME/config_files/nvim/UltiSnips', 'UltiSnips']

" -----------------------------------------------------------------------------------------
" latex stuff 
filetype plugin on
filetype indent on
let g:tex_flavor='latex'

" -----------------------------------------------------------------------------------------
set virtualedit=onemore
