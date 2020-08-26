#!/bin/sh

CACHE_DIR="$HOME/cache"
CACHE_FILE="$CACHE_DIR/dmenu_wifi"
(find $CACHE_FILE > /dev/null 2>&1 )
SKIP_CACHE=$?

echo SKIP_CACHE $SKIP_CACHE

[ ! -d $CACHE_DIR ] && mkdir -p $CACHE_DIR

INTERFACE=`ifconfig | grep "^[a-zA-Z]" | cut -d":" -f 1 | dmenu -l 10 -p "Choose you network interface"`

echo $INTERFACE

if [ $SKIP_CACHE -ne "1" ]
then
	# echo test
	TMP=`find $CACHE_FILE -mmin -1 -type f -print` 
	[ -z $TMP ] && ifconfig $INTERFACE scan > $CACHE_FILE
	
else
	ifconfig $INTERFACE scan > $CACHE_FILE
fi

WIFI=`cat $CACHE_FILE | tr -d '\t\r' | dmenu -l 10 -p "Choose which wifi to connect to"`

echo $WIFI

