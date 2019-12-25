#!/system/bin/sh

readonly OZWPAN_DEV_FILE="/dev/ozwpan"
readonly OZWPAN_SELECT_FILE="/sys/class/ozmo_wpan/ozwpan/select"
readonly OZWPAN_MODE_FILE="/sys/class/ozmo_wpan/ozwpan/mode"
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

while [ 1 ]; do
    if [ -e ${OZWPAN_DEV_FILE} ]; then
        chown root:root ${OZWPAN_DEV_FILE} ${OZWPAN_SELECT_FILE} ${OZWPAN_MODE_FILE}
        chmod 0660 ${OZWPAN_DEV_FILE} ${OZWPAN_SELECT_FILE} ${OZWPAN_MODE_FILE}
        break
    else
        sleep 1
    fi
done
