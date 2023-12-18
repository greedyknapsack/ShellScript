#!/bin/bash

database_file="student_database.txt"
temp_file="temp.txt"

display_menu() {
    echo "Student Database Management"
    echo "1. Insert Record"
    echo "2. Update Record"
    echo "3. Delete Record"
    echo "4. Exit"
}

insert_record() {
    echo "Enter Roll Number:"
    read roll
    echo "Enter Name:"
    read name
    echo "Enter Department:"
    read dept
    echo "Enter Grade:"
    read grade
    
    echo "|$roll|$name|$dept|$grade|" >> "$database_file"
    echo "Record inserted."
}

update_record() {
    echo "Enter Roll Number to update:"
    read roll

    if grep -q "|$roll|" "$database_file"; then
        echo "Enter new Department:"
        read new_dept
        echo "Enter new Grade:"
        read new_grade

        grep -v "|$roll|" "$database_file" > "$temp_file"
        echo "|$roll|$(grep "|$roll|" "$database_file" | cut -d '|' -f 3 -)"|"$(grep "|$roll|" "$database_file" | cut -d '|' -f 4 -)|" >> "$temp_file"
        
        mv "$temp_file" "$database_file"
        echo "Record updated."
    else
        echo "Record not found."
    fi
}

delete_record() {
    echo "Enter Roll Number to delete:"
    read roll

    if grep -q "|$roll|" "$database_file"; then
        grep -v "|$roll|" "$database_file" > "$temp_file"
        mv "$temp_file" "$database_file"
        echo "Record deleted."
    else
        echo "Record not found."
    fi
}

while true; do
    display_menu
    read -p "Enter your choice: " choice
    
    case $choice in
        1) insert_record ;;
        2) update_record ;;
        3) delete_record ;;
        4) echo "Exiting."; exit ;;
        *) echo "Invalid choice. Please select a valid option." ;;
    esac
done
