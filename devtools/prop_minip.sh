#!/bin/bash

# script to generate paradigms for generating word forms
# command:
# sh devtools/prop_minip.sh PATTERN
# examples, when you are in sma:
# sh devtools/prop_minip.sh Galileje  
# sh devtools/prop_minip.sh ACCRA  


PATTERN=$1
L_FILE="in.txt"
cut -d '!' -f1 src/fst/generated_files/smi-sma-propernouns.lexc | grep $PATTERN | tr '+' ':' | cut -d ':' -f1 | tr -d '%'>$L_FILE

P_FILE="test/data/testpropparadigm.txt"

for lemma in $(cat $L_FILE);
do
 for form in $(cat $P_FILE);
 do
   echo "${lemma}${form}" | $HLOOKUP $GTLANGS/lang-sma/src/generator-gt-norm.hfstol
 done
 rm -f $L_FILE
done

