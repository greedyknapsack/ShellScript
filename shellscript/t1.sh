

database_file="student_database.txt"

while true; do
    clear

    echo "Student Database Management"
    echo "1. Insert Record"
    echo "2. Update Record"
    echo "3. Delete Record"
    echo "4. View All Records"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Insert Record"
            read -p "Enter Roll Number: " roll
            read -p "Enter Name: " name
            read -p "Enter Department: " dept
            read -p "Enter CGPA: " cgpa

            # Validate input
            if [[ ! $roll || ! $name || ! $dept || ! $cgpa ]]; then
                echo "Invalid input. All fields are required."
            else
                if grep -q "^|$roll|" "$database_file";
                then
                echo "Record exists"
                else
                    
                    echo "|$roll|$name|$dept|$cgpa|" >> "$database_file"
                echo "Record inserted."
                fi
               
            fi

            read -p "Press Enter to continue..."
            ;;

        2)
            clear
            echo "Update Record"
            read -p "Enter Roll Number to update: " roll

            if grep -q "^|$roll|" "$database_file"; then
                grep -v "^|$roll|" "$database_file" > "$database_file.tmp"
                mv "$database_file.tmp" "$database_file"

                read -p "Enter new Name: " name
                read -p "Enter new Department: " new_dept
                read -p "Enter new CGPA: " new_cgpa

                echo "|$roll|$name|$new_dept|$new_cgpa|" >> "$database_file"
                echo "Record updated."
            else
                echo "Record not found."
            fi
            ;;

        3)
            clear
            echo "Delete Record"
            read -p "Enter Roll Number to delete: " roll

            if grep -q "^|$roll|" "$database_file"; then
                grep -v "^|$roll|" "$database_file" > "$database_file.tmp"
                mv "$database_file.tmp" "$database_file"
                echo "Record deleted."
            else
                echo "Record not found."
            fi
            ;;

        4)
            clear
            echo "View All Records"
            cat "$database_file"
            ;;

        5)
            echo "Exiting."
            exit
            ;;

        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
    read -p "Press Enter to continue..."
done

