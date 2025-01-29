#!/bin/bash

# This script attempts to process files in a directory,
# but it has a subtle bug related to globbing and special characters.

input_dir="/tmp/testdir"

# Create a test directory and files
mkdir -p "$input_dir"
touch "$input_dir/file1.txt"
touch "$input_dir/file?.txt"
touch "$input_dir/file*.txt"

# The buggy part: processing files with wildcard characters in their names
for file in "$input_dir/file*.txt"; do
  echo "Processing: $file"
  # Some processing operation here (e.g., cat)
  cat "$file" || echo "Error processing $file"
done