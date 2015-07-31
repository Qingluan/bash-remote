#!/bin/sh

SAVE_TAG_PATH="$HOME/.tag_for_remote";


PRE=$1;
ARGV="${@:2}";
REMOTE_URL="$(grep $PRE $SAVE_TAG_PATH | awk '{print $2}' |xargs )" ;


if [ $# < 4 ] ;
then
	$@;
	exit;
else

	
	if [[ -z $REMOTE_URL ]]
	then
		ARGV="$@";
		$ARGV;
		exit;
	fi


	if [[ ${ARGV:0:1} == "vi" ]] ;
	then
		PATH=${ARGV:1:2};
		scp "$REMOTE_URL:$PATH"  "./temp-$PATH" && vi  "./temp-$PATH" ;
		scp "./temp-$PATH"  "$REMOTE_URL:$PATH";
	fi
fi

