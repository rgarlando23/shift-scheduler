#!/bin/bash
FILE=names.txt

test1=("kim" "mid" "A1")
test2=("san" "mid" "a2")
test3=("ken" "night" "A1")
test4=("ad" "morning" "A1")
test5=("gab" "d@y" "B4")

randomizeName() {

   for i in {1..5}
   do
        lc=0
        while read -r line; 
        do
            ((lc++))
        done < $FILE

      # get a random number between 1 and $lc
        rnd=$RANDOM
        let "rnd %= $lc"
        ((rnd++))

       # traverse file and find line number $rnd
        i=0
        while read -r line; 
        do
          ((i++))
          [ $i -eq $rnd ] && break
        done < $FILE

        printf '%s\n' "$line"
    done
}

randomizeName





