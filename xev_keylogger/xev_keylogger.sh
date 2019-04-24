xevfile=xev.out
xev_pid=$(pgrep -x xev)
rm -f $xevfile
xev > $xevfile &
xev_kill(){
    pkill  xev
    rm -f $xevfile
}
echo $xev_pid
#tail -f $xevfile | awk '/state/ {print "KEYCODE: " $4 "\n" "KEYSYM: " $6 "\n" "NAME: "$7 "\n────────────────────────"}'
#tail -f $xevfile -n 1 | awk '/state/ {printf "%-10s %-10s %s \n%-10s %-10s %s\n\n"\
#    ,"KEYCODE","KEYSYM","NAME",$4,$6,$7}'
tail -f $xevfile -n 1 | awk '/state/ {print $7}' 
xev_kill


