if [ $# -eq 0 ]; then
  loadavg="`cat /proc/loadavg | awk '{print $1, $2, $3}'`";
  #echo "[load ${loadavg}]   `date +'%R'`";
  echo "${loadavg}";
else
  echo "<fc=#FF9999>$1</fc>";
fi
