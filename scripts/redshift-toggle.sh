#!/bin/bash

if pgrep -x "redshift" >/dev/null
then
    killall -q redshift
else
    setsid redshift -l ${1} & > /dev/null
fi
