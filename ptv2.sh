#!/bin/bash

STREAM_URL="http://starshare.live:8080/PTVSports/SportsPTV/61674"
M3U8_FILE="ptv.m3u8"
TS_FILE="ptv0.ts"

# Trap Ctrl+C to gracefully exit the loop
trap 'echo "Exiting..."; exit' INT

# Function to commit and push changes
commit_and_push() {
    while true; do
        git config --local user.email "bilal.hassan7071@gmail.com"
        git config --local user.name "Bighra13"
        git add "$M3U8_FILE" "$TS_FILE"
        git commit -m "Update live channel files"
        git push
        sleep 30
    done
}

# Start the commit and push process in the background
commit_and_push &

# Infinite loop for continuous execution
while true; do
    rm -f "$TS_FILE"
    ffmpeg -i "$STREAM_URL" -c copy -f hls -hls_time 30 -hls_list_size 2 -hls_flags delete_segments "$M3U8_FILE"
    
    # Check if the .m3u8 file exists before trying to move it
    if [ -f "$M3U8_FILE.tmp" ]; then
        mv "$M3U8_FILE.tmp" "$M3U8_FILE"
    fi
    
    sleep 30
done
