

# S O U T H   S Á M I   D I S A M B I G U A T O R          







## Delimiters, tags and sets


DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>" sent


### Tags 

#### BOS/EOS:

* (>>>) (<s>)
(<<<) (</s>)

#### Morphological tags

* N 
* Sg 
Pl
* Nom
Acc
Gen
Ine
Ela
Ill
Com
Ess

* PxSg1 
PxSg2
PxSg3
PxPl1
PxPl3
PxPl3





* Sg1 Sg2 Sg3 Pl1 Pl2 Pl3 ;















#### Derivation tags

* Der/A
Der/Car
Der/Dimin 
Der/InchL
Der/NomAct
Der/NomAg
Der/PassL
Der/PassS
Der/Rec
Der/adte
Der/ahtje
Der/alla
Der/d
Der/eds
Der/ht
Der/htalle 
Der/htj
Der/ihks
Der/ijes
Der/l
Der/laakan
Der/ldahke
Der/ldh
Der/ldihkie
Der/les
Der/lg
Der/st
Der/vuota 


#### Error usage tags


#### Other tags 
Cmp/Hyph
<vdic>


####  Semantic tags






#### Secondary tags





#### Syntactic tags

* @CNP
@CVP
@+FAUXV
@+FMAINV
@-FAUXV
@-FMAINV
MAINV  = 



#### Titles


REAL-TITLE
OFFICE
TITLE



## Sets

### Sets of morphological tags for syntactic use

CASES
ADVLCASE
NUMBER















### Noun sets





INSTITUTION
MEDIA
ORGANIZATION
EDUCATION
CURRENCY
CURRENCY
LESSON
OTHER-INDUSTRY 












### Verb sets


REALCOPULAS

COPULAS

V-NOT-COP

MOD-ASP
















### Adjective sets



### Adverb sets


GUKTIEGOSSE

DAESTIE


ILLADV

INEADV1

ELAADV1

INEADV

ELAADV

DV-MOD-ADV


ADV-MOD-NP

GRADE-ADV


### Postposition sets

ILLPO


### BOUNDARY SETS


S-BOUNDARY
REALCLB

SV-BOUNDARY

NP-BOUNDARY


### Derivation sets

V-DER

V-DER-SUF

N-DER
N-DER-SUF

A-DER
A-DER-SUF


PASS

LEX-V
LEX-N
LEX-A
LEX-ADV

VERB-FORMS
2-PERS












# Disambiguation rules


BEFORE-SECTIONS


Rule for adding Sem/Date as a tag to readings which looks like dates (fjernes når vi får felles numeralfil fra shared)

## Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses


## Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses








Rules for adding <vdic> to verbs denoting verbal actions like: ... jeahta Aili Kestkitalo.





SECTION



## Cycle 0 (Early rules)

Removing non-lexicalised forms when lexicalised 













### Numerals and ACR




### Numerals in QPs




### CC og not (spesifikke regler lenger ned)




### Interj





### Possessive suffix


REmove Px if not family



### Pronouns







### Proper nouns


INITIAL















### Verbs







### Postpositions
Selecting postpositions when preceded by genitives, etc.





### Particles and adverbs





























### Adjective or Indef


### Demonstratives




























### Genitive




### Adjective or not


Rel or Interr OR Indef









### Adverbs
Selecting adverbs in local contexts










### Verbs
Selecting verbs in local contexts, based upon agreement patterns












Selecting imperative sentence-initially with appropriate right context




Remove verb readings












Select Inf


## Mapping rules

### CC- and CS-Mapping

* **COMPCS**  @COMP-CS< to Adv or A after goh etc.



## CNP mapping

Mapping CNP to CC and CS.






## CVP Mapping

Mapping @CVP to all CS











Attributes or not










## PrfPrc

Select PrfPrc if DerNomAct



Mapping verbs
























### **killifVinCohort** This rule removes all other readings, if there is a mapped V reading in the same cohort. Every case which this goes wrong, should be fixed in mapping rules or previous disrules.



## Person

leah Prs Sg2 = Pl3




Select Inf If Infv







## Span sentences




### Nomen

Remove Prop Attr if not 1 Prop 




















### Verb or Noun







## CC and CS or Adv

















## Adj or Adv








## Grammatisk ord eller N eller A











## N or V













Ger or Der/NomAct


Adj or Indef


Num






Adv or Po/Pr


Illative or genetive


Essive



Comitative












Accusative or illative

Indef or Adv

special lemmas







Adverb context prefers Adv


Verb person vs. Inf -- moved here in order to have the pronouns disambiguated first.





# Proper nouns

Rule set taken from sme















































































gellie as numeral, not pronoun



Adv modifying a pronoun or noun



















* * *
<small>This (part of) documentation was generated from [../src/cg3/disambiguator.cg3](http://github.com/giellalt/lang-sma/blob/main/../src/cg3/disambiguator.cg3)</small>