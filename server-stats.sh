#!/bin/bash


##### Server Performance Stats ############

echo
### CPU Usage####
echo "CPU Usage :"
top -bn1 | grep "Cpu" | awk '{print 100 - $8"%"}'
echo

###### Total Memory Usage ( Free Vs Used ) #######
echo "Total Memory Usage (Free vs Used):"

free -m | grep "Mem" | awk '{printf "Used: %.1f%% | Free: %.1f%%\n", ($3/$2)*100, ($4/$2)*100}'

echo



##### Disk Usage #######
df -h / | awk 'NR==2 {printf "Root FS: %s used of %s (%.1f%%)\n", $3, $2, $5}'



##### TOP 5 PROCESSES BY CPU USAGE ########
ps aux | grep "^root" | sort -k3 -rn | head -5

##### TOP 5 PROCESSES BY MEMORY USAGE #######
ps aux | grep "^root" | sort -k4 -rn | head -5
          
