import sys
import os
 
try:
    if len(sys.argv[1].split(":"))==2:
        os.system("git show "+sys.argv[1]+" > oldcommit_"+sys.argv[1].split("/")[-1])
    else:
        print('please enter the log details in this format: \x1b[3;31;40m' + 'git_show <commit-id>:<relative-file-path>' + '\x1b[0m')
        print('type \x1b[3;31;40m' + 'git_log' + '\x1b[0m'+' to obtain commit-ids')

except:
    print('please enter the log details in this format: \x1b[3;31;40m' + 'git_show <commit-id>:<relative-file-path>' + '\x1b[0m')
    print('type \x1b[3;31;40m' + 'git_log' + '\x1b[0m'+' to obtain commit-ids')
    
