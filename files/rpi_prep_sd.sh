#!/bin/bash

MBR=mbr_sd.txt
IF=rpi_boot.img
OF=$1

diskutil umountDisk $OF && \
cat $MBR | fdisk -yr $OF && \
echo writing image $IF && \
dcfldd statusinterval=1 bs=1m if=${IF} of=${OF}s1 && \
diskutil umountDisk $OF


