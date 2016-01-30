#!/bin/bash
ACTION=$1
## Example: md0
mdadm_device=""

if [[ -z "$ACTION" ]]
then
   echo "Error: action is undefined"
   echo "Example:"
   echo "List all drives: sh raidmon.sh listall"
   exit
fi
if [ "$ACTION" == wd ]; then
	# Working Devices
	working_devices=$(mdadm --detail /dev/$mdadm_device | grep "Working Devices" | awk '{print $3}')
	if [[ -z "$working_devices" ]]; then
		echo "No Working Devices found"
	else
		echo "$working_devices"
	fi
fi

if [ "$ACTION" == listall ]; then
	# List devices
	list_devices=$(mdadm --detail /dev/md0 | grep "/dev/")
	if [[ -z "$list_devices" ]]; then
		echo "No Devices found"
	else
		echo "$list_devices"
	fi
fi
