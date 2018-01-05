import os

os.system("timedatectl set-timezone \"Asia/Kolkata\"")
os.system("timedatectl >> a.txt")
f = open("a.txt", "r")
time = f.readlines()[0]
time = time.split(" ")[-2]
command = "timedatectl set-time " + time
os.system(command)
