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
    project_name = cwd.split("/")[-2]
    os.makedirs(cwd + "bin")
    os.makedirs(cwd + "build")
    os.makedirs(cwd + "include")
    os.makedirs(cwd + "src")

    # create CMakeLists.txt ---------------------------------------------------------------
    os.system("touch " + cwd + "CMakeLists.txt")
    filename = cwd + "CMakeLists.txt"
    file_object = open(filename, 'w')
    file_object.write("cmake_minimum_required(VERSION 3.4)\n\nset(project_name \"" + project_name + "\")\n# setting project name\nproject(${project_name})\n\n# here add all the cpp files involved in the project\nadd_executable(${project_name} ./src/main.cpp) # (TODO: enter the cpp files after the project name one after the other with the path)\n\nset(CMAKE_EXPORT_COMPILE_COMMANDS 1)\n\nset(CMAKE_BUILD_TYPE Debug) #required for ycm\nset(CMAKE_VERBOSE_MAKEFILE ON)\nset(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)\n\n# add all the include files\ntarget_include_directories(${project_name} PUBLIC ./include PUBLIC /usr/include PUBLIC /usr/local/include) # you can keep adding more if you want\n\n#here add all the libraries that you included\n#target_link_libraries(${project_name} glfw3 GLEW GL GLU SOIL dl Xinerama Xrandr Xi Xcursor X11 Xxf86vm pthread assimp) # this is and example\ntarget_link_libraries(${project_name} ) # (TODO: add the required libraries here)\n\n# Required for YCM\nIF(EXISTS \"${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json\")\n EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different\n\t${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json\n\t${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json\n\t)\nENDIF()")

    # create Makefile ----------------------------------------------------------------------
    os.system("touch " + cwd + "/src/Makefile")
    filename = cwd + "/src/Makefile"
    file_object = open(filename, 'w')
    file_object.write("PROJECT_NAME = " + project_name + "\n.SILENT: all project\n\nall: \n\t# echo \"#define USE_GLEW\" > use_glew.h\n\tcd ../build; \\\n\tmake\n\t# rm use_glew.h && touch use_glew.h\n\t@echo -e \"\\033[92m ------------- Compilation Successful ------------------- \\033[0m\"\nproject:\n\tif [ ! -d \"../build\" ]; then mkdir ../build; fi\n\tif [ ! -d \"../bin\" ]; then mkdir ../bin; fi\n\tcd ../build; \\\n\tcmake ..; \\\n\tmake\nrun:\n\t../bin/$(PROJECT_NAME)\n\t@echo -e \"\\033[92m ------------- Execution Successful ------------------- \\033[0m\"\ndebug:\n\tcd ../build && \\\n\tcmake -G \"codeblocks - Unix Makefiles\" .. && \\\n\codeblocks ${PROJECT_NAME}.cbp &! > /dev/null\nclean:\n\trm -rf ../build/*\n\trm ../bin/*\n")
    # create main.cpp ----------------------------------------------------------------------
    os.system("touch " + cwd + "src/main.cpp")
    filename = cwd + "src/main.cpp"
    file_object = open(filename, 'w')
    now = datetime.datetime.now()
    date = str(now.day) + "-" + str(now.month) + "-" + str(now.year)
    file_object.write("/*****************************************************************************\n* Filename : main.cpp\n* Date : "+date+"\n* Author : Ram\n* Email : ramkalath@gmail.com\n* Breif Description :\n* Detailed Description :\n*****************************************************************************/\n#include<iostream>\nint main()\n{\n\t\n\treturn 0;\n}")
