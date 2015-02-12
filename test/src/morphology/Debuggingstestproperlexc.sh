# Dette skriptet tester at alle lemmaene i propernoun-sma-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingProperLemmas og blir så analysert for å hjelpe med debugging.

# Hent alle lemmaer, bortsett fra hardkoda +Attr
grep ";" ../../../src/morphology/generated_files/smi-sma-propernouns.lexc | egrep -v "(^\!|LexSub|Err\/Sub)" | egrep -v Attr | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr "€" " " | sort -u > props

# Generer alle lemmaer med Sg+Nom
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP ../../../src/generator-gt-norm.xfst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analprops 

# Generer lemmaer med Pl+Nom, de som ikke lar seg generere med Sg+Nom
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/langs/sma/src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/langs/sma/src/generator-gt-norm.xfst | grep -v '\?' | cut -f2 | grep -v "^$" >> analprops 
sort -u -o analprops analprops 

# Sammenlikne lemmaer med genereringa
comm -23 props analprops > missingProperLemmas

# Hent alle lemmaer med hardkoda +Attr
grep ";" ../../../src/morphology/generated_files/smi-sma-propernouns.lexc | egrep -v "(^\!|LexSub|Err\/Sub)" | grep Attr | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr "€" " " |  sort -u > attrprops

# Generer lemmaene med +Attr
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/langs/sma/src/generator-gt-norm.xfst | grep -v "\?" | cut -f2  | grep -v "^$" | sort -u > analattrprops  

# Sammenlikne lemmaer med genereringa
comm -23 attrprops analattrprops >> missingProperLemmas

# Analyser lemmaer som ikke lar seg generere, for debugging
cat missingProperLemmas |$LOOKUP $GTHOME/langs/sma/src/analyser-gt-desc.xfst > analysermissingProperLemmas
rm *props
see analysermissingProperLemmas
