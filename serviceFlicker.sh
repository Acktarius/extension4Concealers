#!/bin/bash
# this file is subject to Licence
#Copyright (c) 2025, Acktarius
###################################
#Couleurs
case "$TERM" in
        xterm-256color)
        WHITE=$(tput setaf 7 bold)
        ORANGE=$(tput setaf 202)
        GRIS=$(tput setaf 245)
		LINK=$(tput setaf 4 smul)
        TURNOFF=$(tput sgr0)
        ;;
        *)
        WHITE=''
		ORANGE=''
        GRIS=''
		LINK=''
        TURNOFF=''
        ;;
esac
#Presentation
presentation (){
echo -e "${GRIS}####################################################################"
echo -e "#                                                                  #"
echo -e "#-->   ${WHITE}     SERVICE FLICKER FOR ${ORANGE}ccx-mining.service   ${TURNOFF}${GRIS}           <--#"
echo -e "#                                                                  #"
echo -e "#                                                                  #"
echo -e "#                                                                  #"
echo -e "####################################################    ${WHITE}.::::."
echo -e "${GRIS}#                                                   ${WHITE}.:---=--=--::."
echo -e "${GRIS}#${WHITE}  Enter your password to ${ORANGE}${1} ${2} ${WHITE}service \t    -=:+-.  .-=:=:"
echo -e "${GRIS}#   or ${WHITE}Ctrl+C ${GRIS}to abandon                    \t    -=:+."
echo -e "${GRIS}#                                                   ${WHITE}-=:+."
echo -e "${GRIS}#                                                   ${WHITE}-=:+."
echo -e "${GRIS}#						    ${WHITE}-=:=."
echo -e "${GRIS}#                                                   ${WHITE}-+:-:    .::."
echo -e "${GRIS}#						    ${WHITE}-+==------===-"
echo -e "${GRIS}#############################################          ${WHITE}:-=-==-:${TURNOFF}\n\n"

}


serviceFlicker () {
case $1 in
	"1")
	presentation "stop" ${2}
	sudo systemctl stop ccx-${2}.service
	exit 0
	;;
	"0")
	presentation "start" ${2}
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
