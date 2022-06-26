#!/bin/sh

FW="$1"
unset NAME
eval $(lsblk -P -p -d --output NAME,MODEL|grep "DFU[ _]Disk")
[ -z ${NAME+x} ] && exit 1  # Could not find DFU device
umount "$NAME"
mkdir /tmp/mntdfu
mount -t msdos "$NAME" /tmp/mntdfu
cp "$FW" "/tmp/mntdfu/$(basename $FW|tr a-z A-Z)"
sync
umount /tmp/mntdfu
rmdir /tmp/mntdfu
