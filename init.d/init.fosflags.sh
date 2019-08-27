#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

FILE="/data/.firstboot"

if [ -f $FILE  ]; then
  echo
else
  sleep 120
  settings --user 0 put secure show_ime_with_hard_keyboard 1
  settings --user 0 put global bluetooth_on 1
  settings --user 0 put system screen_off_timeout 900000
  service call bluetooth_manager 8
  settings --user 0 put global policy_control immersive.status=*
  echo 1 > $FILE
fi

