#!/bin/bash
source assets/color.sh

data_file="data/schedule.csv"

#function Error Shift (Max Shift 

errorShift()
{
    local shiftAnswer=$1
    while ! [[ "$shiftAnswer" =~ ^(morning|mid|night)$ ]]; do
         
        gotoxy 27 26
        echo -e ${BRed} "Shift not found."
        disable_input
        sleep 1
        gotoxy 27 26
        enable_input
        echo "                                       "
        gotoxy 27 26
        continueFunc 
        gotoxy 37 18
        echo "                                       "
        gotoxy 37 18
        read -r UserShift
        shiftAnswer="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')"
    done

}

errorTeam()
{
   local teamAnswer=$1
   #incorrect Team Input
   while ! [[ "$teamAnswer" =~ ^(A1|A2|B1|B2|B3)$ ]]; do
        gotoxy 27 26
        echo -e ${BRed} "Team not found."
        disable_input
        sleep 1
        gotoxy 27 26
        echo "                       "
        enable_input
        gotoxy 27 26 
        continueFunc
        gotoxy 36 19
        echo "                       "
        gotoxy 36 19 
        read -r UserTeam
        teamAnswer="$(echo "$UserTeam" | tr '[:lower:]' '[:upper:]')"
        
    done 
}

continueFunc(){
    gotoxy 28 26
    echo -e 'Do you Want to Continue? ' ${NC} 
    gotoxy 53 26
    read -r choice
    gotoxy 58 26
    echo "                             "
    if [ "$(echo "$choice" | tr '[:upper:]' '[:lower:]')" = "no" ]; then
            exit 0
    fi
}

disable_input() {
    stty -icanon  # Disable canonical mode (no input buffering)
}

enable_input() {
    stty icanon  # Enable canonical mode
}

