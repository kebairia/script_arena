#!/bin/env bash
#AUTHOR: Kebairia Zakaria
#Github Profile: Kebairia Zakaria
#Project Repository: Kebairia Zakaria
#TODO: give the use the chace to choose the shape of the progress bar

#Import the color library
. ~/bin/color.lib
progress_bar(){
    # Creat the Progress scheme
    _done=$(printf "%${1}s")
    # Calculate the remaining space in the bar 
    #->  _done   <-> _left <-
    # [===========          ]
    let _empty=$((${2} - ${1}))
    _left=$(printf "%${_empty}s")
printf "\rPROGRESS: [${_done// /\=}${_left}]${1}%%"
}
_start=1
_end=50
for number in $(seq $_start $_end)
do
    progress_bar $number $_end
    sleep 0.1
done
echo 
