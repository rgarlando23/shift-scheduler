#!/bin/bash

data_file="data/schedule.csv"

# Function to check the maximum number of shifts per team
check_max_shifts() {
    local team=$1
    local shift=$2
    local shift_count=0

    # Use a string comparison for the shift variable
    case "$shift" in
        "morning")
            shift_count=$(awk -F, -v team="$team" '$1 == team && $3 == " morning"' "$data_file" | wc -l)
            ;;
        "mid")
            shift_count=$(awk -F, -v team="$team" '$1 == team && $3 == " mid"' "$data_file" | wc -l)
            ;;
        "night")
            shift_count=$(awk -F, -v team="$team" '$1 == team && $3 == " night"' "$data_file" | wc -l)
            ;;
    esac

    if [[ $shift_count -ge 2 ]]; then
        return 1  # Exceeds the maximum allowed
    else
        return 0  # Within the limit
    fi
}

# Function to check if the total number of shifts for each team is exactly 6
check_availability() {
    local team total_shifts

    for team in A1 A2 B1 B2 B3; do
        total_shifts=$(awk -F, -v team="$team" '$1 == team { count++ } END { print count }' "$data_file")

        if [[ "$total_shifts" -ne 6 ]]; then
            echo "Team $team does not have exactly 6 shifts assigned. Current count: $total_shifts"
        else
            echo "Team $team has exactly 6 shifts assigned."
        fi
    done
}