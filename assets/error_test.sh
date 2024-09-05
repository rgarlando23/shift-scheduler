#!/bin/bash
source assets/color.sh

data_file="data/schedule.csv"

#function Error Shift (Max Shift 

errorShift()
{
    local shiftAnswer=$1
    while ! [[ "$shiftAnswer" =~ ^(morning|mid|night)$ ]]; do
         
        gotoxy 26 26
        echo -e ${BRed} "Shift not found."
        disable_input
        sleep 1
        gotoxy 26 26
        enable_input
        echo "                                       "
        gotoxy 26 26
        continueFunc
    done

}

errorTeam()
{
   local teamAnswer = $1
   #incorrect Team Input
   while ! [[ "$teamAnswer" =~ ^(A1|A2|B1|B2|B3)$ ]]; do
        gotoxy 26 26
        echo -e " ${RED} Inputed team not found." ${NC}
        disable_input
        sleep 1
        gotoxy 26 26
        echo "                       "
        enable_input
        gotoxy 26 26 
        continueFunc
    done 
}

continueFunc(){
    gotoxy 26 26
    echo -e 'Do you Want to Continue? ' ${NC} 
    gotoxy 51 26
    read -r choice
    gotoxy 26 26
    echo "                            "
     if [ "$(echo "$choice" | tr '[:upper:]' '[:lower:]')" = "yes" ]; then
            gotoxy 37 18
            echo "                                  " 
            gotoxy 37 18
            read -r UserShift
            UserShift="$(echo "$UserShift" | tr '[:upper:]' '[:lower:]')"
        else
            exit 0
    fi
}

disable_input() {
    stty -icanon  # Disable canonical mode (no input buffering)
}

enable_input() {
    stty icanon  # Enable canonical mode
}

