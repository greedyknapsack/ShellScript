#!/bin/bash

# Define the file name
filename="t1.txt"
nroll="13"
grade="12"
dept="dc dc"
name="dv dfv"
f="0"

# Create a temporary file
temp_file=$(mktemp)

    echo "School Database Menu:"
    echo "1. Show All Records"
    echo "2. Add New Record"
    echo "3. Delete Record"
    echo "4. Update Record"
    echo "5. Exit"
while true 
do
    read -p "Enter your choice:" choice
    
    case $choice in
        1) cat $filename
        echo
        continue;;
        2) read -p "Enter roll:" nroll;;
        3) read -p "Enter roll:" nroll;;
        4) read -p "Enter roll:" nroll;;
        5) exit ;;
    esac

    "if [[ $choice == "2" || $choice == "4" ]]; then
        read -p "Enter name:" name 
        read -p "Enter dept:" dept
        read -p "Enter grade:" grade
    fi"



    # Read and process each line
    while IFS= read -r line; do
        # Extract the portion from the line
        roll=$(echo "$line" | grep -o '|[0-9]*|' | cut -d '|' -f2 )
        
        # Modify the line here (if needed)
        modified_line="$line"
        #echo $extracted_part

        if [[ $choice == "2" && $roll -gt $nroll && f=="0" ]]; then
            modified_line="|$nroll|$name|$dept|$grade|$modified_line" 
            echo $modified_line
            f="1"
        elif [[ $choice == "3" && $roll==$nroll ]]; then
            echo "Deleted"
            f="1"
        elif [[ $choice == "4" && $roll == $nroll ]]; then
            echo "|$nroll|$name|$dept|$grade|" >> "$temp_file"
        else
            echo "$roll"
            echo "$line" >> "$temp_file"
        fi
        # Write the modified line to the temporary file
        #echo "$modified_line" >> "$temp_file"
    done < "$filename"

    # Replace the original file with the temporary file
    mv "$temp_file" "$filename"

    echo "File modified."



done