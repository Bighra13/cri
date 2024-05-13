#!/bin/bash

# The name of the text file you want to create
filename="my_text_file.txt"

# The text you want to write into the file
text="Hello, this is some sample text."

# Create a new text file with the specified name and write the text into it
echo "$text" > "$filename"
