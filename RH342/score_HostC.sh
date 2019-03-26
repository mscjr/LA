#!/bin/bash

# Verify environment
verify=`cat /usr/bin/polling.sh | grep true | wc -l`
if [ $verify = "1" ]; then
	echo -e "\e[32mHostC exam prep appears normal\e[0m"
fi

# RH342 GRADING SCRIPT
# HostC

_pass="[ \e[32mPASS\e[0m ]\t"
_fail="[ \e[91mFAIL\e[0m ]\t"
_partial="[ \e[93mPARTIAL\e[0m ]\t"


task_12=`ls -l /usr/bin/polling.sh | grep -v x | wc -l`


task_13=`dig linuxacademy.com 2>/dev/null | grep "Got answer:" | wc -l`

#
task_14=`echo 'welcome1' | smbclient -U cloud_user -L localhost | grep Home | wc -l`

#
task_15_1=`systemctl is-enabled target | grep enabled | wc -l`
task_15_2=`systemctl status target | grep enabled | wc -l`
task_15_3=`firewall-cmd --list-all | grep 3260 | wc -l`

#
task_16_1=`ss -lntp | grep *:514 | grep rsyslogd | wc -l`
task_16_2=`firewall-cmd --list-all | grep 514/tcp | wc -l`
task_16_3=`cat /var/log/messages | grep ip-10-0-1-14 | tail -n 1 | wc -l`



echo -e "\e[1mRH342 PRACTICE EXAM:\e[0m HostC"
echo -e "================================================================"

# TASK 12
#--------------------------------------------------
if [ $task_12 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 12:\e[0m Troubleshoot system resource consumption"
#--------------------------------------------------
# TASK 13
#--------------------------------------------------
if [ $task_13 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 13:\e[0m Troubleshoot an application"
#--------------------------------------------------
# TASK 14
#--------------------------------------------------
if [ $task_14 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 14:\e[0m Troubleshoot service authentication"
#--------------------------------------------------
# TASK 15
#--------------------------------------------------
if [ $task_15_1 = "1" ] && [ $task_15_2 = "1" ]  && [ $task_15_3 = "1" ]; then
	echo -en $_pass
elif [ $task_15_1 = "1" ] || [ $task_15_2 = "1" ] || [ $task_15_3 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 15:\e[0m [ HostC ] Troubleshoot iSCSI"
#--------------------------------------------------
# TASK 16
#--------------------------------------------------
if [ $task_16_1 = "1" ] && [ $task_16_2 = "1" ] && [ $task_16_3 = "1" ]; then
	echo -en $_pass
elif [ $task_16_1 = "1" ] || [ $task_16-2 = "1" ]  || [ $task_16-3 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 16:\e[0m [ HostC ] Configure remote logging"




