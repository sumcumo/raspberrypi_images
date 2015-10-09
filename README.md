# raspberrypi_images

##Introduction

This repositories contains scripts for flashing a SD card and an USB flash drive for the usage with a
[RaspberryPI](https://www.raspberrypi.org/). The SD card could be as small as 64 MB but it will be hard to find one
in this size. The USB flash drive has to be 6 GB in size at minimum. The idea is to boot from the SD card and run the
OS from the USB flash drive.

The OS is a Debian Jessie Linux and the image can be found at [https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/).

##Flashing the drives

Following, we will show the simple steps to flash both the SD card and the USB flash drive.

###Prerequisites

####Hardware

Obviously, you need a RaspberryPI. It does not matter if it's an older or newer model. They all have USB slots. Different
are the SD card slots. The older models need a standard SD card and the new models need a microSD card.

What you need else is power.

####Software

We did all this on MAC OS X. The only thing you need to install is `dcfldd`. Assuming you have [Homebrew](http://brew.sh/) installed
(and if not stop here and do it now), it's the usual command:

    brew install dcfldd

*Side note: the sources of `dcfldd` are hosted at [sourceforge](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/dcfldd.rb). Just sayin' ...*

###Flashing the SD card

You will need the following files form the directory `files` in this repository:

* rpi_prep_sd.sh
* rpi_data.img
* mbr_sd.txt

Now follow these steps:

#### 1.Insert the SD card

Mac books do have a slot for SD cards. You may need an adapter for a microSD card. But you could also use an external
card reader.
