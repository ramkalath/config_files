import os
import datetime
import sys

if __name__ == "__main__":
    try:
        myfile = sys.argv[1]
    except:
        time_stamp = str(datetime.datetime.now()).split(" ")[0]
        myfile = time_stamp
    os.system("mkdir "+myfile)
    os.chdir(myfile)
    cwd = os.getcwd() + "/"

    # create a latex file
    filename = cwd + myfile + ".tex"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write(r"""
\documentclass[10pt]{article}
\usepackage[letterpaper, portrait, margin=0.5in]{geometry}

\begin{document}
\title{}
\author{}
\date{\today}
\maketitle

\end{document}
""")

    # create a Makefile
    filename = cwd + "Makefile"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write(
r"""
# enter a filename without the extension 
FILENAME="""+myfile+

r"""
all: 
    pdflatex $(FILENAME).tex 
    bibtex $(FILENAME).aux 
    pdflatex $(FILENAME).tex
    pdflatex $(FILENAME).tex

run:
    bibtex $(FILENAME)
    pdflatex $(FILENAME).tex
    pdflatex $(FILENAME).tex

clean:
    rm $(FILENAME).log 
    $(FILENAME).aux *.lof *.blg *.toc *.out *.lot *.bbl
"""
)
