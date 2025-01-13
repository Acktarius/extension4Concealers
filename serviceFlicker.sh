#!/bin/bash
# this file is subject to Licence
#Copyright (c) 2025, Acktarius
###################################
serviceFlicker () {
case $1 in
	"1")
	echo "Enter your password to stop ${2} service or Ctrl+C to abandon"
	sudo systemctl stop ccx-${2}.service
	exit 0
	;;
	"0")
	echo "Enter your password to start ${2} service or Ctrl+C to abandon"
	sudo systemctl restart ccx-${2}.service
	exit 0
	;;
	*)
	echo "something unexpected"
	exit 1
	;;
esac
}
serviceFlicker $1 $2

