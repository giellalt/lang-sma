# Dette skriptet tester at nesten alle lemmaene i noun-sma-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingnounLemmas.txt

grep ";" noun-sma-lex.txt | grep -v "^\!" | egrep -v '(CmpN/Only|+Gen+|+Der+)' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " | tr "¢" ":" | sort -u > nouns
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analnouns 
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep -v "^$" >> analnouns 
grep ";" noun-sma-lex.txt | grep -v "^\!" | grep ' R '| cut -d ":" -f1 | sed 's/+Use\/Sub//' | sed 's/+Dial\/-SW//' | sed 's/+Dial\/-NOR//' | sed 's/CmpN\/SgN$/Cmp#gåetie+N+Sg+Nom/' |  sed 's/CmpN\/PlG$/Cmp#gåetie+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "\-" | grep -v "\-.*\-" | cut -d "-" -f1 >> analnouns
grep ";" noun-sma-lex.txt | grep -v "^\!" | grep ' R '| cut -d ":" -f1 | sed 's/+Use\/Sub//' | sed 's/+Dial\/-SW//' | sed 's/+Dial\/-NOR//' | sed 's/CmpN\/SgN$/Cmp#gåetie+N+Sg+Nom/' |  sed 's/CmpN\/PlG$/Cmp#gåetie+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sma/bin/isma.fst | cut -f2 | grep "\-" | grep "\-.*\-" | cut -d "-" -f1,2 >> analnouns
sort -u -o analnouns analnouns 
comm -23 nouns analnouns > missingnounLemmas.txt
rm *nouns
open missingnounLemmas.txt
