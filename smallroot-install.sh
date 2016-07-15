#!/system/bin/sh

BIN=/data/local/tmp

install_perm() {
    cat $1 > $2
    chown 0.0 $2
    chmod 755 $2
}

echo '[*] Starting root install'

mount -o rw,remount /system
setenforce 0

install_perm $BIN/su /system/xbin/su
install_perm $BIN/su /system/xbin/daemonsu

install_perm $BIN/install-recovery.sh /system/etc/install-recovery.sh
ln -s /system/etc/install-recovery.sh /system/bin/install-recovery.sh

mount -o ro,remount /system
sync
echo '[*] Root install complete, rebooting'
sleep 5
reboot
