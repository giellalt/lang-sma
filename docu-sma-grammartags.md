Overview
========

All the words are analysed with dictionary form + grammatical tags. Each
tag is introduced with a "+" sign. We thus have

bïjlem bïjle+N+Sg+Acc  
båatam båetedh+V+IV+Ind+Prs+Sg1

The main parts of speech (POS) for South Saami are:

Nouns, adjectives, verbs, pronouns, adverbs, particles, subjunctions,
conjunctions, postpositions, prepositions and interjections.

The nouns
=========

The string is "+N+Number+Case+Possessivesuffix+Clitic". The word form
"nïejteme" 'my girl' is thus analysed as "nïejte+N+Sg+Nom+PxSg1".

Here is a list of the nominal tags, given in the same order as for the
analysis.

|                      |                                                                |
|----------------------|----------------------------------------------------------------|
| Part of speech:      |                                                                |
| Number:              | +Sg, +Pl                                                       |
| Case:                | +Ess +Nom +Gen +Acc +Ill +Ine +Ela +Com                        |
| (Possessive suffix:) | +PxSg1 +PxSg2 +PxSg3 +PxDu1 +PxDu2 +PxDu3 +PxPl1 +PxPl2 +PxPl3 |

The adjectives
==============

Used non-attributively the adjective resembles the noun:

|                 |                                         |
|-----------------|-----------------------------------------|
| Part of speech: | +A                                      |
| (Grade:)        | +Comp, +Superl                          |
| Number:         | +Sg, +Pl                                |
| Case:           | +Ess +Nom +Gen +Acc +Ill +Ine +Ela +Com |

Used attributively the adjective has a quite simple tag scheme:

|                 |       |
|-----------------|-------|
| Part of speech: | +A    |
| Attribute       | +Attr |

The verbs
=========

Finite and infinite verb forms have quite distinct paradigms. Finite
first:

|                 |                                                       |
|-----------------|-------------------------------------------------------|
| Part of speech: | +V                                                    |
| (Derivation)    | +Der/PassL                                            |
| Mood:           | +Ind, +Cond, +Imprt                                   |
| Tense           | +Prs, +Prt                                            |
| Person/Number   | +Sg1 +Sg2 +Sg3 +Du1 +Du2 +Du3 +Pl1 +Pl2 +Pl3, +ConNeg |

Infinite verb forms:

|                   |                                             |
|-------------------|---------------------------------------------|
| Part of speech:   | +V                                          |
| (Derivation:)     | +Der/PassL                                  |
| Nominal verb form | +Inf, +Ger, +PrsPrc, +PrfPrc, VGen, +VAbess |

The pronouns
============

The personal, demonstrative and interrogative pronouns:

baseform+Pron+Pers+NumberPerson+Case

Example:

underlying form: manne+Pron+Pers+Sg1+Com, surface form: mannine  
dat+Pron+Dem+Pl+Nom

The reflexive pronouns:

baseform+Pron+pronoun\_type+Case(+possessive suffix)

Example: underlying form: ieš+Pron+Refl+Loc+PxDu1, surface form: alddáme

The indeclinable words
======================

These have their POS tag as their only tag:

    underlying form: birra+Pr or birra+Po
    surface form:    birra

Alphabetic list over the tags
=============================

Part of speech
==============

-   **+A:**  
    Adjective
-   **+Adv:**  
    Adverb
-   **+CC:**  
    Conjunction
-   **+CS:**  
    Subjunction
-   **+Interj:**  
    Interjection
-   **+N:**  
    Noun
-   **+Num:**  
    Numeral
-   **+Pcle:**  
    Particle
-   **+Po:**  
    Postposition
-   **+Pr:**  
    Preposition
-   **+Pron:**  
    Pronoun
-   **+V:**  
    Verb

Sub-part of speech
==================

-   **+Dem:**  
    Demonstrative
-   **+Indef:**  
    Indefinite
-   **+Interr:**  
    Interrogative
-   **+Pers:**  
    Person
-   **+Prop:**  
    Propernoun
-   **+Recipr:**  
    Reciprocal
-   **+Refl:**  
    Reflexive
-   **+Rel:**  
    Relative

Grammatical properties
======================

-   **+ABBR:**  
    Abbreviation
-   **+ACR:**  
    Accronym
-   **+Acc:**  
    Accusative
-   **+Actio:**  
    Actio form of the verb
-   **+Actor:**  
    Actor noun
-   **+Attr:**  
    Attributive
-   **+CLB:**  
    Clause boundary
-   **+Card:**  
    Cardinal
-   **+Cmpnd:**  
    Compound (inconsistent with other notation for this tag)
-   **+Cmpnd+:**  
    Compound (left tag)(inconsistent with other notation for this tag)
-   **+Com:**  
    Comitative
-   **+Comp:**  
    Comperative
-   **+ConNeg:**  
    Negationform of the verb
-   **+Cond:**  
    Conditional
-   **+Du:**  
    Dual
-   **+Du1:**  
    Dual 1. person
-   **+Du2:**  
    Dual 2. person
-   **+Du3:**  
    Dual 3. person
-   **+Ess:**  
    Essive
-   **+Foc/ba:**  
    Focusclitic (-)ba
-   **+Foc/bat:**  
    Focusclitic (-)bat
-   **+Foc/be:**  
    Focusclitic (-)be
-   **+Foc/ge:**  
    Focusclitic (-)ge
-   **+Foc/gen:**  
    Focusclitic (-)gen
-   **+Foc/ges:**  
    Focusclitic (-)ges
-   **+Foc/gis:**  
    Focusclitic (-)gis
-   **+Foc/hal:**  
    Focusclitic (-)hal
-   **+Foc/han:**  
    Focusclitic (-)han
-   **+Foc/naj:**  
    Focusclitic (-)nai
-   **+Foc/naj+Qst:**  
    Focusclitic (-)naigo
-   **+Foc/son:**  
    Focusclitic (-)son
-   **+Gen:**  
    Genitive
-   **+Ger:**  
    Gerund
-   **+Guess:**  
    Tag indicating form not in the lexicon !Not in use
-   **+IV:**  
    Intrasitive verb
-   **+Ill:**  
    Illative
-   **+Imprt:**  
    Imperative
-   **+ImprtII:**  
    Imperative II
-   **+Ind:**  
    Indicative
-   **+Inf:**  
    Infinitive
-   **+LEFT:**  
    Left parenthesis
-   **+Loc:**  
    Locative
-   **+Neg:**  
    Negationverb
-   **+Nom:**  
    Nominative
-   **+Ord:**  
    Ordinal
-   **+PUNCT:**  
    Punctuation other than clause boundaries*"/", "(", ")", "+"*
-   **+Der/PassL, +Der/PassS:**  
    Long and short passive
-   **+Pl:**  
    Plural
-   **+Pl1:**  
    Plural 1. person
-   **+Pl2:**  
    Plural 2. person
-   **+Pl3:**  
    Plural 3. person
-   **+Cmp/PlGen:**  
    Plural genitive compound
-   **+Pot:**  
    Potential
-   **+PrfPrc:**  
    Perfect participle
-   **+Prs:**  
    Present tense
-   **+PrsPrc:**  
    Present participle
-   **+Prt:**  
    Preteritum
-   **+PxDu1:**  
    Possessivesuffix dual 1. person
-   **+PxDu2:**  
    Possessivesuffix dual 2. person
-   **+PxDu3:**  
    Possessivesuffix dual 3. person
-   **+PxPl1:**  
    Possessivesuffix plural 1. person
-   **+PxPl2:**  
    Possessivesuffix plural 1. person
-   **+PxPl3:**  
    Possessivesuffix plural 1. person
-   **+PxSg1:**  
    Possessivesuffix singular 1. person
-   **+PxSg2:**  
    Possessivesuffix singular 2. person
-   **+PxSg3:**  
    Possessivesuffix singular 3. person
-   **+Qst:**  
    Question clitic *(-)go*
-   **+Qst+Foc/son:**  
    Question clitic
-   **+RIGHT:**  
    Right parenthesis
-   **+Sg:**  
    Singular
-   **+Sg1:**  
    Singular 1. person
-   **+Sg2:**  
    Singular 2. person
-   **+Sg3:**  
    Singular 3. person
-   **+Cmp/Sg:**  
    Singular compound
-   **+Cmp/SgGen:**  
    Singular genitive compound
-   **+Cmp/SgNom:**  
    Singular nominative compound
-   **+Sup:**  
    Supinum
-   **+Superl:**  
    Superlative
-   **+TV:**  
    Transitive verb
-   **+VAbess:**  
    Verb abessive
-   **+VGen:**  
    Verb genitive

Derivational suffix tags
========================

Forthcoming...
