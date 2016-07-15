#!/system/bin/sh
BIN=/data/local/tmp

echo '[*] Attempting root...'

( $BIN/iovyroot $BIN/smallroot-install.sh ) & sleep 60 ; kill $!
