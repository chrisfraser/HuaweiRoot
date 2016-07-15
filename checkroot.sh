#!/system/bin/sh

if id | grep -q 'uid=0'; then
  echo "rooted"
fi
