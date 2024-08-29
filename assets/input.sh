#!/bin/bash

source assets/border.sh

input() {
    local UserName
    local UserShift
    local UserTeam
    local UserSched

    while true; do
        clear
        border
        gotoxy 36 17
        # Prompt user for name input
        read -r UserName
        # Case insensitive check for "print"
        if [ "$(echo "$UserName" | tr '[:upper:]' '[:lower:]')" = "print" ]; then
            clear
            exit 0
        else
            gotoxy 37 18
            # Prompt user for shift
            read -r UserShift
            # Convert to lowercase
            UserShift="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')"
            # Validate shift
            while [[ "$UserShift" != "morning" && "$UserShift" != "mid" && "$UserShift" != "night" ]]
            do
                gotoxy 37 18
                echo "Shift not found. Please enter again."
                sleep 3
                gotoxy 37 18
                echo "                                       "  # Clear the line
                gotoxy 37 18
                read -r UserShift
                UserShift="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')"
            done
            # Set schedule based on shift
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

            gotoxy 36 19
            # Prompt user for team
            read -r UserTeam
            # Convert to uppercase
            UserTeam="$(echo "$UserTeam" | tr '[:lower:]' '[:upper:]')"
            # Validate Team
            while [[ "$UserTeam" != "A1" && "$UserTeam" != "A2" && "$UserTeam" != "B1" && "$UserTeam" != "B2" && "$UserTeam" != "B3" ]]
            do
                gotoxy 36 19
                echo "Team not found. Please enter again."
                sleep 3
                gotoxy 36 19
                echo "                                        "  # Clear the line
                gotoxy 36 19
                read -r UserTeam
                UserTeam="$(echo "$UserTeam" | tr '[:lower:]' '[:upper:]')"
            done
                
            echo "$UserTeam, $UserName, $UserShift, $UserSched" >> data/schedule.csv
        fi
    done
}
input
