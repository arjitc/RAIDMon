#!/bin/bash
ACTION=$1
hpacucli_version=$(hpacucli version)

if [[ -z "$hpacucli_version" ]]
then
   echo "Error: hpacucli is not installed"
   exit
fi

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
	else
		echo "$physical_drives"
	fi
fi
if [ "$ACTION" == rebuildstatus ]; then
	## RAID rebuild %
	rebuild_status=$(hpacucli ctrl all show config | grep Recovering | awk {'print $8'})
	if [[ -z "$rebuild_status" ]]; then
		echo "RAID Status OK"
	else
		echo "$rebuild_status"
	fi
fi
if [ "$ACTION" == listfailed ]; then
	## RAID rebuild %
	rebuild_status=$(hpacucli ctrl all show config | grep Failed)
	echo $rebuild_status
	if [[ -z "$rebuild_status" ]]; then
		echo "NO Failed HDD detected"
	else
		echo "$rebuild_status"
	fi
fi
