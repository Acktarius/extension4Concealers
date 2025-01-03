#!/bin/bash
# this file is subject to Licence
#Copyright (c) 2023-2025, Acktarius
#################################
# get path to the first known amd card
# expected device
# RX6400 or RX6500 or RX6500XT = 0x743f
# RX6600 or RX6600XT = 0x73ff
# RX6650XT = 0x73ef
# RX7800XT = 0x747e
for ((card_num=0; card_num<=4; card_num++)); do
    path2card="/sys/class/drm/card${card_num}/device"
    if [ -d "${path2card}" ]; then
        device=$(cat ${path2card}/device)
        case "${device}" in
            "0x743f"|"0x73ff"|"0x73ef"|"0x747e")
                break
                ;;
            *)
                continue
                ;;
        esac  
    fi
    if [ $card_num -eq 2 ]; then
        exit 1
    fi
done

revision=$(cat ${path2card}/revision)

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

if [[ "${device}" != "0x743f" ]] && [[ "${device}" != "0x73ff" ]] && [[ "${device}" != "0x73ef" ]] && [[ "${device}" != "0x747e" ]] ; then
echo "$device"
echo "---"
echo "not supported"
exit
else
#Title
gput=$(sensors | grep "edge" | grep "crit" | cut -d "+" -f 2 | cut -d "." -f 1)
color_hex $gput

case "$device" in
# RX6400 or RX6500 or RX6500XT
	"0x743f")
	case "$revision" in
		"0xc7")
		echo  "${W}RX6400"
		;;
		"0xc3")
		echo  "${W}RX6500"
		;;
		"0xc1")
		echo  "${W}RX6500XT"
		;;
		*)
		echo "unknown gpu"
		;;
	esac
	;;
# RX6600 series
	"0x73ff")
	case "$revision" in
		"0xc7")
		echo  "${W}RX6600"
		;;
		"0xc1")
		echo  "${W}RX6600XT"
		;;
		*)
		echo "unknown gpu"
		;;
	esac
	;;
# RX 6650XT
	"0x73ef")
	case "$revision" in
		"0xc1")
		echo  "${W}RX6650XT"
		;;
		*)
		echo "unknown gpu"
		;;
	esac
	;;
# RX 7800XT
	"0x747e")
	case "$revision" in
		"0xc8")
		echo  "${W}RX7800XT"
		;;
		*)
		echo "unknown gpu"
		;;
	esac
	;;
	*)
echo "unknown gpu"
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
