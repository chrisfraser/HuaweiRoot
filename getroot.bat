echo off

:start_root
echo [*] Waiting for device...
adb wait-for-device > nul

adb shell %dest%/smallroot.sh

echo [*] Waiting for device...
adb wait-for-device > nul

FOR /F "tokens=* USEBACKQ" %%F IN (`adb shell su -c /data/local/tmp/checkroot.sh`) DO (
SET is_rooted=%%F
)
IF "%is_rooted%"=="rooted" GOTO done

echo [*] Root FAILED, retrying...
GOTO start_root

:done
ECHO [*] Device Rooted
