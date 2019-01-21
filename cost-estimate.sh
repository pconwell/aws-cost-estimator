#!/bin/bash

iocost=$((3 * ((`cat /proc/diskstats | grep -v xvda1 | awk -F" " '{print $4}'` + `cat /proc/diskstats | grep -v xvda1 | awk -F" " '{print $8}'`)/`uptime | awk -F" " '{print $3}'`)/10000))

esbcost=$((`df -m | grep xvda1 | awk -F" " '{print $2}'`/100))

type=`curl -s http://169.254.169.254/latest/meta-data/instance-type`

case $type in
        t2.nano)
                typecost=158
                ;;
        t2.micro)
                typecost=319
                ;;
        t2.small)
                typecost=636
                ;;
        t2.medium)
                typecost=1272
                ;;
esac

echo ''
echo 'Instance type: ' $type
echo ''

echo $iocost 'cents/mo for i/o (est)'
echo $esbcost 'cents/mo for EBS (est)'

echo $(($iocost + $esbcost + $typecost)) 'cents/mo total'
echo ''
