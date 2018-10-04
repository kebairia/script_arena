#!/bin/bash
#
#   ┌───────────────────────────────────────────────────────┐
#   │  This Script is a pomodoro technique implementation   │
#   └───────────────────────────────────────────────────────┘
#
# --- CONSTANTS ---------------------------------------------
reset=$(tput setf 0)
blue=$(tput setf 1)
green=$(tput setf 2)
cyan=$(tput setf 3)
red=$(tput setf 4)
magenta=$(tput setf 5)
yellow=$(tput setf 6)
grey=$(tput setf 7)
#--- Brighter colors ----------------------
br_black=$(tput setf 8)
br_red=$(tput setf 9)
br_green=$(tput setf 10)
br_yellow=$(tput setf 11)
br_blue=$(tput setf 12)
br_magenta=$(tput setf 13)
br_cyan=$(tput setf 14)
white=$(tput setf 15)
#------------------------------------------
info() {
    echo "${br_yellow}TIME NOW: ${br_cyan}$(date +%H:%M:%S)${white}"
}
focus(){
    min=0
    min_empty=24
    for min in {0..24}
    do
	for sec in {0..59}
	do
	   _fill=$(printf "%${min}s")
	   _left=$(printf "%${min_empty}s")
	   printf "\r${br_yellow}PROGRESS:${br_red}│${_fill// /\█}${_left}│${white} ${min}m:${sec}s"
	    sleep 0.01
	done
	let min_empty=$min_empty-1
    done
    echo
}
defus() {
    min=0
    min_empty=9
    for min in {0..9}
    do
	for sec in {0..59}
	do
	   _fill=$(printf "%${min}s")
	   _left=$(printf "%${min_empty}s")
	   printf "\r${br_yellow}PROGRESS:${br_green}│${_fill// /\█}${_left}│${white}\t\t     ${min}m:${sec}s"
	    sleep 0.01
	done
	let min_empty=$min_empty-1
    done
    echo
}
clear
info
echo
for i in {1..4}
do
    focus
    notify-send "The end of focus time N°:${i}"
    defus
done
