#!/bin/bash
#TODO: creat the draw_chart function
#--- LIBRARIES -----------------------------------------------------
. ~/bin/color.lib
#the file we want to analyse
_file=${1}
#the letters that define the end of the line "$"
useless_letters=$(cat $_file | wc -l )
#the number of all the letters in the file - useless letters
file_char_numb=$(echo $(cat $_file | wc -c ) - $useless_letters | bc)
#--- FUNCTIONS -----------------------------------------------------
info() {
    echo -e "${yellow}ANALYZING FILE:${reset}$_file"
    echo -e "${yellow}THIS FILE CONTAIN:${reset}$file_char_numb"
}

draw_chart() {
    letter=${1}
    char_repitition=$(cat $_file | grep -oi $letter | wc -l)
    char_frequency=$(echo "scale=4;$char_repitition/$file_char_numb*100" | bc -l)

    _fill=$(printf "%${char_frequency}s")
    _empty=$(echo "50 - ${char_frequency}" | bc )
    _left=$(printf "%${_empty}s")
    _pers=$char_frequency
    printf "${blue}LETTER ${reset}${red}$letter${reset}:${green}│${_fill// /\█}${_left}│${reset}${red}$_pers %%${reset}"
    echo

}
full_analyse() {
    for _letter in {a..z}
    do
	draw_chart $_letter
    done
}
info
full_analyse
