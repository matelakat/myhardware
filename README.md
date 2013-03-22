# myhardware

A list of my hardware

## Hard Drives

### Samsung laptop HDD 120

    $ sudo smartctl -i /dev/disk/by-id/usb-SAMSUNG_HM120JI_SAMSUNG_HMS09GJD0P601701-0\:0

    Model Family:     SAMSUNG SpinPoint M40/60/80
    Device Model:     SAMSUNG HM120JI
    Serial Number:    S09GJD0P601701
    Firmware Version: YF100-19
    User Capacity:    120,034,123,776 bytes [120 GB]
    Sector Size:      512 bytes logical/physical
    Device is:        In smartctl database [for details use: -P show]
    ATA Version is:   7
    ATA Standard is:  ATA/ATAPI-7 T13 1532D revision 0
    Local Time is:    Fri Mar 22 19:29:14 2013 GMT
    SMART support is: Available - device has SMART capability.
    SMART support is: Enabled

    [root@alarmpi ~]# badblocks -b 1048576 -n -o badblocks.sam120 -s -v /dev/sda
    [root@alarmpi ~]# ls -la badblocks.sam120 
    -rw-r--r-- 1 root root 0 Mar 20 21:37 badblocks.sam120

Testing:

    matelakat@fodinoti:~$ sudo smartctl -t short /dev/sdb
    matelakat@fodinoti:~$ sudo smartctl -H /dev/sdb
    SMART overall-health self-assessment test result: PASSED

### Samsung desktop HDD 640
    
    [root@alarmpi ~]# smartctl -i /dev/disk/by-id/usb-SAMSUNG_HD642JJ_1AF909041928-0\:0
    smartctl 6.0 2012-10-10 r3643 [armv6l-linux-3.6.11-8-ARCH+] (local build)
    Copyright (C) 2002-12, Bruce Allen, Christian Franke, www.smartmontools.org

    === START OF INFORMATION SECTION ===
    Model Family:     SAMSUNG SpinPoint F1 DT
    Device Model:     SAMSUNG HD642JJ
    Serial Number:    S1AFJ90Q904192
    LU WWN Device Id: 5 0000f0 00b091429
    Firmware Version: 1AA01113
    User Capacity:    640,135,028,736 bytes [640 GB]
    Sector Size:      512 bytes logical/physical
    Device is:        In smartctl database [for details use: -P show]
    ATA Version is:   ATA/ATAPI-7, ATA8-ACS T13/1699-D revision 3b
    Local Time is:    Fri Mar 22 19:34:06 2013 GMT
    SMART support is: Available - device has SMART capability.
    SMART support is: Enabled

    [root@alarmpi ~]# badblocks -b 1048576 -n -o badblocks.sam640 -s -v /dev/sda
    [root@alarmpi ~]# ls -la badblocks.sam640 
    -rw-r--r-- 1 root root 0 Mar 21 07:04 badblocks.sam640

Testing:

    [root@alarmpi ~]# smartctl -t short /dev/sda
    [root@alarmpi ~]# smartctl -H /dev/sda
    SMART overall-health self-assessment test result: PASSED
