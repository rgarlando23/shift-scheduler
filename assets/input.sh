#!/bin/bash

source assets/border.sh

input() {
    local UserName
    local UserShift
    local UserTeam
    local UserShed


    while true;
    do
        clear
        border
        gotoxy 36 17
        read -r UserName
        #insert case insensitive word "print"
        if  [ $(echo "$UserName" | tr [:upper:] [:lower:]) = "print" ]
        then 
            clear
            exit
        else
            gotoxy 36 18
            read -r UserShift
            #insert lowercase
            UserShift="$(echo "$UserShift" | tr [:upper:] [:lower:])"
            gotoxy 36 19
            read -r UserTeam
            #insert Upercase
            UserTeam="$(echo "$UserTeam" | tr [:lower:] [:upper:])"
            #insert Shift Validator
            
            case $UserShift in
            "morning")
                UserSched="6am - 3pm"
                ;;
            "mid")
                UserSched="2pm - 11pm"
                ;;
            "night")
                UserSched="10pm - 7am"
                ;;
            *)
                UserSched="Unknown shift"
                ;;
            esac
            echo "$UserTeam, $UserName, $UserShift, $UserSched" >> data/schedule.csv
        fi
           
    done
    exit
}