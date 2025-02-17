cpu=$(top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}')
echo " $cpu"
