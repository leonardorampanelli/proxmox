#!/bin/bash
# monta a unidade de backup

/usr/bin/mount UUID="b4cbe442-3287-4fb5-94f0-189150ace30a" /mnt/hd_backup/;

MONTAGEM="/mnt/hd_backup";

if grep -qs ${MONTAGEM} /proc/mounts; then
        echo "It's mounted."
        echo ""
        echo "Exportando as VMs"
        vzdump 100 --dumpdir /mnt/hd_backup/pve1/ --mode snapshot --maxfiles 2 --compress zstd
        vzdump 101 --dumpdir /mnt/hd_backup/pve1/ --mode snapshot --maxfiles 2 --compress zstd

        /usr/bin/umount /mnt/hd_backup;
else
        echo "It's not mounted."
fi
