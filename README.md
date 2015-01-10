# RAIDMon
Linux RAID monitoring bash toolset

### Install hpacucli

#### If on x86_64

    cd /tmp
    wget http://mirror.nforce.com/pub/software/raidtools/hpacucli-tool/hpacucli-9.40-12.0.x86_64.rpm
    rpm -Uvh hpacucli-9.40-12.0.x86_64.rpm

#### If on i386

    cd /tmp
    wget http://mirror.nforce.com/pub/software/raidtools/hpacucli-tool/hpacucli-9.40-12.0.i386.rpm
    rpm -Uvh hpacucli-9.40-12.0.i386.rpm

#### Other notes

You may need the following as well if the above RPM install fails, install these and then retry the RPM install

    yum install glibc.i686 libgcc.i686 libstdc++.i686

----

### Install RAIDMon

     wget https://raw.githubusercontent.com/arjitc/RAIDMon/master/raidmon.sh -O /bin/raidmon
     chmod +x /bin/raidmon

----

### RAIDMon usage

#### List all drives

     raidmon listall

#### List RAID recovery progress

      raidmon rebuildstatus

#### List Failed drives

      raidmon listfailed
