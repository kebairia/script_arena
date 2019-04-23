#!/bin/bash
# Read the url from the user
# the url must be of page that contain the indexex of the anime/movies/whatever you want to download 
# ##########
#   COLORS
# ##########
bold=$(tput bold )
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
grey=$(tput setaf 7)
reset=$(tput sgr0 )
#
# This function is to check if the following creteria are fullfilled.
filestamp=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)
read -p "${bold}${yellow}URL: ${reset}" url
read -p "${bold}${green}FILENAME: ${reset}" filename
# save the filestamp in the database :)
echo "$filename,$filestamp,$(date +%Y%m%d%H%M%S),$url" >> ~/tmp/down.base

# clean up the links 
curl -L "$url" | grep "^<a href" | sed 's/<a\ href="//;s/">.*//' > .file.tmp
while read line 
do
    echo "${url}$line" >> $filename
done < .file.tmp

# remove the tempfile   
rm .file.tmp

#####################################################
# YOUTUBE-DL
download(){
while read line
do
    youtube-dl -ic $line
done < $filename
}
infinite_loop_download(){
    while true
    do
        while read line
        do
            youtube-dl -ic $line
        done < $filename
    done
}
#####################################################
# CRONJOB
#####################################################
# NOTIFICATIOON
#####################################################
#CHECK_IF_DOWNLOAD_EXIST
#####################################################
case $1 in
    -i | --infinite ) infinite_loop_download ;;
    *) download;;
esac
