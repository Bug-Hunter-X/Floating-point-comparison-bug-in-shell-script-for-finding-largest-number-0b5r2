#!/bin/bash

# This script attempts to find the largest number in a file,
# but contains a subtle bug related to how floating-point numbers are handled.

# Input file containing numbers (one per line):
input_file="numbers.txt"

# Initialize the largest number to a very small value
largest=-9999999999.9999

# Read the file line by line
while IFS= read -r num;
do
  # Check if the current number is greater than the largest number so far
  if (( $(echo "$num > $largest" | bc -l) )); then
    largest=$num
  fi
 done < "$input_file"

# Print the largest number
echo "Largest number: $largest"