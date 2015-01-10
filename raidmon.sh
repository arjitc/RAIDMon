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
	physical_drives=$(hpacucli ctrl all show config | grep physicaldrive)
	if [[ -z "$physical_drives" ]]; then
	echo "No Physical drives found"
	fi
fi
if [ "$ACTION" == rebuildstatus ]; then
	## RAID rebuild %
	rebuild_status=$(hpacucli ctrl all show config | grep Recovering | awk {'print $8'})
	echo $rebuild_status
	if [[ -z "$rebuild_status" ]]; then
	echo "RAID Status OK"
	fi
fi


