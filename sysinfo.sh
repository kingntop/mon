#!/bin/bash
 
target=/tmp/svrinfo.txt
 
HDDINFO=$(df |grep "/data"|awk '{printf "{\"mount_point\": \"%s\", \"total_size\": \"%d\", \"used\": \"%d\", \"free\": \"%d\"},", $5,$1,$2,$3}';df |grep "/dev/sda2"|awk '{printf "{\"mount_point\": \"%s\", \"total_size\": \"%d\", \"used\": \"%d\", \"free\": \"%d\"}", $6,$2,$3,$4}')
rm -f $target
echo "{" >> $target
echo '"ip":"'$(/usr/bin/python ./ipinfo.py)'",' >> $target
echo '"cpu":'$(/usr/bin/python ./cpuinfo.py)',' >> $target
echo '"mem":'$(/usr/bin/python ./meminfo.py)',' >> $target
echo '"hdd":['$HDDINFO']' >> $target
echo '}' >> $target
 
echo $(cat $target)

echo $(/usr/bin/python ./httpreq.py)