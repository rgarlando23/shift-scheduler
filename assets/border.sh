#!/bin/bash

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
    echo '│     ██████╗ ██████╗ ███████╗██╗    ██╗███████╗██████╗ ██╗  ██╗███████╗   │'
    gotoxy 8 4
    echo '│    ██╔═══██╗██╔══██╗██╔════╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝   │'
    gotoxy 8 5
    echo '│    ██║   ██║██████╔╝███████╗██║ █╗ ██║█████╗  ██████╔╝█████╔╝ ███████╗   │'
    gotoxy 8 6
    echo '│    ██║   ██║██╔═══╝ ╚════██║██║███╗██║██╔══╝  ██╔══██╗██╔═██╗ ╚════██║   │'
    gotoxy 8 7
    echo '│    ╚██████╔╝██║     ███████║╚███╔███╔╝███████╗██║  ██║██║  ██╗███████║   │'
    gotoxy 8 8
    echo '│     ╚═════╝ ╚═╝     ╚══════╝ ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   │'
    gotoxy 8 9
    echo '│                                                                          │'
    gotoxy 8 10
    echo '│  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓  │'
    gotoxy 8 11
    echo '│  ┃                           Shift Scheduler                          ┃  │'
    gotoxy 8 12
    echo '│  ┃                                                                    ┃  │'
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
    echo '│                                    ⭘                                     │'
    gotoxy 8 23
    echo '╰──────────────────────────────────────────────────────────────────────────╯'
    gotoxy 8 24
    echo ' \________________________________________________________________________/ '
    gotoxy 8 25
    echo '                                                                            '
}
