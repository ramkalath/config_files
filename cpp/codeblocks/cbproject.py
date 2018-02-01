import xml.etree.ElementTree as ET
import glob
import os

def parse_makefile(path):
	""" all the info required to make the codeblocks project file """
	make_contents = open(path)
	make_lines = make_contents.readlines()
	for i in make_lines:
		if i[:4] == "LIBS":
			libs = i.split(" ")
	lib_proj = []
	for i in libs:
		lib_proj.append(i[2:])
	lib_proj.pop(0)
	last = lib_proj[-1]	
	lib_proj.pop(-1)
	lib_proj.append(last[:-1])
	return lib_proj

def list_c_cpp_files(path):
	oldpath = os.getcwd()
	os.chdir(path)
	files = glob.glob('*.cpp') + glob.glob('*.h') + glob.glob('*.hpp') 
	os.chdir(oldpath)
	return files
	# for file in glob.glob("*.h"):
	# 	files.append(file)
	# return files

def line_prepender(filename, line):
    with open(filename, 'r+') as f:
        content = f.read()
        f.seek(0, 0)
        f.write(line.rstrip('\r\n') + '\n' + content)

if __name__ == "__main__":
	path = os.getcwd() + "/"
	makefile_path = path + "Makefile"
	libs_list = parse_makefile(makefile_path)
	file_list = list_c_cpp_files(path)
	
	new_project_name = path.split("/")[-2]
	template = "/home/ram/config_files/codeblocks/template.cbp"
	tree = ET.parse(template)
	root = tree.getroot()

	# changing filenames to current directory in the config file
	root[1][0].attrib["title"] = new_project_name
	root[1][3][0][0].attrib["output"] = new_project_name
	root[1][3][0][1].attrib["object_output"] = "./"
	root[1][3][1][0].attrib["output"] = new_project_name
	root[1][3][1][1].attrib["object_output"] = "./Bin"

	# adding libs to the config file
	for i in libs_list:
		child_libs = ET.Element("Add library=" + "\"" + i + "\"")
		root[1][3][0][5].append(child_libs) 

	# adding cpp and header files to the project
	for i in file_list:
		# print "Unit filename=" + "\"" + i + "\""
		child_file = ET.Element("Unit filename=" + "\"" + i + "\"")
		root[1].append(child_file)

	tree.write(new_project_name + ".cbp")
	prepend_line = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"
	line_prepender(new_project_name+".cbp", prepend_line)
