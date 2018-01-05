import os

os.system("rm a.txt")
string = "sudo date -s \"$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z\" >> a.txt"
os.system(string)
f = open("a.txt", "r")
time = f.readlines()[0].split(" ")[4]
command = "timedatectl set-time " + time
os.system(command)
