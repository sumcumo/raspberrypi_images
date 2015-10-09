#!/bin/bash

MBR=mbr_usb.txt
IF=rpi_data.img
OF=$1

diskutil umountDisk $OF && \
cat $MBR | fdisk -yr $OF && \
echo writing image $IF && \
dcfldd statusinterval=1 bs=10m if=${IF} of=${OF}s1 && \
diskutil umountDisk $OF


