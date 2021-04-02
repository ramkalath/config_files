import os
import shutil

path = './'
build_files = []
bin_files = []

print("removing these directories ->")
# r=root, d=directories, f = files
for r, d, f in os.walk(path):
    for directory in d:
        try:
            if(directory == "build"):
                print(r+"/build/")
                shutil.rmtree(r+"/build/") # removing builds
            if(directory == "bin"):
                print(r+"/bin/")
                shutil.rmtree(r+"/bin/") # removing bins
        except:
            pass
