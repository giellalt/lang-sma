#!/bin/bash

# Dette skriptet tester at alle lemmaene i propernoun-sma-lex.txt kan genereres.
# De som ikke kan genereres, kopieres til missingProperLemmas.txt

# Variables:
sourcefile=${srcdir}/../../src/morphology/stems/propernouns.lexc
generatorfile=${srcdir}/../../src/generator.gt
resultfile=missingProperLemmas.txt

###### Extraction: #######
grep ";" $sourcefile | grep -v "^\!" | egrep -v '(LAANTE|Attr)' \
	| sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 \
	| tr -d "#" | tr "€" " " | sort -u > props
grep ";" $sourcefile | grep -v "^\!" | grep LAANTE | sed 's/% /€/g' \
	|  tr ":+" " " | cut -d " " -f1 | tr -d "#" \
	| tr "€" " " | sed 's/$/laante/' >> props
sort -u -o props props 
grep ";" $sourcefile | grep -v "^\!" | grep Attr | sed 's/% /€/g' \
	|  tr ":+" " " | cut -d " " -f1 | tr -d "#" \
	| tr "€" " " |  sort -u > attrprops

###### Start testing: #######

transducer_found=0
for f in  .xfst .hfst; do
	if [ $f == ".xfst" ]; then
		lookuptool="lookup -q -flags mbTT"
		echo "Xerox test"
	else
		lookuptool="hfst-lookup -q"
		echo "Hfst test"
	fi
	if [ -f "$generatorfile$f" ]; then
		let "transducer_found += 1"

		sed 's/$/+N+Prop+Sg+Nom/'   props \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep -v "N+" | grep -v "^$" | sort -u > analprops
		sed 's/$/+N+Prop+Sg+Nom/'   props \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep -v "^$" | cut -d "+" -f1 >> analprops
		sed 's/$/+N+Prop+Sg+Nom/'   props \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep "N+" | cut -d "+" -f1 > $resultfile
		sed 's/$/+N+Prop+Attr/' attrprops \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep "N+" >> $resultfile
		sed 's/$/+N+Prop+Attr/' attrprops \
			| $lookuptool $generatorfile$f | cut -f2 \
			|  grep -v "N+" | grep -v "^$" | sort -u > analattrprops  
		sort -u -o analprops analprops 
		comm -23 props analprops >> $resultfile
		comm -23 attrprops analattrprops >> $resultfile
		rm -f *props
		sort -u -o $resultfile $resultfile
		open -a SubEthaEdit $resultfile

		# if at least one word is found, the test failed:
		if [ `wc -w $resultfile | tr -s ' ' | cut -d' ' -f2` -gt 0 ]
		then
		    exit 1
		fi
	fi
done

if [ $transducer_found -eq 0 ]; then
    echo No transducer found
    exit 99
fi
