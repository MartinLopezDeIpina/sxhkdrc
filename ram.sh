ram=$(free -m | awk 'NR==2{printf "%.2f%%\n", $3*100/$2}' | sed 's/[[:space:]]//g')
echo " $ram"
