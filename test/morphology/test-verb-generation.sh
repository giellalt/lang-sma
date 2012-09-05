#!/bin/bash

# Dette skriptet tester at alle lemmaene i verb-sma-lex.txt kan genereres. De
# som ikke kan genereres, kopieres til missingVerbLemmas.txt

###### Variables: #######
sourcefile=${srcdir}/../../src/morphology/stems/verbs.lexc
generatorfile=${srcdir}/../../src/generator.gt
resultfile=missingVerbLemmas.txt

# Check that the source file exists:
if [ ! -f "$sourcefile" ]; then
	echo Source file not found: $sourcefile
	exit 1
fi

###### Extraction: #######
grep ";" $sourcefile | grep -v "^\!" \
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

# Remove old generated files - don't mix Xerox and HFST test results:
		rm -f *verbs $resultfile*.txt

#### First we try to generate the infinitives:
		sed 's/$/+V+Inf/' verbs \
			| $lookuptool $generatorfile$f \
			| cut -f2 | grep -v "V+" | grep -v "^$" | sort -u > analverbs

#### Kvifor trekkjer vi ut +N-analyser, og genererer substantiv i ein verb-test?
		cat verbs | sed 's/$/+V+Inf/' \
			| $lookuptool $generatorfile$f \
			| cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' \
			| $lookuptool $generatorfile$f | cut -f2 \
			| grep -v "^$" >> analverbs 

#### Sort uniq resultatet
		sort -u -o analverbs analverbs

#### Samanlikne inndata med utdata:
		comm -23 verbs analverbs > $resultfile
		rm *verbs

		# if at least one word is found, the test failed, and the list of failed
		# lemmas is opened in SubEthaEdit:
		if [ `wc -w $resultfile | tr -s ' ' | cut -d' ' -f2` -gt 0 ]
		then
			open -a SubEthaEdit $resultfile
		    Fail=1
		fi
	else
		echo Transducer not found: $generatorfile$f
	fi
done

# At least one of the Xerox or HFST tests failed:
if [ $Fail == 1 ]; then
	exit 1
fi

if [ $transducer_found -eq 0 ]; then
    echo No transducer found
    exit 1
fi
