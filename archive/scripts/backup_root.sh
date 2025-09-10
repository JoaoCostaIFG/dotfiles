#!/bin/sh

set -eu

backup_drive_part="/dev/sde1"

# mount the drive
mount "$backup_drive_part" /mnt

# mount the root to get rid of dev, proc, sys, etc. files
mkdir -p /mnt/tmp
mount / /mnt/tmp/ -o bind

# rsync the files
mkdir -p "/mnt/$(hostname)"
rsync -avPAHXxP --numeric-ids --exclude "/mnt/tmp/mnt" --exclude "/mnt/tmp/mnt" "/mnt/tmp/" "/mnt/$(hostname)"

# sync and umount
sync
umount -R /mnt
