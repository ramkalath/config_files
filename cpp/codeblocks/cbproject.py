import xml.etree.ElementTree as ET
import glob
import os
import getpass

def parse_makefile(path):
	""" all the info required to make the codeblocks project file """
	make_contents = open(path)
	make_lines = make_contents.readlines()

        for i in make_lines:
            if i[:6] == "CFLAGS":
                flags = i.split(" ")
            if i[:4] == "LIBS":
                libs = i.split(" ")

        flags.pop(0)
        flags.pop(0)
        flags.remove("-g") # this is already enabled there in the default_template.cbp file
        libs.pop(0)
        libs.pop(0)
        if(flags[-1][-1:]=="\n"):
            flags[-1]=flags[-1].split("\n")[0]
        if(libs[-1][-1:]=="\n"):
            libs[-1]=libs[-1].split("\n")[0]
        for i in range(0, len(libs)):
            libs[i]=libs[i][2:]
	return flags, libs

def list_c_cpp_files(path):
	oldpath = os.getcwd()
	os.chdir(path)
	files = glob.glob('*.cpp') + glob.glob('*.h') + glob.glob('*.hpp') 
	os.chdir(oldpath)
	return files

def line_prepender(filename, line):
    with open(filename, 'r+') as f:
        content = f.read()
        f.seek(0, 0)
        f.write(line.rstrip('\r\n') + '\n' + content)

if __name__ == "__main__":
	path = os.getcwd() + "/"
	makefile_path = path + "Makefile"
	cflags, libs = parse_makefile(makefile_path)
        file_list = list_c_cpp_files(path)
        user = getpass.getuser()
        new_project_name = path.split("/")[-2]
        template = os.getenv("HOME")+"/.codeblocks/template.cbp"
        tree = ET.parse(template)
        root = tree.getroot()

        # changing filenames to current directory in the config file
        root[1][0].attrib["title"] = new_project_name
        root[1][3][0][0].attrib["output"] = new_project_name
        root[1][3][0][1].attrib["object_output"] = "./"
        root[1][3][1][0].attrib["output"] = new_project_name
        root[1][3][1][1].attrib["object_output"] = "./Bin"

        # adding flags to the config file
        for i in cflags:
                child_libs = ET.Element("Add option=" + "\"" + i + "\"")
                root[1][3][0][4].append(child_libs) 

        # adding libs to the cb project file
        for i in libs:
                child_libs = ET.Element("Add library=" + "\"" + i + "\"")
                root[1][3][0][5].append(child_libs) 

	# # adding cpp and header files to the cb project file
        for i in file_list:
                # print "Unit filename=" + "\"" + i + "\""
                child_file = ET.Element("Unit filename=" + "\"" + i + "\"")
                root[1].append(child_file)

        tree.write(new_project_name + ".cbp")
        prepend_line = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"
        line_prepender(new_project_name+".cbp", prepend_line)
