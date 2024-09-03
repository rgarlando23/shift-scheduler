#!/bin/bash

source assets/border.sh
source assets/file_handler.sh
source assets/checker.sh

input() {
    local UserName UserShift UserTeam UserSched
    while true; do
        clear
        border
        # Check availability of slots
        slot_checker
        availability_status=$?
        if [[ $availability_status -eq 1 ]]; then
            gotoxy 1 33
            output_schedule
            exit 0
        else
            # Prompt user input
            gotoxy 36 17
            read -r UserName
            if [ "$(echo "$UserName" | tr '[:upper:]' '[:lower:]')" = "print" ]; then
                gotoxy 1 33
                output_schedule
                exit 0
            else
                gotoxy 37 18
                read -r UserShift
                UserShift="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')"

                while ! [[ "$UserShift" =~ ^(morning|mid|night)$ ]]; do
                    gotoxy 37 18
                    echo "Shift not found. Please enter again."
                    sleep 3
                    gotoxy 37 18
                    echo "                                       "
                    gotoxy 37 18
                    read -r UserShift
                    UserShift="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')"
                done

                # Schedule based on shift
                case "$UserShift" in
                    "morning")
                        UserSched="6am - 3pm"
                        ;;
                    "mid")
                        UserSched="2pm - 11pm"
                        ;;
                    "night")
                        UserSched="10pm - 7am"
                        ;;
                esac

                # Prompt user for team
                gotoxy 36 19
                read -r UserTeam
                # Convert to uppercase
                UserTeam="$(echo "$UserTeam" | tr '[:lower:]' '[:upper:]')"

                # Validate team input
                while ! [[ "$UserTeam" =~ ^(A1|A2|B1|B2|B3)$ ]]; do
                    gotoxy 36 19
                    echo "Team not found. Please enter again."
                    sleep 3
                    gotoxy 36 19
                    echo "                                        "
                    gotoxy 36 19
                    read -r UserTeam
                    UserTeam="$(echo "$UserTeam" | tr '[:lower:]' '[:upper:]')"
                done
                # Check if shift is available for the team
                shift_checker "$UserTeam" "$UserShift"
                if [[ $? -eq 0 ]]; then
                    # Append valid entry to CSV file
                    echo "$UserTeam, $UserName, $UserShift, $UserSched" >> data/schedule.csv
                else
                    gotoxy 1 33
                    echo "$UserShift shift for team $UserTeam already full."
                    exit 1
                fi
            fi
        fi
    done
}