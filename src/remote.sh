#!/bin/sh

SAVE_TAG_PATH="$HOME/.tag_for_remote";


PRE=$1;
ARGV="${@:2}";
REMOTE_URL="$(grep $PRE $SAVE_TAG_PATH | awk '{print $2}' |xargs )" ;



if [[ -z $REMOTE_URL ]] 
then
    ARGV="$@";
    $ARGV;
    exit;
fi
echo "$(ssh $REMOTE_URL $ARGV)";






