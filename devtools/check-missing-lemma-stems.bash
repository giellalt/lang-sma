#!/usr/bin/env bash

##
## Script that returns the stems/$TYPE.lexc entries for the missing
## lemmas together with a count of the continuation lexica used for
## these lemmas. Run `make check` before running this script.
##
## Usage (standing in lang-$LANG, with "nouns" as example:)
## devtools/check-missing-lemma-stems.bash nouns
##

## WORKS IN BASH, NOT IN SH!!

DESC='
The script returns the stems/<TYPE>.lexc entries for the missing
lemmas of that type together with a count of the continuation lexica
used for these lemmas.'

USAGE="
   Usage:
   $0 <TYPE>
   where available <TYPE> is one of [ ${args} ]";
  
missing_files=`ls test/src/morphology/missing_*_lemmas.hfst.txt 2> /dev/null`;
if [ "$missing_files" ]; then
    possible_values=`ls $missing_files | cut -f2 -d'_' | perl -ne 'chomp; print "$_ "'`;
    args="${possible_values}help";
else
    echo "===> No test/src/morphology/missing_XXX_lemmas.hfst.txt files to examine!"
    echo "===> Everything is fine?"
    echo "===> Or did you forget 'make check'?"
    exit 86
fi
    
help='help'; ## !!??
if [ "$1" == "$help" ]; then
    echo "$DESC"
    echo "$USAGE"
    exit 0
fi

if [ $# = 0 ]; then
    echo ""
    echo "Exiting: Missing <TYPE> argument:";
    echo "$USAGE"
    exit 85
fi

TYPE=$1;

MISSING=test/src/morphology/missing_${TYPE}_lemmas.hfst.txt
FILTER=/tmp/missing-${TYPE}-filter_${USER}

cat $MISSING | awk '{print ("^" $1 ":")}' > $FILTER

echo ""
echo '#### STEMS:'
egrep --color -f $FILTER src/fst/stems/${TYPE}.lexc 

echo ""
echo '#### CONTINUATION LEXICA:'
egrep -f $FILTER src/fst/stems/${TYPE}.lexc | awk '{print $2}' | sort | uniq -c | sort -nr --key=1,1

### save stem file
OUT=test/src/morphology/missing_${TYPE}_lemmas_stems.txt
egrep --color -f $FILTER src/fst/stems/${TYPE}.lexc > $OUT

echo ""
echo ""
echo "The above stem listing also in $OUT"
echo ""
