#!/bin/sh

mosquitto_pub -h 10.202.0.107 -t 'shellies/shellyplug-s-6A6534/relay/0/command' -m 'off';
echo "\n"
