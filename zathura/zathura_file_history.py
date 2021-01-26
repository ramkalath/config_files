import os
import sys

zathura_history = os.path.expanduser("~")+"/.config/zathura/zathura_history.txt"
os.system("touch "+zathura_history) # if file does not exist create
f = open(zathura_history, "r+") # open in read and write mode
data = f.readlines() # grab all the data into a list

myfile = sys.argv[1]
if(os.path.exists(myfile)):
    if(myfile.split("/")[-1][-4:] == ".pdf"):
        myfile = "\""+os.path.realpath(myfile)+"\""+"\n"
        if(myfile not in data): # check the length of the stack and delete the lowest and add one
            if(len(data)>5): # delete the last line
                os.system("sed \'$d\' "+zathura_history+" > backup.txt")
                os.system("rm "+zathura_history)
                os.system("mv backup.txt "+zathura_history)
            if(len(data)==0): # if file empty add the first line
                os.system("echo \""+myfile[:-1]+"\" > "+zathura_history)
            else:
                os.system("sed -i.old \'1 i\\"+myfile[:-1]+"\' "+zathura_history) # prepend the file to the top
        else:
            pass
            # move the file up; TODO(ram): implement this someday
    else:
        print("FILE DOES NOT HAVE THE EXTENSION PDF")
else:
    print("\n THIS FILE DOES NOT EXIST")

