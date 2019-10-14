import os
import datetime

if __name__ == "__main__":
    cwd = os.getcwd() + "/"

    # create a latex file
    filename = cwd + str(datetime.datetime.now()).split(" ")[0] + ".tex"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write("\documentclass[10pt]{article} \n\usepackage[letterpaper, portrait, margin=0.5in]{geometry} \n\usepackage[colorlinks = true, linkcolor = cyan, urlcolor  = cyan, citecolor = blue, anchorcolor = blue]{hyperref} \n \n\\begin{document} \n\\title{} \n\\author{Ramkumar N} \n\date{\\today} \n\maketitle \n\n\n\end{document} \n")

    # create a Makefile
    filename = cwd + "Makefile"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write("# enter a filename without the extension \nFILENAME="+str(datetime.datetime.now()).split(" ")[0]+"\n\nall:\n\tpdflatex $(FILENAME).tex\n\tbibtex $(FILENAME).aux\n\tpdflatex $(FILENAME).tex\n\tpdflatex $(FILENAME).tex\n\nrun:\n\tbibtex $(FILENAME)\n\tpdflatex $(FILENAME).tex\n\tpdflatex $(FILENAME).tex\n\nclean:\n\trm $(FILENAME).log $(FILENAME).aux *.lof *.blg *.toc *.out *.lot *.bbl\n")
