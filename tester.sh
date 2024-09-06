#!/bin/bash
FILE=names.txt

test1=("kim" "mid" "A1")
test2=("san" "mid" "a2")
test3=("ken" "night" "A1")
test4=("ad" "morning" "A1")
test5=("gab" "d@y" "B4")



# Path to the file with names
names_file="names.txt"

# Declare an empty array
names_array=()

# Read the file line by line and store each line into the array
while IFS= read -r line; do
    names_array+=("$line")
done < "$names_file"

# Function to generate a random index
generate_random_index() {
    echo $((RANDOM % ${#names_array[@]}))
}

# Generate and print random names from the array
echo "Generated random names:"
for i in {1..5}; do
    random_index=$(generate_random_index)
    echo "${names_array[$random_index]}"
done




