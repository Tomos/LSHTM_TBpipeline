#!/bin/bash

#source scripts/module_check.sh

function check_mod_test(){
   counter=0
   expected_zero=0
   expected_one=1

   # A MODULE THAT EXISTS:
#   result1=$(check_mod anaconda3)
#   res1=$?
#   if [ "$res1" -eq "$expected_zero" ]; then
#	counter=counter
#   else
#	counter=coutner+1
#   fi

   # A MODULE THAT DOES NOT EXITS:
   result2=$(check_mod)
   res2=$?

   echo $result2
   echo $res2


   # IF ALL TESTS ARE PASSED THE $COUNTER VARIABLE SHOULD BE EQUAL TO ZERO
   if [ "$counter" -ne "$expected_zero" ]; then
	return 1
   else
	return 0
   fi
}


