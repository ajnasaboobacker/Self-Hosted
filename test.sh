#!/bin/bash

while true
do
        read -n 20 -p "ENter the string1" string1
        length=$(echo -n $string1 | wc -m)
        echo $length

        #echo "String1 exceeds 20 characters"
        if [[ $string1 =~ ^[0-9]+$  ||  ! $string1 =~ ^[[:alnum:]]+$ ]]; then
                echo "Wrong input of string1"
        else
                echo "Correct input of string1"
                break
        fi
done

while true
do
        read -n 20 -p "Enter the string2" string2
        echo "String2 exceeds  20 characters"
        if [[ $string2 =~ [0-9]+$ || ! $string2 =~ ^[[:alnum:]]+$ ]]; then
                echo "Wrong input of string2"
        else
                echo "Correct input of string2"
                break
        fi
done
