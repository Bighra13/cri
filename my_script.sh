#!/bin/bash

# This is a sample Bash script
# It will be accessed by the GitHub Actions workflow

echo "Hello from my_script.sh!"
echo "The job was triggered by a ${{ github.event_name }} event."
echo "The name of the branch is ${{ github.ref }}."
echo "Your repository is ${{ github.repository }}."
