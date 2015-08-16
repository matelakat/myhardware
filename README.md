# myhardware

A list of my hardware

## Creating the new Array

Used parted, created a partition with the size of 1740GiB. That gave me
`/dev/sdb1`. I created an array on that:

```
sudo mdadm --create /dev/md0 --level 1 --raid-devices 2 /dev/sdb1 missing
```

Now created a filesystem on top on that:
```
sudo mkfs.ext4 /dev/md0
```

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

### Seagate Backup Plus Desktop 1

Info:

    root@plugged:~# smartctl -i /dev/sdc -d sat
    smartctl 5.40 2010-07-12 r3124 [armv5tel-unknown-linux-gnueabi] (local build)
    Copyright (C) 2002-10 by Bruce Allen, http://smartmontools.sourceforge.net

    === START OF INFORMATION SECTION ===
    Device Model:     ST2000DM001-9YN164
    Serial Number:    W1E2JW11
    Firmware Version: CC9F
    User Capacity:    2,000,398,934,016 bytes
    Device is:        Not in smartctl database [for details use: -P showall]
    ATA Version is:   8
    ATA Standard is:  ATA-8-ACS revision 4
    Local Time is:    Sat Apr  6 21:04:55 2013 UTC
    SMART support is: Available - device has SMART capability.
    SMART support is: Enabled

Testing:

    # badblocks -b 1048576 -w -o badblocks.W1E2JW11 -s -v /dev/sdc

(Still running)


### Seagate Backup Plus Desktop 2

Info:

    root@plugged:~# smartctl -i /dev/sdd -d sat
    smartctl 5.40 2010-07-12 r3124 [armv5tel-unknown-linux-gnueabi] (local build)
    Copyright (C) 2002-10 by Bruce Allen, http://smartmontools.sourceforge.net

    === START OF INFORMATION SECTION ===
    Device Model:     ST2000DM001-9YN164
    Serial Number:    W1E2GMMM
    Firmware Version: CC9F
    User Capacity:    2,000,398,934,016 bytes
    Device is:        Not in smartctl database [for details use: -P showall]
    ATA Version is:   8
    ATA Standard is:  ATA-8-ACS revision 4
    Local Time is:    Sat Apr  6 21:05:24 2013 UTC
    SMART support is: Available - device has SMART capability.
    SMART support is: Enabled

Testing:

    # badblocks -b 1048576 -w -o badblocks.W1E2GMMM -s -v /dev/sdd

(Still running)

### FUJITSU 320G 2.5 HDD

    sudo smartctl -i /dev/disk/by-id/usb-FUJITSU_MJA2320BH_G2_95DA32DE3888-0\:0
    smartctl 5.41 2011-06-09 r3365 [x86_64-linux-3.2.0-32-generic] (local build)
    Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net

    === START OF INFORMATION SECTION ===
    Model Family:     Fujitsu MJA BH
    Device Model:     FUJITSU MJA2320BH G2
    Serial Number:    K95DTA32DE3K
    LU WWN Device Id: 5 00000e 0447a185e
    Firmware Version: 0084001C
    User Capacity:    320,072,933,376 bytes [320 GB]
    Sector Size:      512 bytes logical/physical
    Device is:        In smartctl database [for details use: -P show]
    ATA Version is:   8
    ATA Standard is:  ATA-8-ACS revision 3f
    Local Time is:    Mon May  5 07:37:46 2014 BST
    SMART support is: Available - device has SMART capability.
    SMART support is: Enabled

Testing:

    sudo badblocks -b 1048576 -n -o badblocks.FUJITSU_MJA2320BH -s -v /dev/disk/by-id/usb-FUJITSU_MJA2320BH_G2_95DA32DE3888-0\:0
    Checking for bad blocks in non-destructive read-write mode
    From block 0 to 305244
    Checking for bad blocks (non-destructive read-write test)
    Testing with random pattern: done
    Pass completed, 242209 bad blocks found. (242209/0/0 errors)

Smart:

    sudo smartctl -a /dev/disk/by-id/usb-FUJITSU_MJA2320BH_G2_95DA32DE3888-0\:0

    SMART Attributes Data Structure revision number: 16
    Vendor Specific SMART Attributes with Thresholds:
    ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
    1 Raw_Read_Error_Rate     0x000f   100   073   046    Pre-fail  Always       -       287762907645
    2 Throughput_Performance  0x0005   100   100   030    Pre-fail  Offline      -       45875200
    3 Spin_Up_Time            0x0003   100   100   025    Pre-fail  Always       -       1
    4 Start_Stop_Count        0x0032   099   099   000    Old_age   Always       -       822
    5 Reallocated_Sector_Ct   0x0033   100   100   024    Pre-fail  Always       -       2 (1998, 2)
    7 Seek_Error_Rate         0x000f   100   100   047    Pre-fail  Always       -       1426
    8 Seek_Time_Performance   0x0005   100   100   019    Pre-fail  Offline      -       0
    9 Power_On_Hours          0x0032   095   095   000    Old_age   Always       -       2844
    10 Spin_Retry_Count        0x0013   100   100   020    Pre-fail  Always       -       0
    12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       772
    192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       111
    193 Load_Cycle_Count        0x0032   100   100   000    Old_age   Always       -       6204
    194 Temperature_Celsius     0x0022   100   100   000    Old_age   Always       -       34 (Min/Max 10/44)
    195 Hardware_ECC_Recovered  0x001a   100   100   000    Old_age   Always       -       28007
    196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       2 (8, 14020)
    197 Current_Pending_Sector  0x0012   100   100   000    Old_age   Always       -       1
    198 Offline_Uncorrectable   0x0010   095   095   000    Old_age   Offline      -       11
    199 UDMA_CRC_Error_Count    0x003e   200   253   000    Old_age   Always       -       0
    200 Multi_Zone_Error_Rate   0x000f   100   100   060    Pre-fail  Always       -       20738
    203 Run_Out_Cancel          0x0002   100   100   000    Old_age   Always       -       2628524572084
    240 Head_Flying_Hours       0x003e   200   200   000    Old_age   Always       -       0

### Seagate 2.5 320 HDD


    sudo smartctl -i /dev/disk/by-id/scsi-SATA_ST320LT023-1AF1_W0Q27J2N | xclip
    smartctl 5.41 2011-06-09 r3365 [x86_64-linux-3.2.0-32-generic] (local build)
    Copyright (C) 2002-11 by Bruce Allen, http://smartmontools.sourceforge.net

smart

    sudo smartctl -a /dev/disk/by-id/scsi-SATA_ST320LT023-1AF1_W0Q27J2N | grep -ie uncorrect -ie reallocated -ie pending
    5 Reallocated_Sector_Ct   0x0033   100   100   036    Pre-fail  Always       -       0
    187 Reported_Uncorrect      0x0032   100   100   000    Old_age   Always       -       0
    197 Current_Pending_Sector  0x0012   100   100   000    Old_age   Always       -       0
    198 Offline_Uncorrectable   0x0010   100   100   000    Old_age   Offline      -       0


### Seagate 2.5 320 II HDD

    sudo badblocks -b 1048576 -n -o badblocks.ST320LT0_23-1AF142_027AA8888888 -s -v /dev/disk/by-id/usb-ST320LT0_23-1AF142_027AA8888888-0\:0
    Checking for bad blocks in non-destructive read-write mode
    From block 0 to 305244
    Checking for bad blocks (non-destructive read-write test)
    Testing with random pattern:done
    Pass completed, 0 bad blocks found. (0/0/0 errors)
