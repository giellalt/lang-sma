
South Sámi morphological analyser
==========================================================================

Prefixing and compounding
=========================

## Lexicon `Prefixes`

It contains only one entry:
- `Noerhte- ProperNoun ;`

## Lexicon `R`

This lexicon is the main entry for regular compounding.
All entries NOT requiring a hyphen should point to it. 

The whole content of it is a list of flag diacritics to control compounding.

After the flags, we continue to the `Rreal ;` lexicon, for the real compounding action.

It should be noted that some of the flags above require a corresponding flag in the lexicon `ENDLEX` to work properly. 

## Lexicon `Rreal`

This is where the actual compounding happens.

## Lexicon `RNum`

For compounds of the type `Num+Noun`. We can’t allow `Num+Num`, thus we use a separate compounding lexicon, since the regular `RHyph` lexicon
below contains a continuation pointing back to the numerals.

## Lexicon `RHyph`

This lexicon is used for compounds requiring a hyphen before the next part.
As for the regular compounds, we first add a number of flag diacritics to restrict certain combinations,
before we continue to the real compounding lexicon.

## Lexicon `RHyphReal`

This is where the actual hyphen compounding happens.
The hyphen is added here.

* * *

<small>This (part of) documentation was generated from [src/fst/compounding.lexc](https://github.com/giellalt/lang-sma/blob/main/src/fst/compounding.lexc)</small>

---

