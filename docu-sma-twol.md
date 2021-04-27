Documentation of South Saami rules
==================================

Introduction
------------

This rule formalism is fundamentally different from the one utilised for
North Sámi. Whereas North Saami is modelled as a lexical transducer,
South Saami uses Koskenniemi's original morphophonological approach.

The Alphabet section
--------------------

The alphabet consists of the letters, the English alphabet, the
Norwegian and Swedish letters (they are used interchangeably), and the
letter ï. The Norwegian and Swedish letters are used interchangeably,
and *i* is often used for *ï*. This alternation is taken care of by the
preprocessorfile spellrelax.regex. Note that when generating words, ï
must be used correctly. When foreign names are added, the alphabet
section should be enlarged to the rest of the western European letters.

The two-letter symbols A1 etc. are morphophonemes, i.e. abstractions
over sets of phonemes alternating with each other, e.g. in Umlaut. They
are used as indicated below:

\[Todo: rewrite this in a general way, and not only to nouns. Link it to
umlaut etc., in order to make the explanation cover the verbs and
adjectives as well.\]

     Explanations:
     A1 = illative singular vowel
     A2 = ending vowel in words like 'maana'
     A3 = second vowel in words like 'daktere'
     A4 = first vowel in words like 'jeptsie'
     E1 = first vowel in words like 'sjiellie'
     U2 = ending vowel in words like 'nïejte'
     I1 = ie in all cases except ending vowel in words like 'gåetie'
     I2 = ending vowel in words like 'gåetie'
     I3 = first vowel of many case endings
     I4 = ending vowel on all nouns on three syllables, like 'gierehtse'
     O1 = oe in all cases except ending vowel in words like 'bearkoe'
     O2 = ending vowel in words like 'bearkoe'
     U1 = first vowel in words like 'njueslie'
     Æ  = first vowel in words like 'klihtie'
     Å1 = first vowel in words like 'gullie'
     Å2 = first vowel in words like 'gaevlie'
     Å3 = first vowel in words like 'gåetie' when umlauting in plural
     Å4 = first vowel in words like 'gåetie' when not umlauting in plural
     D1 = possible doubling of preceeding consonant
     ... more to come for sure ;)

Rules section
-------------

Cf. the NJL article, and Karttunen's (written) comments.

The main challenge is to rewrite the rules in order to make them work
for verbs as well as for nouns.

### Bisyllabic stem rules

#### ie rules

I2 is either realised as ie, e or 0.
