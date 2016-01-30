#!/bin/bash
## Example: md0
mdadm_device=$1
ACTION=$2

if [[ -z "$ACTION" ]]
then
   echo "Error: action is undefined"
   echo "Example:"
   echo "List all drives: sh raidmon.sh md0 listall"
   exit
fi
if [[ -z "$mdadm_device" ]]
then
   echo "Error: mdadm device is undefined"
   echo "Example:"
   echo "List all drives: sh raidmon.sh md0 listall"
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
	list_devices=$(mdadm --detail /dev/$mdadm_device | grep "/dev/")
	if [[ -z "$list_devices" ]]; then
		echo "No Devices found"
	else
		echo "$list_devices"
	fi
fi

if [ "$ACTION" == getuuid ]; then
	# List devices
	get_uuid=$(mdadm --detail /dev/$mdadm_device | grep UUID | awk '{print $3}')
	if [[ -z "$get_uuid" ]]; then
		echo "No UUID found"
	else
		echo "$get_uuid"
	fi
fi
