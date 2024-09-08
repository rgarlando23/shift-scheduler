#!/bin/bash
source assets/color.sh

data_file="data/schedule.csv"

# Function to ask if the user wants to continue
continueFunc() {
    gotoxy 28 26
    echo -e 'Do you Want to Continue? [yes/no]: ' ${NC}
    gotoxy 63 26
    read -r choice
    gotoxy 28 26
    echo "                                        " # Clear the input prompt line
    if [[ "$(echo "$choice" | tr '[:upper:]' '[:lower:]')" != "yes" && "$(echo "$choice" | tr '[:upper:]' '[:lower:]')" != "y" ]]; then
        clear
        exit 1
    fi

}

# Disable input buffering
disable_input() {
    stty -icanon
}

# Enable input buffering
enable_input() {
    stty icanon
}

# Error handling for Shift input
errorShift() {
    local shiftAnswer=$1
    while ! [[ "$shiftAnswer" =~ ^(morning|mid|night)$ ]]; do
        gotoxy 27 26
        echo -e "${BRed}Shift not found."
        disable_input
        sleep 1
        gotoxy 27 26
        enable_input
        echo "                                       " # Clear error message
        gotoxy 27 26
        continueFunc
        gotoxy 37 18
        echo "                                       " # Clear previous input
        gotoxy 37 18
        read -r UserShift
        shiftAnswer="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')" # Convert to lowercase
    done
}

# Error handling for Team input
errorTeam() {
    local teamAnswer=$1
    while ! [[ "$teamAnswer" =~ ^(A1|A2|B1|B2|B3)$ ]]; do
        gotoxy 27 26
        echo -e "${BRed}Team not found."
        disable_input
        sleep 1
        gotoxy 27 26
        echo "                       " # Clear error message
        enable_input
        gotoxy 27 26
        continueFunc
        gotoxy 36 19
        echo "                       " # Clear previous input
        gotoxy 36 19
        read -r UserTeam
        teamAnswer="$(echo "$UserTeam" | tr '[:lower:]' '[:upper:]')" # Convert to uppercase
    done
}