import os

message = raw_input("Reminder Message : ")
time_str = raw_input("enter time (eg \'in/after 10 mins/3 hrs\' or \'at 3:30pm\') \n remind me ")
command_string = "echo \'notify-send -i $HOME/config_files/system_files/alarm.ico " + message + "\' | at " 
time_str_list = time_str.split(" ")
if time_str_list[0] == "after" or time_str_list[0] == "in":
	if(time_str_list[-1] == "min" or time_str_list[-1] == "mins" or time_str_list[-1] == "minute" or time_str_list[-1] == "minutes" or time_str_list[-1] == "m"):
		command = command_string + "now + " + time_str_list[-2] + " minutes"
		print "case 1"
	if(time_str_list[-1] == "hr" or time_str_list[-1] == "hrs" or time_str_list[-1] == "hour" or time_str_list[-1] == "hours" or time_str_list[-1] == "h"):
		command = command_string + "now + " + time_str_list[-2] + " hours"
		print "case 2"	

if time_str_list[0] == "at":
	time_string = ""
	if(len(time_str_list[-1][:-2]) == 1 or len(time_str_list[-1][:-2]) == 2):
		time_str_list[-1] = time_str_list[-1][:-2] + ":00" + time_str_list[-1][-2:]
	if(time_str_list[-1][-2:] == "am"):
		time_string = time_str_list[-1][:-2] + "AM"
	if(time_str_list[-1][-2:] == "pm"):
		time_string = time_str_list[-1][:-2] + "PM"
	command = command_string + time_string
	print "case 3"

print command
os.system(command)
