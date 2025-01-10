#!/bin/bash

# Improved script to find the largest number in a file,
# handling floating-point numbers correctly.

input_file="numbers.txt"

# Initialize the largest number to a very small value
largest=-9999999999.9999

# Read the file line by line
while IFS= read -r num;
do
    # Convert numbers to a format suitable for comparison. Consider using `awk` for improved precision
    num=$(echo "$num" | awk '{printf "%.20f", $1}') 
    largest=$(echo "$largest" | awk '{printf "%.20f", $1}')
    # Use awk for floating-point comparison
    if awk -v num="$num" -v largest="$largest" 'BEGIN {if (num > largest) print 1; else print 0}' ; then
        largest=$num
    fi
 done < "$input_file"

# Print the largest number
echo "Largest number: $largest"