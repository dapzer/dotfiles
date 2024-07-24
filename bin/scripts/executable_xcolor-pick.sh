#!/usr/bin/env bash

# Check if the required utilities are installed
if ! command -v xcolor &> /dev/null
then
    echo "xcolor is not installed. Please install it and try again."
    exit 1
fi

if ! command -v xclip &> /dev/null
then
    echo "xclip is not installed. Please install it and try again."
    exit 1
fi

# Run xcolor to pick a color and store the value in a variable
color=$(xcolor --format hex)

# Check if the color selection was successful
if [ -z "$color" ]; then
    echo "Color selection was canceled."
    exit 1
fi

# Copy the color value to the clipboard
echo -n "$color" | xclip -selection clipboard

echo "Color $color has been copied to the clipboard."
