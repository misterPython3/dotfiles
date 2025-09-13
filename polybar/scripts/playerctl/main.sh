#!/usr/bin/bash

SCRIPT_DIR=$(dirname $0)

PARENT_BAR_MODULE=$1
PLAY_PAUSE_IPC_MODULE=$2
LOG_FILE=$(realpath $SCRIPT_DIR/playerctl-script.log)
LENGTH=24
DELAY=.3

for (( i=0,output_length=1;1;i=(i+increment)%output_length ));do
    increment=0
    status=$(playerctl status 2>/dev/null)
    if [[ $? -eq 0 ]];then
	output=$($SCRIPT_DIR/get-player-metadata.sh $PARENT_BAR_MODULE $PLAY_PAUSE_IPC_MODULE $LOG_FILE)
	output_length=${#output}
	if [[ $? -eq 0 && $output_length -gt $LENGTH ]];then
	    shifted_output="${output:$i} ${output::$i}"
	    output=${shifted_output::$LENGTH}
	elif [[ $output_length -le 0 ]];then
	    output_length=1
	fi
	case $status in
	    Playing)
		increment=1
		;;
	    Stopped)
		i=0
		;;
	esac
    else
	output="No Media Playing"
	i=0
	output_length=1
    fi
    echo "$output"
    sleep $DELAY
done & wait
