#!/bin/bash
ACTION=$1
arcconf_version=$(/usr/StorMan/arcconf version | grep Version | awk '{print $5}')
#change this to your controller number!
controller_number=1

if [[ -z "$arcconf_version" ]]
then
   echo "Error: arcconf is not installed"
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
	physical_drives=$(/usr/StorMan/arcconf getconfig $controller_number | grep Group)
	if [[ -z "$physical_drives" ]]; then
		echo "No Physical drives found"
	else
		echo "$physical_drives"
	fi
fi
if [ "$ACTION" == onlinecount ]; then
	# list all online physical drives
	online_count=$(/usr/StorMan/arcconf getconfig $controller_number | grep Online | wc -l)
	if [[ -z "$online_count" ]]; then
		echo "No Physical drives found online"
	else
		echo "$online_count"
	fi
fi

