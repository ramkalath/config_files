" highlight a TODO occurrence in bright red
highlight TODO cterm=italic ctermfg=196 guifg=#ff0000
syn keyword cTodo contained TODO FIXME 
ab TODO TODO(ram):
ab _todo TODO(ram):
ab _fixme FIXME(ram):

" highlight a DONE occurrence in bright green
highlight DONE cterm=italic ctermfg=LightGreen guifg=#00ff00
match DONE /DONE/

" c, cpp and associated files abbreviations ---------------------
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.vert,*.vs,*.frag,*.fs iab <expr> _cheader strftime("/*<CR>Author: Ramkumar Narayanan<CR>Date: %d-%b-%Y<CR>Email: ramkalath@gmail.com<CR>Program Description:<CR>*/")
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _ctemplate #include <iostream><CR><CR>int main()<CR>{<CR><CR>return 0;<CR>}
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _redline std::cout << "\033[0;91m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _greenline std::cout << "\033[0;92m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold
autocmd BufNewFile,BufRead *.c,*.cpp iab <buffer> _blueline std::cout << "\033[0;96m <enter text here> \033[0m\n" << std::endl;	//red bold, change the first 1 to 0 for printing without bold

" make file abbreviations --------------------------------------
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _make CC = g++<CR><CR>CFLAGS = -g<CR><CR>INCLUDE =<CR><CR>LIBS = <CR><CR># (TODO: enter filename without extension)<CR>FILENAME =<CR><CR>all: $(FILENAME).cpp<CR> @$(CC) $(CFLAGS) $(INCLUDE) $(FILENAME).cpp -o $(FILENAME) $(LIBS)<CR><CR>run:<CR> @./$(FILENAME)<CR><CR>clean:<CR> rm ./$(FILENAME) 
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _cmake # (TODO: enter project name here)<CR>PROJECT_NAME = assimp_0<CR><CR>all:<CR> echo "#define USE_GLEW" > use_glew.h<CR>@cd ../build && cmake .. && make<CR>rm use_glew.h && touch use_glew.h<CR>@echo -e "\033[92m ------------- Compilation Successful ------------------- \033[0m"<CR><CR>run:<CR> @../bin/$(PROJECT_NAME)<CR>@echo -e "\033[92m ------------- Execution Successful ------------------- \033[0m"<CR><CR>clean:<CR> rm -rf ../build/*<CR>rm ../bin/*
autocmd BufNewFile,BufRead *makefile,*Makefile iab <buffer> _makelatex # enter a filename without the extension<CR>FILENAME=<CR><CR>all:<CR> pdflatex $(FILENAME).tex<CR>bibtex $(FILENAME).aux<CR>pdflatex $(FILENAME).tex<CR>pdflatex $(FILENAME).tex<CR><CR>run:<CR> bibtex $(FILENAME)<CR>pdflatex $(FILENAME).tex<CR>pdflatex $(FILENAME).tex<CR><CR>clean:<CR> rm $(FILENAME).log $(FILENAME).aux *.lof *.blg *.toc *.out *.lot

" python files abbreviations -----------------------------------
autocmd BufNewFile,BufRead *.py iab <expr> _pyheader strftime("# Author: Ramkumar Narayanan<CR># Date: %d-%b-%Y<CR># Email: ramkalath@gmail.com<CR># Program Description:<CR>")
autocmd BufNewFile,BufRead *.py iab <buffer> _pytemplate if __name__ == "__main__":

" latex snippets ----------------------------------------------
autocmd BufNewFile,BufRead *.tex iab <buffer> _latextemplate \documentclass[10pt]{article}<CR>\usepackage[letterpaper, portrait, margin=0.5in]{geometry}<CR>\usepackage[colorlinks = true, linkcolor = cyan, urlcolor  = cyan, citecolor = blue, anchorcolor = blue]{hyperref}<CR><CR>\begin{document}<CR>\title{}<CR>\author{}<CR>\date{\today}<CR>\maketitle<CR>\end{document}
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

" cpp files snippet triggers
autocmd BufNewFile,BufRead *.c,*.cpp inoremap <F5> <C-R>=CTriggers()<CR>
func! CTriggers()
    call complete(col('.'), ['_cheader', '_ctemplate', '_redline', '_greenline', '_blueline'])
    return ''
endfunc

" python files snippet triggers
autocmd BufNewFile,BufRead *.py inoremap <F5> <C-R>=PyTriggers()<CR>
func! PyTriggers()
    call complete(col('.'), ['_pytemplate', '_pyheader'])
    return ''
endfunc

" latex files snippet triggers
autocmd BufNewFile,BufRead *.tex inoremap <F5> <C-R>=LatexTriggers()<CR>
func! LatexTriggers()
    call complete(col('.'), ['_latextemplate', '_figureheader', '_onefigure', '_manyfigures', '_codeheader', '_code', 
				\ '_terminalcode', '_itemize', '_enumerate', '_hyperlinkheader'])
    return ''
endfunc

" set the same kind of syntax highlighting for glsl files as c
autocmd BufNewFile,BufRead *.vs,*.fs,*.frag,*.vert set filetype=c

