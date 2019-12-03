import os
import time

time.sleep(10)
os.system("redshift -O 4500 &!")
os.system("touch /home/ram/workarea/we_test.txt")

