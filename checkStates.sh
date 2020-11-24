#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Mauvais nombre d'arguments\n";
	exit 1;
fi

case $1 in
	0) 
	curl -s http://10.202.255.252/relay/0 | jq .ison;
	curl -s http://10.202.255.253/relay/0 | jq .ison;
	echo "\n"
	;;
	1) 
	curl -s http://10.202.255.252/relay/0 | jq .ison;
	echo "\n"
	;;
	2) 
	curl -s http://10.202.255.253/relay/0 | jq .ison;
	echo "\n"
	;;
	*) echo "Choisir en Argument la lampe 1 ou la lampe 2 ou les deux (0) !\n";
	exit 1
	;;
esac


