#!/bin/bash
# Xigmanas / FreeNAS USB to USB Copy and USB to ISO Backup Shell Script
# by ClusteredNetworks.com (info@clusterednetworks.com)
# 
# Performs a full copy of your Boot USB to a Backup USB Device as well
# as creates an backup ISO file of your USB boot device with date.
# e.g yyyy-mm-dd.xigmanas-backup-usb.iso
# Be sure to edit the configuration options at the beginning of the script to match your environment prior to executing.
NOW=$(date +"%Y-%m-%d")
#----------------------------------------
# OPTIONS
#----------------------------------------
# Edit to suit your environment and options
DAYS_TO_KEEP=4    # 0 to keep forever
BOOT_USB=/dev/da0  # path to your USB device
BACKUP_USB=/dev/da1 # backup USB device
BACKUP_PATH=/mnt/Pool2/backup # backup path to create iso file
BS_SIZE=16k  # size 
# Backup to Backup USB Device
# dd if=$BOOT_USB of=$BACKUP_USB bs=16k status=progress
# Backup to ISO
dd if=$BOOT_USB of=$BACKUP_PATH/$NOW-xigmanas-backup-usb.iso bs=$BS_SIZE status=progress
# Delete old backups
if [ "$DAYS_TO_KEEP" -gt 0 ] ; then
  echo "Deleting backups older than $DAYS_TO_KEEP days"
  find $BACKUP_PATH/* -mtime +$DAYS_TO_KEEP -exec rm {} \;
fi

