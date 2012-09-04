#!/bin/bash

# Dette skriptet tester at alle lemmaene i verb-sma-lex.txt kan genereres. De
# som ikke kan genereres, kopieres til missingVerbLemmas.txt

###### Extraction: #######
grep ";" ${srcdir}/../../src/morphology/stems/verbs.lexc | grep -v "^\!" \
	| egrep -v '(STRAYFORMS|ENDLEX|+V)' | tr ":+" " " | cut -d " " -f1 \
	| tr -d "#" | sort -u > verbs

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

#### First we try to generate the infinitives:
		sed 's/$/+V+Inf/' verbs \
			| $lookuptool ${srcdir}/../../src/generator.gt$f \
			| cut -f2 | grep -v "V+" | grep -v "^$" | sort -u > analverbs

#### Kvifor trekkjer vi ut +N-analyser, og genererer substantiv i ein verb-test?
		cat verbs | sed 's/$/+V+Inf/' \
			| $lookuptool ${srcdir}/../../src/generator.gt$f \
			| cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' \
			| $lookuptool ${srcdir}/../../src/generator.gt$f | cut -f2 \
			| grep -v "^$" >> analverbs 

#### Sort uniq resultatet
		sort -u -o analverbs analverbs

#### Samanlikne inndata med utdata:
		comm -23 verbs analverbs > missingVerbLemmas.txt
		rm *verbs
		open -a SubEthaEdit missingVerbLemmas.txt

		# if at least one word is found, the test failed:
		if [ `wc -w missingVerbLemmas.txt | tr -s ' ' | cut -d' ' -f2` -gt 0 ]
		then
		    exit 1
		fi
	fi
done

if [ $transducer_found -eq 0 ]; then
    echo No transducer found
    exit 99
fi
