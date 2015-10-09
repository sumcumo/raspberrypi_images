# raspberrypi_images

## Introduction

This repositories contains scripts for flashing a SD card and an USB flash drive for the usage with a
[RaspberryPI](https://www.raspberrypi.org/). The SD card could be as small as 64 MB but it will be hard to find one
in this size. The USB flash drive has to be 6 GB in size at minimum. The idea is to boot from the SD card and run the
OS from the USB flash drive.

The OS is a Debian Jessie Linux and the image can be found at [https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/).

## Flashing the drives

Following, we will show the simple steps to flash both the SD card and the USB flash drive.

### Prerequisites

#### Hardware

Obviously, you need a RaspberryPI. It does not matter if it's an older or newer model. They all have USB slots. Different
are the SD card slots. The older models need a standard SD card and the new models need a microSD card.

What you need else is power.

#### Software

We did all this on MAC OS X. The only thing you need to install is `dcfldd`. Assuming you have [Homebrew](http://brew.sh/) installed
(and if not stop here and do it now), it's the usual command:

    brew install dcfldd

*Side note: the sources of `dcfldd` are hosted at [sourceforge](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/dcfldd.rb). Just sayin' ...*

### Flashing the SD card

You will need the following files form the directory `files` in this repository:

* rpi\_prep\_sd.sh
* rpi_boot.img
* mbr_sd.txt

Now follow these steps:

#### 1.Insert the SD card into your Mac book

Mac books do have a slot for SD cards. You may need an adapter for a microSD card. But you could also use an external
card reader.

#### 2.Find the SD card

Now use the OS X command line programm `diskutil` to find the SD card:

    ~/p/s/r/files git:master: diskutil list
    /dev/disk0 (internal, physical):
       #:                       TYPE NAME                    SIZE       IDENTIFIER
       0:      GUID_partition_scheme                        *500.3 GB   disk0
       1:                        EFI EFI                     209.7 MB   disk0s1
       2:          Apple_CoreStorage Macintosh HD            439.3 GB   disk0s2
       3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
       4:       Microsoft Basic Data BOOTCAMP                60.1 GB    disk0s4
    /dev/disk1 (internal, virtual):
       #:                       TYPE NAME                    SIZE       IDENTIFIER
       0:                  Apple_HFS Macintosh HD           +439.0 GB   disk1
                                     Logical Volume on disk0s2
                                     31CFA6B8-A369-4BEE-B85E-2DF787B7B407
                                     Unlocked Encrypted
    /dev/disk2 (internal, physical):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:     FDisk_partition_scheme                        *30.9 GB    disk2
      1:             Windows_FAT_32 boot                    58.7 MB    disk2s1*

In this case the SD Card is located at `/dev/disk2`.

**Iportant:** Please be very careful here. If you choose the wrong location, you will crash your OS!

#### 3. Flash the image to the SD card

Change now into the directory files with `cd files`. Then run the script `rpi_prep_sd.sh` and give the location
of the SD card received in step 2. as an argument. You need to this with `sudo`:

    ~/p/s/r/files git:master: sudo ./rpi_prep_sd.sh /dev/disk2
    Password:
    Unmount of all volumes on disk2 was successful
    fdisk: could not open MBR file /usr/standalone/i386/boot0: No such file or directory
    writing image rpi_boot.img
    1792 blocks (56Mb) written.
    1792+0 records in
    1792+0 records out
    Unmount of all volumes on disk2 was successful

If you are prompted with a warning like this at the beginning

![warning](https://drive.google.com/uc?export=view&id=0B2xXhdpvuHcGLUpTRWdFOWVVOHM

simply click it away by hitting *Ignore*.

That's it! Remove the SD card with and put it into the slot of your RaspberryPI.

### Flashing the image to the USB flash drive

You will need the following files form the directory `files` in this repository:

* rpi\_prep\_usb.sh
* rpi_data.img
* mbr_usb.txt

Now follow these steps:

#### 1.Insert the USB flash drive into your Mac book

This should be a fairly simple task. You can also put it into an external usb hub.

#### 2.Find the USB flash drive

Now use the OS X command line programm `diskutil` to find the USB flash drive:

    ~/p/s/r/files git:master: diskutil list
    /dev/disk0 (internal, physical):
       #:                       TYPE NAME                    SIZE       IDENTIFIER
       0:      GUID_partition_scheme                        *500.3 GB   disk0
       1:                        EFI EFI                     209.7 MB   disk0s1
       2:          Apple_CoreStorage Macintosh HD            439.3 GB   disk0s2
       3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
       4:       Microsoft Basic Data BOOTCAMP                60.1 GB    disk0s4
    /dev/disk1 (internal, virtual):
       #:                       TYPE NAME                    SIZE       IDENTIFIER
       0:                  Apple_HFS Macintosh HD           +439.0 GB   disk1
                                     Logical Volume on disk0s2
                                     31CFA6B8-A369-4BEE-B85E-2DF787B7B407
                                     Unlocked Encrypted
    /dev/disk4 (external, physical):
       #:                       TYPE NAME                    SIZE       IDENTIFIER
       0:     FDisk_partition_scheme                        *30.8 GB    disk4
       1:                      Linux                         5.0 GB     disk4s1*

In this case the USB flash drive is located at `/dev/disk4`.

**Iportant:** Please be very careful here. If you choose the wrong location, you will crash your OS!

#### 3. Flash the image to the USB flash drive

Change now into the directory files with `cd files` if you are not there already. Then run the script `rpi_prep_usb.sh`
and give the location of the USB flash drive received in step 2. as an argument. You need to this with `sudo`:

    ~/p/s/r/files git:master: sudo ./rpi_prep_usb.sh /dev/disk4
    Password:
    Unmount of all volumes on disk4 was successful
    fdisk: could not open MBR file /usr/standalone/i386/boot0: No such file or directory
    writing image rpi_data.img
    152459 blocks (4764Mb) written.
    152459+1 records in
    152459+1 records out
    Unmount of all volumes on disk4 was successful

If you are prompted again with a warning like this at the beginning

![warning](https://drive.google.com/uc?export=view&id=0B2xXhdpvuHcGLUpTRWdFOWVVOHM

simply click it away by hitting *Ignore*.

That's it! Remove the USB flash drive and put it into the slot of your RaspberryPI.
