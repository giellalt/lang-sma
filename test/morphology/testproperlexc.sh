# Dette skriptet tester at alle lemmaene i propernoun-sma-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingProperLemmas

grep ";" propernoun-sma-lex.txt | grep -v "^\!" | egrep -v '(LAANTE|Attr)' | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " | sort -u > props
grep ";" propernoun-sma-lex.txt | grep -v "^\!" | grep LAANTE | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " | sed 's/$/laante/' >> props
sort -u -o props props 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analprops 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep -v "^$" >> analprops 
sort -u -o analprops analprops 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "N+" > missingProperLemmas
comm -23 props analprops >> missingProperLemmas
grep ";" propernoun-sma-lex.txt | grep -v "^\!" | grep Attr | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " |  sort -u > attrprops
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "N+" >> missingProperLemmas
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 |  grep -v "N+" | grep -v "^$" | sort -u > analattrprops  
comm -23 attrprops analattrprops >> missingProperLemmas
rm *props
open missingProperLemmas
