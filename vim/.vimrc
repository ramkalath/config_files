" for gvim remove these
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" editor settings
set hidden "unsaved buffer wont close when opening a new buffer/file
set autochdir "keep up with the directory path when changing files
set backspace=indent,eol,start "backspace in insert mode does not work without this
set clipboard^=unnamed "This sets the clipboard as the default register. Useful for copy paste from tmux
set nocompatible "This tells vim not to act like it predecessor vi
syntax enable "enables syntax highlighting
" set number " displays line number
" set relativenumber
set shortmess=A "prevent vim from giving a warning it the swp file is open 
set encoding=utf8
set ignorecase
set nobackup
set virtualedit=onemore "cursor goes one more position than the usual
set laststatus=0
set mouse=a "sane selection without line numbers
set tabstop=4
set shiftwidth=4
filetype plugin indent on "identify the kind of filetype automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set nolist
set wrap
set nocursorline
colorscheme desert
set t_md= "disable bold fonts

"if your forget to sudo you can simply w!!
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! 

" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,] "(TODO: check what this does)

" scrolling up and down multiple lines atonce
nmap <c-j> +3
vmap <c-j> +3
nmap <c-k> -3
vmap <c-k> -3

" keyboard shortcuts 
nmap <c-n> :tabnext<CR>
nmap <c-p> :tabprevious<CR>
cnoreabbrev Wq :wq
cnoreabbrev w :w
cnoreabbrev W :w
cnoreabbrev WQ :wq
cnoreabbrev Q :q
cnoreabbrev Ww :w
cnoreabbrev wW :w
cnoreabbrev WW :w
set guitablabel=%t  " show only the file name an not the path 
au FocusLost * :wa  " save when focus is lost (not sure if this is working. Test)
imap vv <Esc>v
nmap vv <Esc>v
imap <c-l> <Esc>la
cnoreabbrev e tabedit
set showtabline=2
set noesckeys

" change cursor shape when entering insert mode
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;green\x7" " green in insert mode
  let &t_EI = "\<Esc>]12;red\x7" " red in other modes
  silent !echo -ne "\033]12;red\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007" "reset cursor when vim exits
endif

" directory path can be obtained by typing fpath
cnoreabbrev fpath :echo expand('%:p')<CR>

" comments ctrl-c to comment and shift-c to uncomment
autocmd BufNewFile,BufRead *.sh,*.py,Makefile,makefile,CMakeLists.txt map <c-c> :s/^/# /<CR> | map <s-c> :s/# //<CR>
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.vert,*.vs,*.frag,*.fs map <c-c> :s/^/\/\/ /<CR> | map <s-c> :s/\/\/\ //<CR>
autocmd BufNewFile,BufRead *.vimrc map <c-c> :s/^/" /<CR> | map <s-c> :s/" //<CR>
autocmd BufNewFile,BufRead *.tex map <c-c> :s/^/% /<CR> | map <s-c> :s/% //<CR>

" terminal and make commands
imap <c-x><c-x> <Esc>:update<CR>\|<Esc>:split term://make && make run<CR>Gi<Esc><C-w><C-r>
nmap <c-x><c-x> :update<CR>\|<Esc>:split term://make && make run<CR>Gi<Esc><C-w><C-r>

" remember where the cursor was in the previous session; not if the file is gitcommit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
	\ execute("normal `\"") |
\ endif

" highlight a TODO occurrence in red and DONE in green
highlight TODO cterm=italic ctermfg=red ctermbg=black
highlight DONE cterm=italic ctermfg=green ctermbg=black
match TODO /TODO/
match DONE /DONE/

" abbreviations
iab _todo TODO(ram):
iab _done DONE(ram):
iab <expr> _date strftime("%d-%b-%Y")

" c, cpp and associated files abbreviations ---------------------
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.vert,*.vs,*.frag,*.fs iab <buffer> _header /*****************************************************************************<CR>Author : Ram<CR>Date :<CR>Email : ramkalath@gmail.com<CR>Breif Description :<CR>Detailed Description :<CR>*****************************************************************************/
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _template #include <iostream><CR><CR>int main()<CR>{<CR><CR>return 0;<CR>}
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _redline std::cout << "\033[0;91m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _greenline std::cout << "\033[0;92m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _blueline std::cout << "\033[0;96m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold

" make file abbreviations --------------------------------------
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _templateforc CC = g++<CR><CR>CFLAGS = -g<CR><CR>INCLUDE =<CR><CR>LIBS = <CR><CR># (TODO: enter filename without extension)<CR>FILENAME =<CR><CR>all: $(FILENAME).cpp<CR> @$(CC) $(CFLAGS) $(INCLUDE) $(FILENAME).cpp -o $(FILENAME) $(LIBS)<CR><CR>run:<CR> @./$(FILENAME)<CR><CR>clean:<CR> rm ./$(FILENAME) 
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _templatepointerforcmake # (TODO: enter project name here)<CR>PROJECT_NAME = assimp_0<CR><CR>all:<CR> echo "#define USE_GLEW" > use_glew.h<CR>@cd ../build && cmake .. && make<CR>rm use_glew.h && touch use_glew.h<CR>@echo -e "\033[92m ------------- Compilation Successful ------------------- \033[0m"<CR><CR>run:<CR> @../bin/$(PROJECT_NAME)<CR>@echo -e "\033[92m ------------- Execution Successful ------------------- \033[0m"<CR><CR>clean:<CR> rm -rf ../build/*<CR>rm ../bin/*
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _templateforlatex # enter a filename without the extension<CR>FILENAME=<CR><CR>all:<CR> pdflatex $(FILENAME).tex<CR>bibtex $(FILENAME).aux<CR>pdflatex $(FILENAME).tex<CR>pdflatex $(FILENAME).tex<CR><CR>run:<CR> bibtex $(FILENAME)<CR>pdflatex $(FILENAME).tex<CR>pdflatex $(FILENAME).tex<CR><CR>clean:<CR> rm $(FILENAME).log $(FILENAME).aux *.lof *.blg *.toc *.out *.lot

" python files abbreviations -----------------------------------
autocmd BufNewFile,BufRead *.py iab <buffer> _header # *************************************************************<CR># Author : Ram<CR># Date :<CR># Email : ramkalath@gmail.com<CR># Breif Description :<CR># Detailed Description :<CR># ************************************************************

" latex snippets ----------------------------------------------
autocmd BufNewFile,BufRead *.tex iab <buffer> _template \documentclass[10pt]{article}<CR>\usepackage[letterpaper, portrait, margin=0.5in]{geometry}<CR>\usepackage[colorlinks = true, linkcolor = cyan, urlcolor  = cyan, citecolor = blue, anchorcolor = blue]{hyperref}<CR><CR>\begin{document}<CR>\title{}<CR>\author{}<CR>\date{\today}<CR>\maketitle<CR>\end{document}
autocmd BufNewFile,BufRead *.tex iab <buffer> _figureheader \usepackage{graphicx}<CR>\usepackage{subfig}<CR>
autocmd BufNewFile,BufRead *.tex iab <buffer> _onefigure \begin{figure}[H]<CR>\centering<CR>\includegraphics[scale=1]{}<CR>\caption{}<CR>\label{}<CR>\end{figure}
autocmd BufNewFile,BufRead *.tex iab <buffer> _manyfigures \begin{figure}[H]<CR>\centering<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\\<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\subfloat[]{\includegraphics[scale=1]{}\label{}}<CR>\caption{}<CR>\label{}<CR>\end{figure}
autocmd BufNewFile,BufRead *.tex iab <buffer> _codeheader \usepackage{listings}<CR>\usepackage{xcolor}<CR>\definecolor{light-gray}{gray}{0.85} %the shade of grey that stack exchange uses<CR>\definecolor{dkgreen}{rgb}{0,0.6,0}<CR>\definecolor{gray}{rgb}{0.5,0.5,0.5}<CR>\definecolor{mauve}{rgb}{0.58,0,0.82}<CR>\lstset{frame=tb,<CR>language=c++,<CR>aboveskip=3mm,<CR>belowskip=3mm,<CR>showstringspaces=false,<CR>columns=flexible,<CR>basicstyle={\small\ttfamily},<CR>numbers=none,<CR>numberstyle=\tiny\color{gray},<CR>keywordstyle=\color{blue},<CR>commentstyle=\color{dkgreen},<CR>stringstyle=\color{mauve},<CR>escapeinside={<@}{@>},<CR>breaklines=true,<CR>breakatwhitespace=true,<CR>tabsize=3<CR>}
autocmd BufNewFile,BufRead *.tex iab <buffer> _code \begin{mdframed}[backgroundcolor=light-gray, roundcorner=10pt,leftmargin=1, rightmargin=1, innerleftmargin=15, innertopmargin=15,innerbottommargin=15, outerlinewidth=1, linecolor=light-gray]<CR>\begin{lstlisting}<CR><CR> \end{lstlisting}<CR>\end{mdframed} 
autocmd BufNewFile,BufRead *.tex iab <buffer> _terminalcode \begin{mdframed}[backgroundcolor=black, roundcorner=0pt,leftmargin=0, rightmargin=0, innerleftmargin=0, innertopmargin=0, innerbottommargin=0, outerlinewidth=0, linecolor=black]<CR>\begin{lstlisting}<CR> <@ \textcolor{green}{} @><CR>\end{lstlisting}<CR>\end{mdframed} 
autocmd BufNewFile,BufRead *.tex iab <buffer> _itemize \begin{itemize}<CR> \item<CR>\end{itemize}
autocmd BufNewFile,BufRead *.tex iab <buffer> _enumerate \begin{enumerate}<CR> \item<CR>\end{enumerate}
autocmd BufNewFile,BufRead *.tex iab <buffer> _hyperlinkheader \usepackage{hyperref}<CR>\hypersetup{<CR>colorlinks=true,<CR>linkcolor=blue,<CR>filecolor=magenta,<CR>urlcolor=cyan,<CR>}

" cmake snippets ----------------------------------------------
autocmd BufNewFile,BufRead CMakeLists.txt iab <buffer> _cmaketemplate cmake_minimum_required(VERSION 3.4)<CR><CR># set the project name properly for this<CR>set(project_name " ") # (TODO: add project name)<CR><CR># setting project name<CR>project(${project_name})<CR><CR># here add all the cpp files involved in the project<CR>add_executable(${project_name} ) # (TODO: enter the cpp files after the project name one after the other with the path)<CR><CR>set(CMAKE_BUILD_TYPE Debug)<CR>set(CMAKE_VERBOSE_MAKEFILE ON)<CR>set(EXECUTABLE_OUTPUT_PATH ../bin)<CR><CR># add all the include files<CR>target_include_directories(${project_name} PUBLIC ./include<CR> PUBLIC /usr/include <CR>PUBLIC /usr/local/include) # you can keep adding more if you want<CR><CR># here add all the libraries that you included<CR>#target_link_libraries(${project_name} glfw3 GLEW GL GLU SOIL dl Xinerama Xrandr Xi Xcursor X11 Xxf86vm pthread) # this is and example<CR>target_link_libraries(${project_name} ) # (TODO: add the required libraries here) 

" set the same kind of syntax highlighting for glsl files as c
autocmd BufNewFile,BufRead *.vs,*.fs,*.frag,*.vert set filetype=c
