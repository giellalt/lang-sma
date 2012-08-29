#!/bin/bash

# Dette skriptet tester at nesten alle lemmaene i noun-sma-lex.txt kan genereres.
# De som ikke kan genereres, kopieres til missingnounLemmas.txt

###### Extraction: #######
# extract non-compounding lemmas:
grep ";" ${srcdir}/../../src/morphology/stems/nouns.lexc | grep -v "^\!" | \
	egrep -v '(CmpN/Only|+Gen+|+Der+| R )' | sed 's/% /€/g' | sed 's/%:/¢/g' | \
	tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " | tr "¢" ":" | \
	sort -u > nouns
# extract compounding lemmas:
grep ";" ${srcdir}/../../src/morphology/stems/nouns.lexc | grep -v "^\!" | \
	grep ' R '| tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > Rnouns

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

###### Test non-comopunds: #######
		# generate nouns in Singular, extract the resulting generated lemma, store it:
		sed 's/$/+N+Sg+Nom/' nouns | $lookuptool ${srcdir}/../../src/generator.gt$f | \
			cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analnouns 
		# Generate nouns, extract those that do not generate in singular,
		# generate the rest in plural:
		sed 's/$/+N+Sg+Nom/' nouns | $lookuptool ${srcdir}/../../src/generator.gt$f | \
			cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | \
			$lookuptool ${srcdir}/../../src/generator.gt$f | cut -f2 | \
			grep -v "^$" >> analnouns 

###### Test comopunds: #######
		# Test nouns that only can generate as compounds:
		grep ";" ${srcdir}/../../src/morphology/stems/nouns.lexc | \
			grep -v "^\!" | grep ' R '| cut -d ":" -f1 | sed 's/+Use\/Sub//' | \
			sed 's/+Dial\/-SW//' | sed 's/+Dial\/-NOR//' | sed 's/+CmpN\/Pref//' | \
			sed 's/CmpN\/SgN$/Cmp#gåetie+N+Sg+Nom/' | \
			sed 's/CmpN\/PlG$/Cmp#gåetie+N+Sg+Nom/' | \
			$lookuptool ${srcdir}/../../src/generator.gt$f | cut -f2 | \
			grep "\-" | grep -v "\-.*\-" | cut -d "-" -f1 > Ranalnouns
		grep ";" ${srcdir}/../../src/morphology/stems/nouns.lexc | \
			grep -v "^\!" | grep ' R '| cut -d ":" -f1 | sed 's/+Use\/Sub//' | \
			sed 's/+Dial\/-SW//' | sed 's/+Dial\/-NOR//' | sed 's/+CmpN\/Pref//' | \
			sed 's/CmpN\/SgN$/Cmp#gåetie+N+Sg+Nom/' | \
			sed 's/CmpN\/PlG$/Cmp#gåetie+N+Sg+Nom/' | \
			$lookuptool ${srcdir}/../../src/generator.gt$f | \
			cut -f2 | grep "\-" | grep "\-.*\-" | cut -d "-" -f1,2 >> Ranalnouns

###### Collect results: #######
		# Sort and compare original input with resulting output - the diff is stored and opened in SEE:
		sort -u -o analnouns analnouns 
		sort -u -o Ranalnouns Ranalnouns 
		comm -23 nouns analnouns > missingnounLemmas.txt
		comm -23 Rnouns Ranalnouns >> missingnounLemmas.txt
		open -a SubEthaEdit missingnounLemmas.txt

		# if at least one word is found, the test failed:
		if [ `wc -w missingnounLemmas.txt` -gt 0 ]; then
		    exit 1
		fi
	fi
done

if [ $transducer_found -eq 0 ]; then
    echo No transducer found
    exit 1
fi
