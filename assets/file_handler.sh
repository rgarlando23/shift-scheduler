#!/bin/bash

data_file="data/schedule.csv"

count_shifts_per_team() {
    local team=$1
    local morning_count mid_count night_count
    morning_count=$(awk -F, -v team="$team" '$1 == team && $3 == " morning"' $data_file | wc -l)
    mid_count=$(awk -F, -v team="$team" '$1 == team && $3 == " mid"' $data_file | wc -l)
    night_count=$(awk -F, -v team="$team" '$1 == team && $3 == " night"' $data_file | wc -l)

    echo "$team: $morning_count, $mid_count, $night_count"
}

output_shift_schedule() {
    local team=$1
    local shift shift_time
    echo "$team:"
    for shift in morning mid night; do
        case $shift in
            morning) shift_time="6am - 3pm";;
            mid) shift_time="2pm - 11pm";;
            night) shift_time="10pm - 7am";;
        esac
        # Name, Shift, Scheduke
        awk -F, -v team="$team" -v shift="$shift" -v time="$shift_time" '$1 == team && $3 == " "shift { print $2 ", " shift ", " time }' $data_file
    done
    echo ""
}

check_all_teams() {
    echo "format: morning, mid, night"
    for team in A1 A2 B1 B2 B3; do
        count_shifts_per_team "$team"
    done
}

output_schedule() {
    echo "Shift Schedule"
    for team in A1 A2 B1 B2 B3; do
        output_shift_schedule "$team"
    done
}