#!/bin/bash

# Dette skriptet tester at nesten alle lemmaene i
# $GTHOME/newinfra/langs/sma/src/morphology/stems/adjectives.lexc kan genereres.
# De som ikke kan genereres, kopieres til missingAdjLemmas.txt

###### Extraction: #######
### Regular adjectives:
grep ";" ${srcdir}/../../src/morphology/stems/adjectives.lexc | grep -v "^\!" \
	| egrep -v "(PRED|CASE| MES|EVTEBE)" | tr ":+" " " | cut -d " " -f1 \
	| tr -d "#" | sort -u > adjs
### Adjectives with no attr form, ie only pred form:
grep ";" ${srcdir}/../../src/morphology/stems/adjectives.lexc | grep -v "^\!" \
	| egrep "(PRED|CASE)" | tr ":+" " " | cut -d " " -f1 | tr -d "#" \
	| sort -u > predadjs
### Adjectives with only comparative forms:
grep ";" ${srcdir}/../../src/morphology/stems/adjectives.lexc | grep -v "^\!" \
	| grep "EVTEBE" | tr ":+" " " | cut -d " " -f1 | tr -d "#" \
	| sort -u > compladjs
### Adjectives with only superlative forms:
grep ";" ${srcdir}/../../src/morphology/stems/adjectives.lexc | grep -v "^\!" \
	| grep " MES" | tr ":+" " " | cut -d " " -f1 | tr -d "#" \
	| sort -u > superladjs

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
	if [ -f "${srcdir}/../../src/generator.gt$f" ]; then
		let "transducer_found += 1"

#### First we try to generate the regular adjectives:
		sed 's/$/+A+Attr/' adjs | $lookuptool ${srcdir}/../../src/generator.gt$f \
			| cut -f2 | grep -v "A+" | grep -v "^$" | sort -u > analadjs 

#### Then we try to generate the predicate-only adjectives:
		sed 's/$/+A+Sg+Nom/' predadjs \
			| $lookuptool ${srcdir}/../../src/generator.gt$f | cut -f2 \
			| grep -v "A+" | grep -v "^$" | sort -u >> analadjs 

#### Then we try to generate the predicate-only adjectives:
		sed 's/$/+A+Superl+Sg+Nom/' superladjs \
			| $lookuptool ${srcdir}/../../src/generator.gt$f | cut -f2 \
			| grep -v "A+" | grep -v "^$" | sort -u >> analadjs 

#### Then we try to generate the predicate-only adjectives:
		sed 's/$/+A+Comp+Sg+Nom/' compladjs \
			| $lookuptool ${srcdir}/../../src/generator.gt$f | cut -f2 \
			| grep -v "A+" | grep -v "^$" | sort -u >> analadjs 

		cat predadjs superladjs compladjs >> adjs
		sort -u -o adjs adjs 
		sort -u -o analadjs analadjs 
		comm -23 adjs analadjs > missingAdjLemmas.txt
		rm -f *adjs
		open -a SubEthaEdit missingAdjLemmas.txt

		# if at least one word is found, the test failed:
		if [ `wc -w missingAdjLemmas.txt | tr -s ' ' | cut -d' ' -f2` -gt 0 ]
		then
		    exit 1
		fi
	fi
done

if [ $transducer_found -eq 0 ]; then
    echo No transducer found
    exit 99
fi
