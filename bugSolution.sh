#!/bin/bash

# This script demonstrates the corrected way to process files,
# handling filenames with special characters correctly.

input_dir="/tmp/testdir"

# Create a test directory and files (same as before)
mkdir -p "$input_dir"
touch "$input_dir/file1.txt"
touch "$input_dir/file?.txt"
touch "$input_dir/file*.txt"

# The corrected part: using find to handle filenames safely
find "$input_dir" -maxdepth 1 -name "file*.txt" -print0 | while IFS= read -r -d $'\0' file; do
  echo "Processing: $file"
  # Some processing operation here (e.g., cat)
  cat "$file" || echo "Error processing $file"
done

#Alternatively, using an array to avoid word splitting
files=("$(find "$input_dir" -maxdepth 1 -name "file*.txt" -print0 | xargs -0)")
for file in "${files[@]}"; do
  echo "Processing: $file"
  # Some processing operation here (e.g., cat)
  cat "$file" || echo "Error processing $file"
done