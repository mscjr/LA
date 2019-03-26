#!/bin/bash

# Verify environment
verify=`cat /etc/systemd/system/pmlogger.service.d/dependency.conf | grep pmcd.service | tail -n1 | wc -l`
if [ $verify = "1" ]; then
	echo -e "\e[32mHostB exam prep appears normal\e[0m"
fi


# RH342 GRADING SCRIPT
# HostB

_pass="[ \e[32mPASS\e[0m ]\t"
_fail="[ \e[91mFAIL\e[0m ]\t"
_partial="[ \e[93mPARTIAL\e[0m ]\t"

task_8=`ls /storage/ | grep storage_file | wc -l | grep 4 | wc -l`

# Debug an application
task_9_1=`mount | grep /lvm_mount | grep dev/mapper/vg_1-lv_1 | wc -l`
task_9_2=`ls /lvm_mount/ | wc -l | grep 8 | wc -l`
task_9_3=`df -h | grep lvm_mount | grep 833M | wc -l`

# Test an application for a memory leak
task_10_1=`mount | grep /luks | grep /dev/mapper/luks-vg_2-lv_1 | wc -l `
task_10_2=`ls /luks/ | grep luks_vol_file | wc -l | grep 8 | wc -l`
task_10_3=`df -h | grep luks | grep 833M | wc -l`

#
task_11_1=`systemctl status pmcd | grep 'active (running)' | wc -l`
task_11_2=`systemctl is-enabled pmcd 2>/dev/null | grep enabled | wc -l`

echo -e "\e[1mRH342 PRACTICE EXAM:\e[0m HostB"
echo -e "================================================================"

# TASK 8
#--------------------------------------------------
if [ $task_8 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 8:\e[0m Recover data from a corrupt filesystem"


# TASK 9
#--------------------------------------------------
if [ $task_9_1 = "1" ] && [ $task_9_2 = "1" ] && [ $task_9_3 = "1" ]; then
	echo -en $_pass
elif [ $task_9_1 = "1" ] || [ $task_9_2 = "1" ] || [ $task_9_3 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 9:\e[0m Recover data from a broken LVM configuration"

# TASK 10
#--------------------------------------------------
if [ $task_10_1 = "1" ] && [ $task_10_2 = "1" ] && [ $task_10_3 = "1" ]; then
	echo -en $_pass
elif [ $task_10_1 = "1" ] || [ $task_10_2 = "1" ] || [ $task_10_3 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 10:\e[0m Recover data from an encrypted file system"

# TASK 11
#--------------------------------------------------
if [ $task_11_1 = "1" ] && [ $task_11_2 = "1" ]; then
	echo -en $_pass
elif [ $task_11_1 = "1" ] || [ $task_11_2 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 11:\e[0m Troubleshoot issues affecting service start"


