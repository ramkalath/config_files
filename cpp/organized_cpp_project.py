# *****************************************************************************
# * Filename : organized_cpp_project.py
# * Date : 1-Feb-2018
# * Author : Ram
# * Email : ramkalath@gmail.com
# * Breif Description : Creates an organized cpp project
# * Detailed Description : Creates an organized cpp project with src, bin, debug, include directories 
# *****************************************************************************

import os
import datetime
if __name__ == "__main__":
    cwd = os.getcwd() + "/"
    now = datetime.datetime.now()
    os.makedirs(cwd + "bin")
    os.makedirs(cwd + "debug")
    os.makedirs(cwd + "include")
    os.makedirs(cwd + "src")
    os.system("cp ~/config_files/cpp/sample_complete_project_Makefile " + cwd + "/src/Makefile")
    os.system("touch " + cwd + "src/main.cpp")
    filename = cwd + "src/main.cpp"
    file_object = open(filename, 'w')
    date = str(now.day) + "-" + str(now.month) + "-" + str(now.year)
    file_object.write(
                    "/*****************************************************************************\n* Filename : main.cpp\n* Date : "+date+"\n* Author : Ram\n* Email : ramkalath@gmail.com\n* Breif Description :\n* Detailed Description :\n*****************************************************************************/\n#include<iostream>\nusing namespace std;\nint main()\n{\n\t\n\treturn 0;\n}")
    os.system("cp ~/config_files/nvim/.ycm_extra_conf.py "+cwd+"src/")
    os.system("python ~/config_files/cpp/codeblocks/large_cbproject.py")
    os.system("mv *.cbp ./debug")
