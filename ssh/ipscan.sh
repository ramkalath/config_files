#!/bin/bash
function scan ()
{
    for ip in $1.{1..254}; do
        ping -c 1 -W 1 $ip &
    done | sed -nE 's:^.* from ([0-9.]+).*time=(.*s)$:\1 (\2):p'
}

if [ $1 ]; then
    for baseip; do
        scan $baseip
    done
else
    scan 10.0.0
fi
