# Dette skriptet tester at nesten alle lemmaene i noun-sma-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingnounLemmas.txt og blir så analysert for å hjelpe med debugging.

generator=../../../src/generator-gt-norm.xfst

# Hent alle lemmaer, bortsett fra hardkoda +Gen +Der og lemmaer som går til R
grep ";" ../../../src/morphology/stems/nouns.lexc | egrep -v "(^\!|LexSub)" | egrep -v '(\+Gen\+|\+Der\+| R )' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 |  tr "€" " " | tr "¢" ":" | sort -u > nouns

# Hent alle lemmaer som går til R
grep ";" ../../../src/morphology/stems/nouns.lexc | egrep -v "(^\!|LexSub)" | grep ' R '| tr ":+" " " | cut -d " " -f1 |  sort -u > Rnouns

# Generer alle lemmaer med Sg+Nom
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $generator |  grep -v "\?" | cut -f2 | grep -v "^$" | sort -u > analnouns 

# Generer lemmaer med Pl+Nom, de som ikke lar seg generere med Sg+Nom
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $generator | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP $generator| cut -f2 | grep -v "^$" >> analnouns 

# Generer R lemmaer som sammensatt med gåetie, fjern gåetie
grep ";" ../../../src/morphology/stems/nouns.lexc | egrep -v "(^\!|LexSub)" | grep ' R '| cut -d ":" -f1 | cut -d "+" -f1 | sed 's/$/+N+Cmp#gåetie+N+Sg+Nom/' | $LOOKUP $generator| cut -f2 | sed 's/gåetie//' > Ranalnouns
sort -u -o analnouns analnouns 
sort -u -o Ranalnouns Ranalnouns 

# Sammenlikne lemmaer med genereringa
comm -23 nouns analnouns > missingnounLemmas.txt
comm -23 Rnouns Ranalnouns >> missingnounLemmas.txt

rm *nouns
# Generer missinglemmaer, for debugging
cat missingnounLemmas.txt |sed 's/$/+N+Sg+Nom/'| $LOOKUP $generator | see
