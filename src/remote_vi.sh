#!/bin/bash

SAVE_TAG_T_PATH="$HOME/.tag_for_remote";


PRE=$1;
ARGV="${@:2}";
REMOTE_URL="$(grep $PRE $SAVE_TAG_T_PATH | awk '{print $2}' |xargs )" ;

echo "Command : $ARGV";

if [[ $# < 3 ]] ;
then
    $@;
    exit;
else

    
    if [[ -z $REMOTE_URL ]]
    then
	ARGV="$@";
	echo "no remote url";
	$ARGV;
	exit;
    fi


    if [[ ${ARGV:0:2} == "vi" ]] ;
    then
	T_PATH=${ARGV:2};
	scp  $REMOTE_URL:${T_PATH:1} ./temp-${T_PATH:4} && sleep 1 &&  vim  ./temp-${T_PATH:3} ;
	scp ./temp-${T_PATH:3} $REMOTE_URL:${T_PATH:1}  && rm ./temp-${T_PATH:3} ;
    
    else
	ssh  $REMOTE_URL $ARGV;
    fi
fi

