
































 * **LEXICON ARABICCASES**  adds +Arab

 * **LEXICON ARABICCASE**  adds +Arab

 * **LEXICON ARABICCASE0**  adds +Arab


 * **LEXICON DIGITCASES**  to distinguish between 0 and oblique






of ordinals. Strings like `10.` are inherently ambiguous — they can eitiher
be a regular cardinal followed by an end-of-sentence full stop, or they can
be an ordinal, potentially in the middle of a sentence. Regular fst's know
nothing about this double nature, so we just give the default ordinal
analysis. But for pmatch-based lookup and tokenisation, we try to find all
the alternatives. The lexicon contains just the following two lines:
```
```
The idea is that input like `10.` can then be analysed both as the ordinal
`10.`, and as the sequence cardinal `10` + the sentence ending full stop
`.`. The lexc entry above will only give the ordinal analysis of `10.`,
but then tell the fst runtime to go back and try to find alternatives for the
same input, in which case it will find that `10` + `.` matches the same
input. Both tokenisations will then be printed by `hfst-tokenise --giella`,
so that further processing can be done to choose the correct one in a given
context. The location of the symbol `@P.Pmatch.Backtrack@` determines where
the split is being done, and thus which parts could potentially get other
analyses.







* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/numerals.lexc](http://github.com/giellalt/lang-sma/blob/main/../src/fst/affixes/numerals.lexc)</small>