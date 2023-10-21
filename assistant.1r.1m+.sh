#!/bin/bash
# this file is subject to Licence
#Copyright (c) 2023, Acktarius
#################################

node_active=$(systemctl status ccx-guardian.service | grep -c "Active: active (running)")
miner_active=$(systemctl status ccx-mining.service | grep -c "Active: active (running)")
s_color_hex () {
if [[ "$1" == "1" ]]; then
        status="Active"
	hex="#1fc600"
elif [[ "$1" == "0" ]]; then
        hex="#c5000a"
	status="Inactive"
else
        hex="#ef8200"
	status="unkknown"
fi
}



if [[ $node_active != "1" ]] && [[ $miner_active != "1" ]]; then
	W=":warning:"
elif [[ $node_active != "1" ]] || [[ $miner_active != "1" ]]; then
	W=":grey_exclamation:"
else
	W=""
fi

echo "$W | iconName=cham"
echo "---"
s_color_hex $node_active
echo "Node service : <span color='${hex}'>${status}</span>"
s_color_hex $miner_active
echo "Mining service : <span color='${hex}'>${status}</span>"
unset status hex
echo "Conceal assistant | iconName=cham bash=/opt/conceal-toolbox/ccx-assistant_firefox.sh  terminal=false"

