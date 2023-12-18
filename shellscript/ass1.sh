# Define the file name
filename="t1.txt"
#cp "t.txt" "t1.txt"
nroll=""
grade=""
dept=""
name=""
f="0"
proll=""

# Create a temporary file
temp_file=$(mktemp)
echo "$PATH"

while true; do
echo "School Database Menu:"
echo "1. Show All Records"
echo "2. Add New Record"
echo "3. Delete Record"
echo "4. Update Record"
echo "5. Exit"


    read -p "Enter your choice:" choice
    proll=""
    case $choice in
        1)
            cat "$filename"
            continue
            ;;
        2)
            read -p "Enter roll:" nroll
            f="0"
            ;;
        3)
            read -p "Enter roll:" nroll
            ;;
        4)
            read -p "Enter roll:" nroll
            ;;
        5)
            exit
            ;;
        *)
            echo "Invalid input"
            continue
            ;;
    esac

    f="0"
    if ! [[ "$nroll" =~ ^[0-9]+$ ]]; then
    echo "Enter an integer"
    continue
    fi

    if [[ $choice -eq 2 || $choice -eq 4 ]]; then
        read -p "Enter name:" name
        read -p "Enter dept:" dept
        read -p "Enter grade:" grade
    fi

    # Read and process each line
    while t= read -r line; do
        # Extract the portion from the line
        proll="$roll"
        #roll=$(echo "$line" | cut -d '|' -f2)

        echo "$line" | cut -d '|' -f2 >tttt.txt
        cat tttt.txt > "$roll"
        
echo "$roll"
        #echo $line

        if [[ $choice -eq 2 && $roll -gt $nroll && $f -eq 0 ]];
        then
echo $line
    if [[ $nroll -eq $proll ]];
then

echo "Roll number already there"
else
echo "|$nroll|$name|$dept|$grade|" >> "$temp_file"
fi
            echo "$line" >> "$temp_file"
            f="1"
        elif [[ $choice -eq 3 && $roll -eq $nroll && $f -eq 0 ]];
        then
            echo "Deleted $line"
            f="1"
        elif [[ $choice -eq 4 && $roll -eq $nroll && $f -eq 0 ]]; then
            echo "|$nroll|$name|$dept|$grade|" >> "$temp_file"
            f="1"
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$filename"

    if [[ $choice -eq 2 && $f -eq 0 ]]; then
        echo "|$nroll|$name|$dept|$grade|" >> "$temp_file"
    fi
    if [[ $choice -eq 3 && $f -eq 0 ]]; then
        echo "Record not found for deletion"
    fi
    if [[ $choice -eq 4 && $f -eq 0 ]]; then
        echo "Record not found for update"
    fi

    # Replace the original file with the temporary file
    mv "$temp_file" "$filename"

    echo "File modified."
done