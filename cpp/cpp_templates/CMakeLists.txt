cmake_minimum_required(VERSION 3.4)

# set the project name properly for this
set(project_name "main")

# setting project name
project(${project_name})

# here add all the cpp files involved in the project
add_executable(${project_name} ../main.cpp) # (TODO: enter the cpp files after the project name one after the other with the path)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(EXECUTABLE_OUTPUT_PATH ../)

# add all the include files
target_include_directories(${project_name} PUBLIC ./include
	 PUBLIC /usr/include 
	 PUBLIC /usr/local/include) # you can keep adding more if you want
