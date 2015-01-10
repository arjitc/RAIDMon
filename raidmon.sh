#!/bin/bash
ACTION=$1
if [[ -z "$ACTION" ]]
then
   echo "Error: action is undefined"
   echo "Example:"
   echo "List all drives: sh raidmon.sh listall"
   exit
fi
if [ "$ACTION" == listall ]; then
	# list all physical drives
	physical_drives=$(for I in `sudo /usr/sbin/hpacucli ctrl all show | awk '{ print $6 }'`; do sudo /usr/sbin/hpacucli ctrl slot=$I pd all show; done)
	if [[ -z "$physical_drives" ]]; then
		echo "No Physical drives found"
	else
		echo \n $physical_drives
	fi
fi
if [ "$ACTION" == rebuildstatus ]; then
	## RAID rebuild %
	rebuild_status=$(hpacucli ctrl all show config | grep Recovering | awk {'print $8'})
	echo $rebuild_status
	if [[ -z "$rebuild_status" ]]; then
		echo "RAID Status OK"
	else
		echo $rebuild_status
	fi
fi
if [ "$ACTION" == listfailed ]; then
	## RAID rebuild %
	rebuild_status=$(hpacucli ctrl all show config | grep Failed)
	echo $rebuild_status
	if [[ -z "$rebuild_status" ]]; then
		echo "RAID Status OK"
	else
		echo $rebuild_status
	fi
fi

