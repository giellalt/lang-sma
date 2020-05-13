# Dette skriptet tester at nesten alle lemmaene i verbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingadjLemmas.txt og blir så analysert for å hjelpe med debugging.

# Hent ut lemmaer, bortsett fra Err/Lex (som blir filtrert bort fra normgenerator). Lemmaene lagres som adverbs
grep ";" ../../../src/morphology/stems/adverbs.lexc | egrep -v "(^\!|\+Err\/Lex)" | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 |  tr "€" " " | tr "¢" ":" | tr -d '%' | sort -u > adverbs

# Generer adverbformen av lemmaene i adverbs
cat adverbs | sed 's/$/+Adv/' | $LOOKUP ../../../src/generator-gt-norm.xfst | grep -v '\?' | cut -f2 | grep -v "^$" | sort -u > analadverbs 

# Sammenlikne lista med adverblemmaer med den genererte lista med adverber. Adverblemmaer som ikke er i den genererte lista, kopieres til missingadverbLemmas.txt. Formene analyseres for enklere debugging. 
comm -23 adverbs analadverbs | $LOOKUP ../../../src/analyser-gt-desc.xfst  > missingadverbLemmas.txt

# Fjerne filer
rm *adverbs

# Åpne fila i see
see missingadverbLemmas.txt
