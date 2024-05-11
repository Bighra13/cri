#!/bin/bash

STREAM_URL = "http://starshare.live:8080/PTVSports/SportsPTV/89"
M3U8_FILE = "live_channel.m3u8"
TS_FILE = "ptv.m3u8"


# Trap Ctrl+C to gracefully exit the loop
trap 'echo "Exiting..."; exit' INT

# Infinite loop for continuous execution
while true; do
rm -f "$TS_FILE"
ffmpeg -i "$STREAM_URL" -c copy -f hls -hls_time 30 -hls_list_size 2 -hls_flags delete_segments "$TS_FILE"
mv "$M3U8_FILE.tmp" "$M3U8_FILE"
    sleep 5
done
