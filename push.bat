echo off
SET dest=/data/local/tmp

adb kill-server

echo [*] Waiting for device...
adb wait-for-device > nul
echo [*] Pushing files...

adb push iovyroot %dest%
adb push su %dest%
adb push install-recovery.sh %dest%
adb push smallroot.sh %dest%
adb push smallroot-install.sh %dest%
adb push checkroot.sh %dest%

adb shell chmod 755 %dest%/iovyroot
adb shell chmod 755 %dest%/smallroot.sh
adb shell chmod 755 %dest%/smallroot-install.sh
adb shell chmod 755 %dest%/checkroot.sh

echo [*] Done
