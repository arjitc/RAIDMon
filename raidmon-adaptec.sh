#!/bin/bash
ACTION=$1
arcconf_version=$(/usr/StorMan/arcconf version | grep Version | awk '{print $5}')
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
