#!/bin/bash

# Define the file name
filename="t.txt"

# Create a temporary file
temp_file=$(mktemp)

# Read and process each line
while IFS= read -r line; do
    # Extract the portion from the line
    extracted_part=$(echo "$line" | grep -o '|[0-9]*|')
    
    # Modify the line here (if needed)
    modified_line="$line"
    
    # Append the extracted portion to the modified line
    #modified_line="${modified_line}${extracted_part}"
    
    # Write the modified line to the temporary file
    echo "$modified_line" >> "$temp_file"
done < "$filename"

# Replace the original file with the temporary file
mv "$temp_file" "$filename"

echo "File modified."
