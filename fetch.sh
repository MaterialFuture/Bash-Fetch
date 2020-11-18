#!/bin/sh
#My fetch script

MACHINE=$(uname -m)
KERNAL=$(uname -r)
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)

CPU=$(awk -F: '/^model name/ { mod=$2 } END { printf "%s",mod}' /proc/cpuinfo)
MEM=$(grep -oP '(?<=MemTotal:        ).*(?= kB)' /proc/meminfo)
FMEM=$(grep -oP '(?<=MemFree:        ).*(?= kB)' /proc/meminfo)

case $OSTYPE in
    linux*)
        printf "CPU:\t$CPU \n" ;
        printf "Mem:\t $MEM \n" ;
        printf "Arch:\t $MACHINE \n" ;
        printf "Kernal:\t Linux $KERNAL \n" ;
        printf "Date:\t $DATE \n" ;
        printf "Time:\t $TIME \n" ;;
  solaris* | darwin* | bsd* | *) echo "nope" ;;
esac
