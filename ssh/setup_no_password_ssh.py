# make sure to run this on the client system

import os
import sys
from sys import platform

username = "pi"
ip = "192.168.43.58"

print("----- just press enter when prompted - Do not type anything --------------")
os.system("ssh-keygen.exe -t rsa")
if(platform == "linux"):
    os.chdir(os.path.expanduser(".ssh"))
if(platform == "win32"):
    os.chdir(os.path.join(os.getenv('userprofile'), '.ssh'))
os.system("cat ~/.ssh/id_rsa.pub | ssh "+username+"@"+ip+" \"[ ! -d ~/.ssh ] && mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys\"")
