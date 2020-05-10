#!/bin/sh

load="$(cut -d ' ' -f1 /proc/loadavg)"
cpus="$(nproc)"
#cpus=0

echo "$load" | sed 's/\./,/g'
echo "$load" | sed 's/\./,/g'

# color if load is too high
awk -v cpus=$cpus -v cpuload=$load '
    BEGIN {
        if (cpus <= cpuload) {
            print "#FF4444";
            exit 0;
        }
    }
'
# exit 33; om urgent te maken (wit op rode achtergrond)
