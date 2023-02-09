#!/bin/bash

if [ -f /var/log/$logName ] && grep -sqm1 "$checkWord" "/var/log/$logName" 
then
 logger "Word \"$checkWord\" find in Log \"$logName\""
fi
