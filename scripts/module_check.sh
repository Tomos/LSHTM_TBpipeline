#!/bin/bash

function check_mod(){

   module spider 2> module_list.txt
   #name=$(echo $1)
   grep $1 module_list.txt > temp.txt
   rm module_list.txt

   if [ $# -ne 1 ]; then
	echo "Incorrect number of arguments passed."
	return 2
   else
       if [ -s "temp.txt" ] && [ -f "temp.txt" ]; then
            echo "Package $1 is available"
            rm temp.txt
	    return 0
        else
            echo "Package $1 is not installed or not available; please install."
	    rm temp.txt
            return 1
       fi
   fi
}


