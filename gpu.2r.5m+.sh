#!/bin/bash
# this file is subject to Licence
#Copyright (c) 2023, Acktarius
#################################
# get path to card
path2card=$(readlink -f /sys/class/drm/card0/device)
device=$(cat ${path2card}/device)
# expected device
# RX6400 = 0x743f
# RX6600 = 0x73ff
# RX6650XT = 0x73ef

color_hex () {
if [[ "$1" -lt "55" ]]; then
	hex="#6495ED"
	W=""
elif [[ "$1" -lt "77" ]]; then
	hex="#FF7F50"
	W=""
else
	hex="#DD3163"
	W=":thermometer:"
fi
}

if [[ "${device}" != "0x743f" ]] && [[ "${device}" != "0x73ff" ]] && [[ "${device}" != "0x73ef" ]] ; then
echo "$device"
echo "---"
echo "not supported"
exit
else
#Title
gput=$(sensors | grep "edge" | cut -d "+" -f 2 | cut -d "." -f 1)
color_hex $gput
case "$device" in
	"0x743f")
	echo  "${W}RX6400"
	;;
	"0x73ff")
	echo "${W}RX6600"
	;;
	"0x73ef")
	echo "${W}>RX6650XT"
	;;
	*)
	echo "unknown GPU"
	;;
esac
#next
echo "---"


fspeed=$(cat ${path2card}/hwmon/hwmon*/pwm1)
fmax=$(cat ${path2card}/hwmon/hwmon*/pwm1_max)
f=$(( 100 * $fspeed / $fmax ))
load=$(cat ${path2card}/gpu_busy_percent)
echo -e ":thermometer: edge Temp : <span color='${hex}'>${gput}</span>\u00B0\C"
color_hex $f
echo ":cyclone: fan : <span color='${hex}'>${f}</span>%"
color_hex $load
echo -e "\u26a1\ load : <span color='${hex}'>${load}</span>%"

unset hex W
#command_fan_speed="/opt/conceal-toolbox/oc-amd/fan-speed.sh"
#echo "Fan speed script | iconName=fs size=10 bash=${command_fan_speed}  terminal=true"


fi
