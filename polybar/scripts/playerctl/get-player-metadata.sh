#!/usr/bin/bash

POLYBAR_PARENT=$1
PLAY_PAUSE_IPC_MODULE=$2
LOG_FILE=$3

SEND_PLAY_BTN=0
SEND_PAUSE_BTN=1
PLAYER_FORMAT="{{artist}} - {{title}}"

POLYBAR_PARENT_PID=$(pgrep -xf "polybar $POLYBAR_PARENT")
if [[ $? -ne 0 ]];then
    POLYBAR_PARENT_PID=$(pgrep -x "polybar")
    if [[ $? -ne 0 ]]; then
	echo "[$(date)] get-player-metadata.sh: Polybar \"$POLYBAR_PARENT\" instance not found." | tee -ap $LOG_FILE 1>/dev/null 2>&1
	exit 1
    fi
fi
parent_msg="polybar-msg -p $POLYBAR_PARENT_PID"

OUTPUT=$(playerctl metadata --format "$PLAYER_FORMAT" 2>/dev/null)
OUTPUT_EXIT_CODE=$?
status=$(playerctl status 2>/dev/null)
EXIT_CODE=0
if [[ $OUTPUT_EXIT_CODE -ne 0 || $status != "Playing" ]];then
    if [[ $status == "Stopped" ]];then
	OUTPUT="No Media Playing"
	EXIT_CODE=1
    fi
    hook_data=$SEND_PLAY_BTN
else
    hook_data=$SEND_PAUSE_BTN
fi

$parent_msg action $PLAY_PAUSE_IPC_MODULE hook $hook_data 1>/dev/null 2>&1
echo "$OUTPUT"
exit $EXIT_CODE
