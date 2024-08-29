#!/bin/bash

data_file="data/schedule.csv"

# Function to check the maximum number of shifts per team
check_max_shifts() {
    local team=$1
    if (( $2 == "morning" ))
    then
        shift_count=$(awk -F, -v team="$team" '$1 == team && $3 == " morning"' $data_file | wc -l)
    elif (( $2 == "mid" ))
    then 
        shift_count=$(awk -F, -v team="$team" '$1 == team && $3 == " mid"' $data_file | wc -l)
    elif (( $2 == "night" ))
    then
        shift_count=$(awk -F, -v team="$team" '$1 == team && $3 == " night"' $data_file | wc -l)
    fi

    if [[ $shift_count -ge 2 ]]; then
        return 1  # Exceeds the maximum allowed
    else
        return 0  # Within the limit
    fi
}