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
    file_object.write("\documentclass[10pt]{article} \n\usepackage[letterpaper, portrait, margin=0.5in]{geometry} \n \n\\begin{document} \n\\title{} \n\\author{} \n\date{\\today} \n\maketitle \n\end{document} \n ")

    # create a Makefile
    filename = cwd + "Makefile"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write("# enter a filename without the extension \nFILENAME="+myfile+"\n\nall:\n\tpdflatex $(FILENAME).tex\n\tbibtex $(FILENAME).aux\n\tpdflatex $(FILENAME).tex\n\tpdflatex $(FILENAME).tex\n\nrun:\n\tbibtex $(FILENAME)\n\tpdflatex $(FILENAME).tex\n\tpdflatex $(FILENAME).tex\n\nclean:\n\trm $(FILENAME).log $(FILENAME).aux *.lof *.blg *.toc *.out *.lot *.bbl\n")
