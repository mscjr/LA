#!/bin/bash

# Verify environment
verify=`ls /root/ | grep packet.cap | wc -l`
if [ $verify = "1" ]; then
	echo -e "\e[32mHostD exam prep appears normal\e[0m"
fi

# RH342 GRADING SCRIPT
# HostD

_pass="[ \e[32mPASS\e[0m ]\t"
_fail="[ \e[91mFAIL\e[0m ]\t"
_partial="[ \e[93mPARTIAL\e[0m ]\t"

task_15_1=`cat /etc/iscsi/initiatorname.iscsi | grep "iqn.1994-05.com.redhat:c1cd6e78d22" | wc -l`
task_15_2=`iscsiadm -m node -T iqn.2003-01.org.linux-iscsi.ip-10-0-1-10.x8664:sn.a3776832068c -l 2>/dev/null; lsblk | grep sda | wc -l`

task_16_1=`cat /etc/rsyslog.conf | grep "@@10.0.1.12:514" | wc -l`
task_16_2=`cat /etc/rsyslog.conf | grep "@@ip-10-0-1-12:514" | wc -l`

task_17=`/usr/lib/rpm/rpmdb_verify /var/lib/rpm/Packages 2>/dev/null | grep -v failed | wc -l`

task_18_1=`curl -I http://ip-10-0-1-10/index.html 2>/dev/null | grep Apache | wc -l`
task_18_2=`cat /root/passwd.txt 2>/dev/null | grep mypaSSword | wc -l`

task_19=`cat /root/test.txt 2>/dev/null | grep ldap.example.com | wc -l`

task_20=`runuser -l cloud_user -c 'staprun cloud_tap' 2>/dev/null | grep Success\! | wc -l`

echo -e "\e[1mRH342 PRACTICE EXAM:\e[0m HostD"
echo -e "================================================================"

# TASK 15
#--------------------------------------------------
if [ $task_15_1 = "1" ] && [ $task_15_2 = "1" ]; then
	echo -en $_pass
elif [ $task_15_1 = "1" ] || [ $task_15_2 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 15:\e[0m [ HostD ] Troubleshoot iSCSI"
#--------------------------------------------------
# TASK 16
#--------------------------------------------------
if [ $task_16_1 = "1" ] || [ $task_16-2 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 16:\e[0m [ HostD ] Configure remote logging"
#--------------------------------------------------
# TASK 17
#--------------------------------------------------
if [ $task_17 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 17:\e[0m Troubleshoot RPM issues"
#--------------------------------------------------
# TASK 18
#--------------------------------------------------
if [ $task_18_1 = "1" ] && [ $task_18_2 = "1" ]; then
	echo -en $_pass
elif [ $task_18_1 = "1" ] || [ $task_18_2 = "1" ]; then
	echo -en $_partial
else
	echo -en $_fail
fi
echo -e "\e[1mTask 18:\e[0m Troubleshoot networking"
#--------------------------------------------------
# TASK 19
#--------------------------------------------------
if [ $task_19 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 19:\e[0m Examine and retrieve information from an sosreport"
#--------------------------------------------------
# TASK 20
#--------------------------------------------------
#  if [ $task_16_1 = "1" ] || [ $task_16-2 = "1" ]; then
#  May 2020, RL fix logic
if [ $task_20 = "1" ]; then
	echo -en $_pass
else
	echo -en $_fail
fi
echo -e "\e[1mTask 20:\e[0m Assist in providing information for third party investigation"

#--------------------------------------------------
# Extra Credit
#--------------------------------------------------

extra_check_1=`mount | grep /storage | wc -l`
extra_check_2=`lsblk | grep luks-vg_1-lv_1 | grep /storage | grep crypt | wc -l`
extra_check_3=`ls /storage/ | grep encrypted_vol_file | wc -l | grep 8  | wc -l`

if [ $task_15_1 = "1" ] && [ $task_15_2 = "1" ] \
&& [ $task_18_1 = "1" ] && [ $task_18_2 = "1" ] \
&& [ $extra_check_1 = "1" ] && [ $extra_check_2 = "1" ] && [ $extra_check_3 = "1" ]; then
	echo -en $_pass
	echo -e "\e[1mTask 21:\e[0m Extra credit unlocked!  Look in /storage"
	cd /storage/ && wget https://github.com/mscjr/LA/raw/master/RH342/grats.tgz > /dev/null 2>&1
	tar xzf grats.tgz && rm -rf grats.tgz
fi
