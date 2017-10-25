#!/bin/bash

INTERFACE="${BLOCK_INSTANCE:-wlp4s0}"
 
ssid="$(iwconfig $INTERFACE | grep ESSID | awk '{print $4}' | tr -d 'ESSID:"')"
 
echo $ssid # full text
echo $ssid # short text
