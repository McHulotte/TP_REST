#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Mauvais nombre d'arguments\n";
	exit 1;
fi

case $1 in
	0) 
	mosquitto_sub -h 10.202.0.107 -t 'shellies/shellyplug-s-6A6534/relay/0';
	mosquitto_sub -h 10.202.0.107 -t 'shellies/shellyplug-s-6A6534/relay/0';
	echo "\n"
	;;
	1) 
	mosquitto_sub -h 10.202.0.107 -t 'shellies/shellyplug-s-6A6534/relay/0';
	echo "\n"
	;;
	2) 
	mosquitto_sub -h 10.202.0.107 -t 'shellies/shellyplug-s-6A6534/relay/0';
	echo "\n"
	;;
	*) echo "Choisir en Argument la lampe 1 ou la lampe 2 ou les deux (0) !\n";
	exit 1
	;;
esac


