#!/bin/bash

source assets/color.sh


gotoxy() {
    local x=$1
    local y=$2
    echo -ne "\033[${y};${x}H"
}

border() {
    echo -ne "\033["
    gotoxy 8 1
    echo '╭──────────────────────────────────────────────────────────────────────────╮'
    gotoxy 8 2
    echo '│                                                                          │'
    gotoxy 8 3
    echo -e "│  "   ${GREEN} " ██████╗ ██████╗ ███████╗██╗    ██╗███████╗██████╗ ██╗  ██╗███████╗" ${NC}   " │"
    gotoxy 8 4
    echo -e "│ "   ${GREEN} " ██╔═══██╗██╔══██╗██╔════╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝" ${NC}   " │"
    gotoxy 8 5
    echo -e "│ "   ${GREEN} " ██║   ██║██████╔╝███████╗██║ █╗ ██║█████╗  ██████╔╝█████╔╝ ███████╗" ${NC}   " │"
    gotoxy 8 6
    echo -e "│ "   ${GREEN} " ██║   ██║██╔═══╝ ╚════██║██║███╗██║██╔══╝  ██╔══██╗██╔═██╗ ╚════██║" ${NC}   " │"
    gotoxy 8 7
    echo -e "│ "   ${GREEN} " ╚██████╔╝██║     ███████║╚███╔███╔╝███████╗██║  ██║██║  ██╗███████║" ${NC}   " │"
    gotoxy 8 8
    echo -e "│ "   ${GREEN} "  ╚═════╝ ╚═╝     ╚══════╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝" ${NC}   " │"
    gotoxy 8 9
    echo '│                                                                          │'
    gotoxy 8 10
    echo -e ${NC}'│  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓  │'
    gotoxy 8 11
    echo -e "│  ┃"  ${BGreen} "                         Shift Scheduler                        "  ${NC}      "┃  │"
    gotoxy 8 12
    echo '│  ┃                           ━━━━━━━━━━━━━━━                          ┃  │'
    gotoxy 8 13
    echo '│  ┃          Shifts                                     Teams          ┃  │'
    gotoxy 8 14
    echo '│  ┃    (Morning,Mid,Night)                        (A1,A2,B1,B2,B3)     ┃  │'
    gotoxy 8 15
    echo '│  ┃                                                                    ┃  │'
    gotoxy 8 16
    echo '│  ┃                                                                    ┃  │'
    gotoxy 8 17
    echo '│  ┃                  Name:                                             ┃  │'
    gotoxy 8 18
    echo '│  ┃                  Shift:                                            ┃  │'
    gotoxy 8 19
    echo '│  ┃                  Team:                                             ┃  │'
    gotoxy 8 20
    echo '│  ┃                                                                    ┃  │'
    gotoxy 8 21
    echo '│  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛  │'
    gotoxy 8 22
    echo '│                                                                          │'
    gotoxy 8 23
    echo -e "│ " ${BYellow} "          ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓     " ${NC} "      │"
    gotoxy 8 24
    echo -e "│ " ${BYellow} "          ┃ Status:                                      ┃     " ${NC} "      │"
    gotoxy 8 25
    echo -e "│ " ${BYellow} "          ┃                                              ┃     " ${NC} "      │"
    gotoxy 8 26
    echo -e "│ " ${BYellow} "          ┃                                              ┃     " ${NC} "      │"
    gotoxy 8 27
    echo -e "│ " ${BYellow} "          ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛     " ${NC} "      │"
    gotoxy 8 28
    echo '│                                                                          │'
    gotoxy 8 29
    echo -e '│    type' ${GREEN} "print" ${NC} "on name       " ${BRed} " ◯  ◯  ◯ "  ${NC}  "          to exit program     │"
    gotoxy 8 30
    echo -e '│     to print schedule                               type '${BRed}'exit'${NC}' on name    │'
    gotoxy 8 31
    echo '╰──────────────────────────────────────────────────────────────────────────╯'
    gotoxy 8 32
    echo ' \________________________________________________________________________/ '
    gotoxy 8 33 
    echo '                                                                            '
}
