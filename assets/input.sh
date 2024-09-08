#!/bin/bash
source assets/error_test.sh
source assets/border.sh
source assets/file_handler.sh
source assets/checker.sh
source assets/color.sh

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
                
                errorShift $UserShift
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
                errorTeam $UserTeam
                # Check if shift is available for the team
                shift_checker "$UserTeam" "$UserShift"
                if [[ $? -eq 0 ]]; then
                    # Append valid entry to CSV file
                    echo "$UserTeam, $UserName, $UserShift, $UserSched" >> data/schedule.csv
                else
                    gotoxy 28 26
                    echo -e "${BRed}$UserShift shift for team $UserTeam already full.${NC}"
                    gotoxy 1 35
                    exit 1
                fi
            fi
        fi
    done
}