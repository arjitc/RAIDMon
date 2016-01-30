# RAIDMon
Linux RAID monitoring bash toolset for mdadm (software RAID arrays)

### Install RAIDMon for mdadm

     wget https://raw.githubusercontent.com/arjitc/RAIDMon/master/raidmon-mdadm.sh -O /bin/raidmon
     chmod +x /bin/raidmon

----

### RAIDMon usage

#### List all drives

     raidmon md0 listall

#### List Working devices

      raidmon md0 wd

#### List array UUID

      raidmon md0 getuuid
