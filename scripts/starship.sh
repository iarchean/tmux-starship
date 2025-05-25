#!/usr/bin/env bash

# Get arguments (if any)
module="$1"

# Check if starship is installed
if ! command -v starship >/dev/null 2>&1; then
    echo "starship not found"
    exit 1
fi

# Use different commands based on whether a module is specified
if [ -n "$module" ]; then
    # Get output for specific module
    output=$(starship module "$module")
else
    # Get full prompt
    output=$(starship prompt)
fi

# Remove ANSI escape sequences
# This regex matches all ANSI escape sequences, including color codes
cleaned_output=$(echo "$output" | sed -E 's/\x1B\[([0-9]{1,3}(;[0-9]{1,3})*)?[mGK]//g')

# Output cleaned result
echo "$cleaned_output" 