set belloff=all
set guioptions+=!
" editor settings
set nocompatible             
set hidden "unsaved buffer wont close when opening a new buffer/file
set autochdir "keep up with the directory path when changing files
set backspace=indent,eol,start "backspace in insert mode does not work without this
set clipboard^=unnamed "This sets the clipboard as the default register. Useful for copy paste from tmux
syntax enable "enables syntax highlighting
" set number " displays line number
" set relativenumber
set shortmess=A "prevent vim from giving a warning it the swp file is open 
set encoding=utf8
set ignorecase
set nobackup
set virtualedit=onemore "cursor goes one more position than the usual
set laststatus=0
set ruler
set mouse=a "sane selection without line numbers
set tabstop=4
set shiftwidth=4
filetype plugin indent on "identify the kind of filetype automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set nolist
set nowrap
set number
set splitbelow
set splitright

" -----------------------------------------------------------------------------------------------------
" colorschemes and fonts and appearence related stuff
colorscheme habamax 
highlight LineNr ctermbg=black ctermfg=darkgray
if has("gui_running")
	winpos 942 0
	set lines=110 columns=200
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	highlight Normal guifg=grey guibg=#031000
	highlight Comment cterm=italic gui=italic
	highlight Visual guibg=#aaaaaa guifg=#000000 gui=None 
	highlight Cursor guifg=#000000 guibg=#00FF00
	highlight LineNr guifg=#888888
	set laststatus=2
	set statusline=
	set statusline+=\ %f " filename
	set statusline+=\ %m " indicate if file is modified
	set statusline+=%= " move everything to the right
	set statusline+=\ %y " filetype
	set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " file encoding
	set statusline+=\[%{&fileformat}\] " file format
	set statusline+=\ %p%% " percentage file progress at cursor point
	set statusline+=\ %{v:servername} 
	set statusline+=\  
	highlight Pmenu ctermbg=black ctermfg=darkgrey guibg=#333333 guifg=white
	highlight PmenuSel ctermbg=blue ctermfg=black guibg=#000000 guifg=black
	set noerrorbells visualbell t_vb=
	autocmd GUIEnter * set visualbell t_vb=
	set guifont=Liberation\ Mono\ Regular\ 10
	set background=dark
	highlight Normal guibg=#171717
	highlight Cursor guibg=#00FF00 guifg=#000000
	highlight StatusLineNC guibg=#111111 guifg=#888888
	highlight VertSplit guibg=NONE guifg=red
	highlight TabLineSel guifg=#111111 guibg=#F0F0B9
	highlight TabLine guifg=#111111 guibg=#52523F
	highlight TabLineFill guifg=#111111 guibg=#222222
	set fillchars=vert:│ 
	highlight Terminal guifg=#AAAAAA guibg=#000000
	cnoremap hterm <Esc>:term ++rows=20
	cnoremap vterm <Esc>:vert term
	nmap <c-x><c-j> <Esc>:term ++rows=20<CR>make<CR>
	nmap <c-x><c-l> <Esc>:vert term<CR>make<CR>
endif

if has('win32')
	set guifont=Consolas:h11
	set noerrorbells visualbell t_vb=
	autocmd GUIEnter * set visualbell t_vb=
endif
" -----------------------------------------------------------------------------------------------------
" PLUGIN SECTION - comment this if you dont want plugin support
set runtimepath+=~/.vim/bundle/Vundle.vim
if has('win32')
	set runtimepath+=%userprofile%\.vim\bundle\Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ap/vim-buftabline'
Plugin 'Valloric/YouCompleteMe' " c++ auto completion
Plugin 'nvie/vim-flake8' " python auto completion
Plugin 'dense-analysis/ale' " python auto completion
Plugin 'moll/vim-bbye' " split management
call vundle#end()

" ycm section
let g:ycm_global_ycm_extra_conf = "C:/Users/ramknara/.vim/.ycm_extra_conf.py"
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
set backspace=indent,eol,start
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl', 're!GL'] }
let g:ycm_filetype_blacklist = { 'cuda': 1 }
nmap gd <Esc>:YcmCompleter GoTo<CR>

" python linting;
" pip install flake8
" we also need to add the path of flake8.exe to the path variable - C:\Users\uname\AppData\Roaming\Python\Python312\Scripts
let python_highlight_all=1
let g:ale_linters = {'python': ['flake8']}

" press // for comment using nerd commenter
nmap // <leader>c<space>
vmap // <leader>c<space>

" -----------------------------------------------------------------------------------------------------

" SHORTCUTS
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,] "(TODO: check what this does)

" scrolling up and down multiple lines atonce
nmap <c-j> +3
vmap <c-j> +3
nmap <c-k> -3
vmap <c-k> -3

" keyboard shortcuts 
nmap <c-n> :bnext<CR>
nmap <c-p> :bprevious<CR>

cnoreabbrev bd :<C-U>bprevious <bar> Bdelete #<CR>
cnoreabbrev Wq :wq
cnoreabbrev w :w
cnoreabbrev W :w
cnoreabbrev WQ :wq
cnoreabbrev Q :q
cnoreabbrev Ww :w
cnoreabbrev wW :w
cnoreabbrev WW :w
" set guitablabel=%t  " show only the file name an not the path 
au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)
imap vv <Esc>v
nmap vv <Esc>v
imap <c-l> <Esc>la
cnoreabbrev tasklist <Esc>:e ~/workarea/tasklist.md

" -----------------------------------------------------------------------------------------------------
" Explorer like emacs split
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 40
let g:NetrwIsOpen=0

function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr("$")
		while (i >= 1)
			if (getbufvar(i, "&filetype") == "netrw")
				silent exe "bwipeout " . i 
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		silent Vexplore
	endif
endfunction
noremap <silent> <C-f> :call ToggleNetrw()<CR>
" -----------------------------------------------------------------------------------------------------

cnoremap <expr> ls<CR> (getcmdtype() == ':' && getcmdpos() == 1) ? "ls\<CR>:b" : "ls"

" change cursor shape to I cursor in insert mode and block cursor in normal
" mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
set ttimeoutlen=0

" directory path can be obtained by typing fpath
cnoreabbrev fpath :echo expand('%:p')<CR>

" remember where the cursor was in the previous session; not if the file is gitcommit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
	\ execute("normal `\"") |
\ endif

" highlight a TODO occurrence in red and DONE in green
"highlight TODO cterm=italic ctermbg=red
"highlight DONE cterm=italic ctermfg=green ctermbg=black
highlight TODO cterm=italic guibg=red guifg=#171717
highlight DONE cterm=italic guifg=green guibg=#171717
match TODO /TODO/
match DONE /DONE/

" abbreviations
iab _todo TODO(ram):
iab _done DONE(ram):
iab <expr> _date strftime("%d-%b-%Y")
iab <expr> _today strftime("%d-%b-%Y")

" comments ctrl-c to comment and shift-c to uncomment
autocmd BufNewFile,BufRead,BufEnter *.sh,*.py,Makefile,makefile,CMakeLists.txt map <c-c> :s/^/# /<CR> | map <s-c> :s/# //<CR>
autocmd BufNewFile,BufRead,BufEnter *.c,*.cpp,*.h,*.hpp,*.vert,*.vs,*.frag,*.fs map <c-c> :s/^/\/\/ /<CR> | map <s-c> :s/\/\/\ //<CR>
autocmd BufNewFile,BufRead,BufEnter *.vimrc map <c-c> :s/^/" /<CR> | map <s-c> :s/" //<CR>
autocmd BufNewFile,BufRead,BufEnter *.tex map <c-c> :s/^/% /<CR> | map <s-c> :s/% //<CR>

" ###############################################################################################################################################################################
" SNIPPETS
" python snippets -----------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.py inoremap <F5> <C-R>=PyHeaders()<CR>
func! PyHeaders()
	call complete(col('.'), ['_pytemplate', '_pyheader'])
    return ''
endfunc
autocmd BufNewFile,BufRead *.py iab <expr> _pyheader strftime("# Author: Ramkumar Narayanan<CR># Date: %d-%b-%Y<CR># Email: ramkalath@gmail.com<CR># Program Description:<CR>")
autocmd BufNewFile,BufRead *.py iab _pytemplate if __name__ == "__main__":

" latex snippets -----------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.tex inoremap <F5> <C-R>=LatexTriggers()<CR>
func! LatexTriggers()
    call complete(col('.'), ['_latextemplate', '_figureheader', '_figureone', '_figuremany', '_codeheader', '_code', 
				\ '_terminalcode', '_itemize', '_enumerate', '_hyperlinkheader'])
    return ''
endfunc
autocmd BufNewFile,BufRead *.tex iab <buffer> _latextemplate \documentclass[10pt]{article}<CR>\usepackage[letterpaper, portrait, margin=0.5in]{geometry}<CR>\usepackage[colorlinks = true, linkcolor = cyan, urlcolor  = cyan, citecolor = blue, anchorcolor = blue]{hyperref}<CR><CR>\begin{document}<CR>\title{}<CR>\author{}<CR>\date{\today}<CR>\maketitle<CR>\end{document}
autocmd BufNewFile,BufRead *.tex iab <buffer> _figureheader \usepackage{graphicx}<CR>\usepackage{subfig}<CR>\usepackage{float}<CR>
autocmd BufNewFile,BufRead *.tex iab <buffer> _figureone \begin{figure}[H]<CR>\centering<CR>\includegraphics[scale=1]{}<CR>\caption{}<CR>\label{}<CR>\end{figure}
autocmd BufNewFile,BufRead *.tex iab <buffer> _figuremany \begin{figure}[H]<CR>\centering<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\\<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\caption{}<CR>\label{}<CR>\end{figure}
autocmd BufNewFile,BufRead *.tex iab <buffer> _codeheader \usepackage{listings}<CR>\usepackage{mdframed}<CR>\usepackage{xcolor}<CR>\definecolor{light-gray}{gray}{0.85} %the shade of grey that stack exchange uses<CR>\lstset{language=c++,<CR>aboveskip=3mm,<CR>belowskip=3mm,<CR>showstringspaces=false,<CR>columns=flexible,<CR>basicstyle={\small\ttfamily},<CR>numbers=none,<CR>escapeinside={<@}{@>},<CR>breaklines=true,<CR>breakatwhitespace=true,<CR>tabsize=4<CR>}
autocmd BufNewFile,BufRead *.tex iab <buffer> _codeinsert \begin{mdframed}[backgroundcolor=light-gray]<CR>\begin{lstlisting}<CR>\end{lstlisting}<CR>\end{mdframed} 
autocmd BufNewFile,BufRead *.tex iab <buffer> _terminalcode \begin{mdframed}[backgroundcolor=black, fontcolor=green, innerleftmargin=15, innerrightmargin=15, innertopmargin=15, innerbottommargin=15]<CR>\begin{verbatim}<CR>\end{verbatim}<CR>\end{mdframed}  
autocmd BufNewFile,BufRead *.tex iab <buffer> _itemize \begin{itemize}<CR>\item<CR>\end{itemize}
autocmd BufNewFile,BufRead *.tex iab <buffer> _enumerate \begin{enumerate}<CR>\item<CR>\end{enumerate}
autocmd BufNewFile,BufRead *.tex iab <buffer> _hyperlinkheader \usepackage{hyperref}<CR>\hypersetup{<CR>colorlinks=true,<CR>linkcolor=blue,<CR>filecolor=magenta,<CR>urlcolor=cyan,<CR>}

" c, cpp snippets -----------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.c,*.cpp inoremap <F5> <C-R>=CTriggers()<CR>
func! CTriggers()
    call complete(col('.'), ['_cheader', '_ctemplate', '_redline', '_greenline', '_blueline'])
    return ''
endfunc
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.vert,*.vs,*.frag,*.fs iab <expr> _cheader strftime("/*<CR>Author: Ramkumar Narayanan<CR>Date: %d-%b-%Y<CR>Email: ramkalath@gmail.com<CR>Program Description:<CR>*/")
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _ctemplate #include <iostream><CR><CR>int main()<CR>{<CR><CR>return 0;<CR>}
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _redline std::cout << "\033[0;91m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _greenline std::cout << "\033[0;92m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _blueline std::cout << "\033[0;96m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _cout std::cout << << std::endl;<Esc>bbbbhi

" cmake snippets -----------------------------------------------------------------------------------
autocmd BufNewFile,BufRead CMakeLists.txt iab <buffer> _cmaketemplate cmake_minimum_required(VERSION 3.4)<CR><CR># set the project name properly for this<CR>set(project_name " ") # (TODO: add project name)<CR><CR># setting project name<CR>project(${project_name})<CR><CR># here add all the cpp files involved in the project<CR>add_executable(${project_name} ) # (TODO: enter the cpp files after the project name one after the other with the path)<CR><CR>set(CMAKE_BUILD_TYPE Debug)<CR>set(CMAKE_VERBOSE_MAKEFILE ON)<CR>set(EXECUTABLE_OUTPUT_PATH ../bin)<CR><CR># add all the include files<CR>target_include_directories(${project_name} PUBLIC ./include<CR> PUBLIC /usr/include <CR>PUBLIC /usr/local/include) # you can keep adding more if you want<CR><CR># here add all the libraries that you included<CR>#target_link_libraries(${project_name} glfw3 GLEW GL GLU SOIL dl Xinerama Xrandr Xi Xcursor X11 Xxf86vm pthread) # this is and example<CR>target_link_libraries(${project_name} ) # (TODO: add the required libraries here) 

" make snippets -----------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _make CC = g++<CR><CR>CFLAGS = -g<CR><CR>INCLUDE =<CR><CR>LIBS = <CR><CR># (TODO: enter filename without extension)<CR>FILENAME =<CR><CR>all: $(FILENAME).cpp<CR> @$(CC) $(CFLAGS) $(INCLUDE) $(FILENAME).cpp -o $(FILENAME) $(LIBS)<CR><CR>run:<CR> @./$(FILENAME)<CR><CR>clean:<CR> rm ./$(FILENAME) 
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _cmake # (TODO: enter project name here)<CR>PROJECT_NAME = assimp_0<CR><CR>all:<CR> echo "#define USE_GLEW" > use_glew.h<CR>@cd ../build && cmake .. && make<CR>rm use_glew.h && touch use_glew.h<CR>@echo -e "\033[92m ------------- Compilation Successful ------------------- \033[0m"<CR><CR>run:<CR> @../bin/$(PROJECT_NAME)<CR>@echo -e "\033[92m ------------- Execution Successful ------------------- \033[0m"<CR><CR>clean:<CR> rm -rf ../build/*<CR>rm ../bin/*
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _makelatex # enter a filename without the extension<CR>FILENAME=<CR><CR>all:<CR> pdflatex $(FILENAME).tex<CR>bibtex $(FILENAME).aux<CR>pdflatex $(FILENAME).tex<CR>pdflatex $(FILENAME).tex<CR><CR>run:<CR> bibtex $(FILENAME)<CR>pdflatex $(FILENAME).tex<CR>pdflatex $(FILENAME).tex<CR><CR>clean:<CR> rm $(FILENAME).log $(FILENAME).aux *.lof *.blg *.toc *.out *.lot
" ###############################################################################################################################################################################
