#!/bin/bash


module spider 2> module_list.txt
grep $1 module_list.txt > temp.txt

if [ -s "temp.txt" ]; then
    echo "File temp.txt is not empty"
else
    echo "File temp.txt is empty"
fi
