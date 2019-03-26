#!/bin/bash

# Verify environment
verify=`cat /home/cloud_user/html/index.html | grep  "Success" | wc -l`
if [ $verify = "1" ]; then
	echo -e "\e[32mHostA exam prep appears normal\e[0m"
fi


# RH342 GRADING SCRIPT
# HostA

_pass="[ \e[32mPASS\e[0m ]\t"
_fail="[ \e[91mFAIL\e[0m ]\t"
_partial="[ \e[93mPARTIAL\e[0m ]\t"

# Debug an application
task_1=`/root/example_app | grep "Success\!" | wc -l`

# Test an application for a memory leak
task_2=`ls -l /root/memleak_test_app | grep -v x | wc -l`

#
task_3=`cat /sys/module/nf_conntrack/parameters/tstamp | grep Y | wc -l`

#
task_4_1=`yum info httpd | grep Release  | grep -v "80.el7" | wc -l`
task_4_2=`yum versionlock 2>/dev/null | grep httpd | wc -l`

#
task_5=`curl localhost 2>/dev/null | grep "Success\!" | wc -l`

#
task_6_1=`getent passwd testuser01 | grep 1003 | wc -l`
task_6_2=`runuser -l testuser01 -c 'echo welcome1 | kinit && klist' 2>/dev/null | grep 'Default principal: testuser01@EXAMPLE.COM' | wc -l`

#
task_7=`cat /root/load.txt 2>/dev/null | grep 9.090 | wc -l`

echo -e "\e[1mRH342 PRACTICE EXAM:\e[0m HostA"
echo -e "================================================================"

# TASK 1
#--------------------------------------------------

if [ $task_1 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi

echo -e "\e[1mTask 1:\e[0m Debug an application"

#--------------------------------------------------

# TASK 2
#--------------------------------------------------
if [ $task_2 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 2:\e[0m Test an application for a memory leak"
#--------------------------------------------------
# TASK 3
#--------------------------------------------------
if [ $task_3 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 3:\e[0m Manage a kernel module"
#--------------------------------------------------
# TASK 4
#--------------------------------------------------
if [ $task_4_1 = "1" ] && [ $task_4_2 = "1" ]; then
	echo -en $_pass
elif [ $task_4_1 = "1" ] || [ $task_4_2 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 4:\e[0m Upgrade a package"
#--------------------------------------------------
# TASK 5
#--------------------------------------------------
if [ $task_5 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 5:\e[0m Resolve SELinux issues"
#--------------------------------------------------
# TASK 6
#--------------------------------------------------
if [ $task_6_1 = "1" ] && [ $task_6_2 = "1" ]; then
	echo -en $_pass
elif [ $task_6_1 = "1" ] || [ $task_6-2 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 6:\e[0m Resolve authentication issues"
#--------------------------------------------------
# TASK 7
#--------------------------------------------------
if [ $task_7 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 7:\e[0m Monitor system for vital characteristics"
#--------------------------------------------------



