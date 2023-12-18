#!/bin/bash

database_file="student_database.txt"
temp_file="temp.txt"

while true; do
    echo "Student Database Management"
    echo "1. Insert Record"
    echo "2. Update Record"
    echo "3. Delete Record"
    echo "4. Exit"
    read -p "Enter your choice: " choice
    
    case $choice in
        1)
            echo "Enter Roll Number:"
            read roll
            echo "Enter Name:"
            read name
            echo "Enter Department:"
            read dept
            echo "Enter CGPA:"
            read cgpa
            echo "|$roll|$name|$dept|$cgpa|" >> "$database_file"
            echo "Record inserted."
            ;;
        2)
            echo "Enter Roll Number to update:"
            read roll
            if grep -q "|$roll|" "$database_file"; then
                echo "Enter new Department:"
                read new_dept
                echo "Enter new CGPA:"
                read new_cgpa
                grep -v "|$roll|" "$database_file" > "$temp_file"
                echo "|$roll|$(grep "|$roll|" "$database_file" | cut -d '|' -f 3 -)|$new_dept|$new_cgpa|" >> "$temp_file"
                mv "$temp_file" "$database_file"
                echo "Record updated."
            else
                echo "Record not found."
            fi
            ;;
        3)
            echo "Enter Roll Number to delete:"
            read roll
            if grep -q "|$roll|" "$database_file"; then
                grep -v "|$roll|" "$database_file" > "$temp_file"
                mv "$temp_file" "$database_file"
                echo "Record deleted."
            else
                echo "Record not found."
            fi
            ;;
        4)
            echo "Exiting."
            exit
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done
