#!/bin/bash

STREAM_URL="http://starshare.live:8080/PTVSports/SportsPTV/61674"
M3U8_FILE="ptv.m3u8.tmp"
TS_FILE="ptv.m3u8"

# Trap Ctrl+C to gracefully exit the loop
trap 'echo "Exiting..."; exit' INT

# Infinite loop for continuous execution
while true; do
    rm -f "$TS_FILE"
    if ffmpeg -i "$STREAM_URL" -c copy -f hls -hls_time 30 -hls_list_size 2 -hls_flags delete_segments "$M3U8_FILE"; then
        mv "$M3U8_FILE" "$TS_FILE"
    else
        echo "Error: Stream ended prematurely or encountered an issue. Retrying in 5 seconds..."
    fi
    sleep 5
done
