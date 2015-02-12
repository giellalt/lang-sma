# Dette skriptet tester at nesten alle lemmaene i noun-sma-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingnounLemmas.txt og blir så analysert for å hjelpe med debugging.

grep ";" ../../../src/morphology/stems/nouns.lexc | egrep -v "(^\!|LexSub|Err\/Sub)" | egrep -v '(\+Gen\+|\+Der\+| R )' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 |  tr "€" " " | tr "¢" ":" | sort -u > nouns
grep ";" ../../../src/morphology/stems/nouns.lexc | egrep -v "(^\!|LexSub|Err\/Sub)" | grep ' R '| tr ":+" " " | cut -d " " -f1 |  sort -u > Rnouns
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP ../../../src/generator-gt-norm.xfst |  grep -v "\?" | cut -f2 | grep -v "^$" | sort -u > analnouns 
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP ../../../src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP ../../../src/generator-gt-norm.xfst| cut -f2 | grep -v "^$" >> analnouns 
grep ";" ../../../src/morphology/stems/nouns.lexc | egrep -v "(^\!|LexSub|Err\/Sub)" | grep ' R '| cut -d ":" -f1 | cut -d "+" -f1 | sed 's/$/+N+Cmp#gåetie+N+Sg+Nom/' | $LOOKUP ../../../src/generator-gt-norm.xfst| cut -f2 | sed 's/gåetie//' > Ranalnouns
sort -u -o analnouns analnouns 
sort -u -o Ranalnouns Ranalnouns 
comm -23 nouns analnouns > missingnounLemmas.txt
comm -23 Rnouns Ranalnouns >> missingnounLemmas.txt
rm *nouns
cat missingnounLemmas.txt |sed 's/$/+N+Sg+Nom/'| $LOOKUP ../../../src/generator-gt-norm.xfst | see
