import os
import datetime

if __name__ == "__main__":
    time_stamp = str(datetime.datetime.now()).split(" ")[0]
    os.system("mkdir "+time_stamp)
    os.chdir(time_stamp)
    cwd = os.getcwd() + "/"

    # create a latex file
    filename = cwd + time_stamp + ".tex"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write("\documentclass[10pt]{article} \n\usepackage[letterpaper, portrait, margin=0.5in]{geometry} \n \n\\begin{document} \n\\title{} \n\\author{} \n\date{\\today} \n\maketitle \n\end{document} \n ")

    # create a Makefile
    filename = cwd + "Makefile"
    os.system("touch " + filename)
    file_object = open(filename, 'w')
    file_object.write("# enter a filename without the extension \nFILENAME="+time_stamp+"\n\nall:\n\tpdflatex $(FILENAME).tex\n\tbibtex $(FILENAME).aux\n\tpdflatex $(FILENAME).tex\n\tpdflatex $(FILENAME).tex\n\nrun:\n\tbibtex $(FILENAME)\n\tpdflatex $(FILENAME).tex\n\tpdflatex $(FILENAME).tex\n\nclean:\n\trm $(FILENAME).log $(FILENAME).aux *.lof *.blg *.toc *.out *.lot *.bbl\n")
