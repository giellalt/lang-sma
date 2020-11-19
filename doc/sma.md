
# South Sámi morphological analyser


# Multichar_Symbols definitions

## Tags for POS (Part-Of-Speech, Word class)
 * **+N** = Noun
 * **+A** = Adjective
 * **+Adv** = Adverb
 * **+V** = Verb
 * **+Pron** = Pronomen
 * **+CS** = Subjunction
 * **+CC** = Conjunction
 * **+Po** = Postposition
 * **+Pr** = Preposition
 * **+Interj** = Interjection
 * **+Pcle** = Particle
 * **+Num** = Numerals
 * **+TODO** = Code for items that have not been modeled yet

 * +Logo    
 * +Subqst     for adverbs

## Tags for sub-POS

### Proper nouns
 * **+Prop** =

### Pronoun subtypes
 * **+Pers** = Personal
 * **+Dem** = Demonstrative
 * **+Interr** = Interrogative
 * **+Refl** = Reflexive
 * **+Recipr** = Reciprocal
 * **+Rel** = Relative
 * **+Indef** = Indefinite

### Numeral subtypes
 * **+Coll** = Collective numeral
 * **+Arab** = Arabic numeral
 * **+Rom** =

## Error (non-standard language) tags

|   Error tag | Explanation
| --- | --- 
|  **+Err/Orth** | Substandard, unormert form av et ord
|  **+Err/Hyph** | Substandard, unormert
|  **+Err/SpaceCmp** | Substandard, unormert 
|  **+Err/Attr** | Substandard, unormert Attr-form av et ord
|  **+Err/Lex** | lemma med dens ordformer er utenfor normen. <br/>No normative lemma, it's grammatically correct.
|  **+Err/Der** | Errors in derivations
|  **+Err/Spellrelax** | Used to tag spellrelaxed typos (tag is inserted via flag diacritics)
|  **+Err/MissingSpace** | in use ins smi lexc

### Usage tags

|   Usage tag | Explanation
| --- | --- 
|  **+Use/Marg** | Marginal, korrekte, eksisterende former, men som er sjeldne. vi kan fjerne disse ordene f.eks fra speller, fordi de er så sjeldne og lite i bruk at de lemma som ligger nært kan bli forvekslet.
|  **+Use/-Spell** | Excluded from speller
|  **+Use/-PLX** | Excluded in PLX speller
|  **+Use/SpellNoSugg** | Recognized but not suggested in speller
|  **+Use/Circ** | Circular path
|  **+Use/CircN** | Circular number path?
|  **+Use/Ped** | Remove from pedagogical speller
|  **+Use/NG** | Do not generate <br/> for isme-ped.fst and apertium
|  **+Use/MT** | Generate for apertium only
|  **+Use/NotDNorm** | For (spellings of) words that do not follow the orthographic principles of sma. Divvun suggest that this shouldn't be normative, even thugh they are decided upon by GG. Included in speller.
|  **+Use/DNorm** | For words without formal normalization. Divvun suggest that this should be normative. Included in speller. Based on 2010 normative decision & Ove Lorentz' suggestions for the norm.
|  **+Use/PMatch** | Do *only* include in fst's for hfst-pmatch
|  **+Use/-PMatch** | Do not include in fst's made for hfst-pmatch
|  **+Use/GC** | Only retained in the gramchecker analyser

## Dialect tags

|   Dialect tag | Explanation
| --- | --- 
|  **+Dial/-S** | Not in the South ! se på disse i forhold til smj, som har +Dial/N for denne.
|  **+Dial/-N** | Not in the North ! se på disse i forhold til smj, som har +Dial/s for denne.
|  **+Dial/-NOR** | Words not in Norway
|  **+Dial/-SW** | Words not in Sweden
|  **+Dial/SH** | Short forms
|  **+Dial/L** | Long forms






## Normative/prescriptive compounding tags
(to govern compound behaviour for the speller, ie what a compound SHOULD BE)

### The left part of a compound should be

The default is `+CmpN/SgN`, so when nothing is specified, that
will be used. To override that one, specify one or more of the
following tags. `+CmpN/SgN` must be specified if also other tags
are listed - unless `+CmpN/SgN` should *not* be used, for course.

|   Normative compounding tag | Explanation
| --- | --- 
|  **+CmpN/Sg** | Singular
|  **+CmpN/SgN** | Singular Nominative
|  **+CmpN/SgG** | Singular Genitive
|  **+CmpN/PlG** | Plural Genitive


### The right part of a compound requires to the left

These tags overrule the regular tags defined above. One or more
can be specified.

|   Normative left-governing tag | Explanation
| --- | --- 
|  **+CmpN/SgLeft** | Sg to the left
|  **+CmpN/SgNomLeft** | etc.
|  **+CmpN/SgGenLeft** | "
|  **+CmpN/PlGenLeft** | "

### This part of the component can ...
|   Normative position tag | Explanation
| --- | --- 
|  **+CmpNP/All** | ... be in all positions, **default**, this tag does not have to be written
|  **+CmpNP/First** | ... only be first part in a compound or alone
|  **+CmpNP/Pref** | ... only be **first** part in a compound, NEVER alone
|  **+CmpNP/Last** | ... only be last part in a compound or alone
|  **+CmpNP/Suff** | ... only be **last** part in a compound, NEVER alone
|  **+CmpNP/None** | ... not take part in compounds
|  **+CmpNP/Only** | ... only be part of a compound, i.e. can never be used alone, but can appear in any position


## Descriptive compounding tags
Tags for compound analysis - this is what a compound actually is. We use this
to research compounding patterns in the corpus.

|   Desriptive compounding tag | Explanation
| --- | --- 
|  **+Cmp/Sg** | Compounding using an unspecified singular stem
|  **+Cmp/SgNom** | Compounding using nominative singular
|  **+Cmp/SgGen** | Compounding using genitive singular
|  **+Cmp/PlGen** | Compounding using genitive plural
|  **+Cmp/Attr** | Compounding using attribute form
|  **+Cmp/eh** | Compound stem in **–eh**, as in *gaameh-gåaroje*, from *gaamege*
|  **+Cmp/ege** | Compound stem in **–ege**, as in *gaamege-gåaroje*
|  **+Cmp/FinEDel** | Deletion of final **e**, as in *voelem-gaaroeh*, from *voeleme*
|  **+Cmp/ShH** | Compounding using a short stem + **h**: *–biejjh–* (from *biejjie*), cf *reakedsbiejjhvadtese*
|  **+Cmp/Sh** | Compounding using a short stem: *–biejj–* (from *biejjie*)
|  **+Cmp/SplitR** | This is a split compound with the other part to the right: <br/> "Arbeids- og inkluderingsdepartementet" => *Arbeids–* = **+Cmp/SplitR**
|  **+Cmp/SplitL** | This is a split compound with the other part to the left, this is the oposite of the previous case
|  **+Cmp** | Dynamic compound - this tag should *always* be part of a dynamic compound. It is important for  Apertium and the speller (to give extra weights to compounds), and useful in other cases as well.
|  **+Cmp/XForm** | Alle Cmp som ikke har en klar klassifisering
|  **+Cmp/AttrH** | Alle Cmp som har en attr-h

# Tags for Inflection

## Tags for Case and Number Inflection
### Case and number
 * **+Sg** = Singular
 * **+Pl** = Plural
 * **+Du** = Dual

 * **+Nom** = Nominative
 * **+Acc** = Ackusative
 * **+Gen** = Genitive
 * **+Ine** = Inesive
 * **+Ela** = Elative
 * **+Ill**= Illative
 * **+Com**= Comitative
 * **+Ess** = Essive


## Px
 * **+PxSg1** =  Possessives Singular
 * **+PxSg2** =  Possessives Singular
 * **+PxSg3** =  Possessives Singular
 * **+PxDu1** =  Possessives Dual
 * **+PxDu2** =  Possessives Dual
 * **+PxDu3** =  Possessives Dual
 * **+PxPl1** =  Possessives Plural
 * **+PxPl2** =  Possessives Plural
 * **+PxPl3** =  Possessives Plural

|  **+Prs** | Presens
|  **+Prt** | Preteritum

|  **+Sg1** | Singular, 1.person
|  **+Sg2** | Singular, 2.person
|  **+Sg3** | Singular, 3.person
|  **+Du1** | Dual    , 1.person
|  **+Du2** | Dual    , 2.person
|  **+Du3** | Dual    , 3.person
|  **+Pl1** | Plural  , 1.person
|  **+Pl2** | Plural  , 2.person
|  **+Pl3** | Plural  , 3.person

|  +Neg | negation verb ij
|  +ConNeg | main verb complement to Neg, form identical to Imp
|  +VAbess | Verb Abessive

* **+Inf**:  Infinitive and participles
* **+PrfPrc**:   Infinitive and participles
* **+PrsPrc**:  Infinitive and participles
* **+Ger**:  Gerundium
* **+VGen**:  Verbgenitive

* **+Ind**:  Indicative
* **+Imprt**:  Imperative
* **+ImprtII : Imperative, for Neg**:  ollem ollh ...
* **+Cond : Kondisjonalis, for one form**:  lidtjie.
            To be looked at.+ lidtjim, + lidtjih
* **+Act**:  *-eme*, could be changed to `+Actio`

### Tags for adjectives

* **+Comp +Superl**:  Comparation
* **+Attr**:  Attribute form
* **+Ord**:  Ordinal number

## Other tags
* **+ABBR**:  Abbreviation
* **+Symbol**:  Symbols in the text stream, like £, €, ©
* **+ACR**:  Acronym
* **+TV**:  Transitive verb
* **+IV**:  Intansitive verb
* **+Gram/TAbbr**:  Transitive abbreviation (it needs an argument)
* **+Gram/TNumAbbr**:  Transitive abbreviation if the following
            constituent is numeric
* **+Gram/TIAbbr**:  Both transitive and intransitive abbreviation
* **+Gram/IAbbr**:  Intransitive abbreviation (it takes no argument)
* **+Gram/NumNoAbbr**:  Transitive abbreviations for which numerals
* **+Multi**:  Multiword phrase tag ?
* **+Guess**:  for the name guesser ?
* **+LOAN**:  ad hoc tag for development purposes ?
* **+Cmp/Hyph**:  A tag to indicate that a hyphen was used when
            compounding?

### Tags for testing the frequency of certain phenomenas in our corpora

* **+Test/LysI**:  form uses i
* **+Test/MørkI**:  form uses ï
* **+Test/HK**:  form uses consonant cluster hk
* **+Test/GK**:  form uses consonant cluster gk
* **+Test/JK**:  form uses consonant cluster jk
* **+Uml**:  A tag to indicate realised or potential Umlaut
* **+NoUml**:  A tag to indicate the lack of realised or potential Umlaut

### Tags for punctuation

* **+CLB**:  XXX These should be documented better
* **+PUNCT**:  XXX These should be documented better
* **+LEFT**:  XXX These should be documented better
* **+RIGHT**:  XXX These should be documented better
 * **+CLBfinal**  Sentence final abbreviated expression ending in full stop, so that the full stop is ambiguous


### Different focus particles

* **+Foc**:  XXX Document better = Forsterkende particle?
* **+Foc/ge**:  XXX Document better = Forsterkende particle
* **+Foc/gan**:  XXX Document better = Forsterkende particle
* **+Foc/gih**:  XXX Document better = Forsterkende particle
* **+Foc/gænnah**:  XXX Document better = Forsterkende particle


## Semantic tags to help disambiguation & synt. analysis:

 *  +Sem/Act                    = Activity
 *  +Sem/Adr                    = Webadr
 *  +Sem/Amount                 = mengde eks penger og tall
 *  +Sem/Ani                    = 
 *  +Sem/Ani-fish               = fisk
 *  +Sem/Aniprod                = Animal Product
 *  +Sem/Body                   = Bodypart
 *  +Sem/Body-abstr             = sjel, ånd, jierbmi
 *  +Sem/Build                  = Building
 *  +Sem/Build-room             = room in a building, typically place to be
 *  +Sem/Buildpart              = Part of Bulding, like the closet
 *  +Sem/Cat                    = Category
 *  +Sem/Clth                   = Clothes
 *  +Sem/Clth-jewl              = Jewelery
 *  +Sem/Clthpart               = part of clothes, knapp, søm
 *  +Sem/Ctain                  = Container
 *  +Sem/Ctain-abstr            = Abstract container like bank account
 *  +Sem/Ctain-clth             = 
 *  +Sem/Curr                   = Currency like dollar, Not Money
 *  +Sem/Dance                  = Dance
 *  +Sem/Date                   = 
 *  +Sem/Dir                    = Direction like GPS-kursa
 *  +Sem/Domain                 = 
 *  +Sem/Drink                  = 
 *  +Sem/Dummytag               = 
 *  +Sem/Edu                    = 
 *  +Sem/Event                  = 
 *  +Sem/Feat                   = 
 *  +Sem/Feat-measr             = 
 *  +Sem/Feat-phys              = 
 *  +Sem/Feat-psych             = 
 *  +Sem/Fem                    = 
 *  +Sem/Food                   = mat, krydder
 *  +Sem/Food-med               = medisin eks: hodetabelett
 *  +Sem/Fruit                  = frukt,bær, salat
 *  +Sem/Furn                   = møbler
 *  +Sem/Group                  = 
 *  +Sem/Hum                    = mennesker
 *  +Sem/ID                     = 
 *  +Sem/Ideol                  = 
 *  +Sem/Lang                   = språk
 *  +Sem/Mal                    = 
 *  +Sem/Mat                    = material eks: mineral, nikkel,plast, kalvskinn
 *  +Sem/Measr                  = måttenhet ek cm,km, m minutter etc
 *  +Sem/Money                  = penger,depositum, gevinst, stipend
 *  +Sem/Obj                    = 
 *  +Sem/Obj-clo                = handduk, flagg, pledd, 
 *  +Sem/Obj-el                 = 
 *  +Sem/Obj-ling               = kort,biletter
 *  +Sem/Obj-play               = ball eks:vollyball,fotball, snøball
 *  +Sem/Obj-rope               = 
 *  +Sem/Obj-surfc              = 
 *  +Sem/Org                    = organisasjon, sammansluttning
 *  +Sem/Part                   = 
 *  +Sem/Perc-emo               = 
 *  +Sem/Perc-phys              = 
 *  +Sem/Plant                  = 
 *  +Sem/Plantpart              = 
 *  +Sem/Plc                    = 
 *  +Sem/Plc-abstr              = 
 *  +Sem/Plc-elevate            = 
 *  +Sem/Plc-line               = 
 *  +Sem/Plc-water              = 
 *  +Sem/Pos                    = 
 *  +Sem/Process                = 
 *  +Sem/Prod                   = 
 *  +Sem/Prod-audio             = 
 *  +Sem/Prod-cogn              = 
 *  +Sem/Prod-ling              = 
 *  +Sem/Prod-vis               = 
 *  +Sem/Route                  = 
 *  +Sem/Rule                   = 
 *  +Sem/Semcon                 = 
 *  +Sem/Sign                   = 
 *  +Sem/State                  = 
 *  +Sem/State-sick             = 
 *  +Sem/Substnc                = 
 *  +Sem/Sur                    = 
 *  +Sem/Time                   = 
 *  +Sem/Time-clock             = 
 *  +Sem/Tool                   = 
 *  +Sem/Tool-catch             = 
 *  +Sem/Tool-clean             = 
 *  +Sem/Tool-it                = 
 *  +Sem/Tool-music             = 
 *  +Sem/Tool-write             = 
 *  +Sem/Txt                    = tekst
 *  +Sem/Veh                    = 
 *  +Sem/Wpn                    = 
 *  +Sem/Wthr                   = 
 *  +Sem/Year                   = year (i.e. 1000 - 2999), used only for numerals


Multiple Semantic tags

 *  +Sem/Act_Domain             = 
 *  +Sem/Act_Fruit              = frukt og handling
 *  +Sem/Act_Plc                = handling og plass
 *  +Sem/Act_Route              = handling og vei
 *  +Sem/Act_Event              = Hendelse
 *  +Sem/Act_Tool-it            = hendelse og it verktøy
 *  +Sem/Ani_Body-abstr_Hum     = dyrekropp, abstrakt begrep på mennesker, menneske
 *  +Sem/Ani_Buildpart          = dyr og bygningsdel
 *  +Sem/Ani_Group              = gruppe med dyr
 *  +Sem/Ani_Group_Hum          = 
 *  +Sem/Ani_Hum                = 
 *  +Sem/Ani_Obj-el             = 
 *  +Sem/Ani_Plc_Txt            = 
 *  +Sem/Ani_Time               = 
 *  +Sem/Ani_Tool               = 
 *  +Sem/Ani_Veh                = dyr + kjöretöy eks hest
 *  +Sem/Aniprod_Hum            = 
 *  +Sem/Aniprod_Plc_Route      = 
 *  +Sem/Body_Food              = 
 *  +Sem/Body_Hum               = kroppsdeler, mennesker
 *  +Sem/Body_Mat               = kroppsdeler og dudtjie matriell
 *  +Sem/Body_Measr             = 
 *  +Sem/Body_Obj_Tool-catch    = 
 *  +Sem/Body_Plc               = 
 *  +Sem/Body_Plc-elevate       = 
 *  +Sem/Buildpart_Ctain_Obj    = 
 *  +Sem/Build_Clthpart         = 
 *  +Sem/Build_Edu_Org          = 
 *  +Sem/Build_Org              = 
 *  +Sem/Cat_Group_Hum_Plc      = 
 *  +Sem/Clth-jewl_Curr         = 
 *  +Sem/Clth-jewl_Curr_Obj     = 
 *  +Sem/Ctain-abstr_Org        = 
 *  +Sem/Ctain-clth_Plant       = 
 *  +Sem/Ctain-clth_Veh         = 
 *  +Sem/Ctain_Furn             = 
 *  +Sem/Ctain_Tool             = 
 *  +Sem/Curr_Obj               = 
 *  +Sem/Domain_Hum             = 
 *  +Sem/Domain_Money           = 
 *  +Sem/Drink_Plant            = 
 *  +Sem/Edu_Event              = eks: seminar, søndagsskole
 *  +Sem/Edu_Geom               = 
 *  +Sem/Edu_Hum                = 
 *  +Sem/Edu_Mat                = utbildning og mat	
 *  +Sem/Edu_Org                = 
 *  +Sem/Event_Plc-elevate      = 
 *  +Sem/Feat-measr_Plc         = 
 *  +Sem/Feat-phys_Tool-write   = 
 *  +Sem/Feat-psych_Hum         = 
 *  +Sem/Feat-psych_Plc         = 
 *  +Sem/Feat_Plant             = 
 *  +Sem/Food_Plant             = tobakk
 *  +Sem/Furn_Time              = 
 *  +Sem/Game_Obj-play          = leker eks: snøballkastning.sekkelek
 *  +Sem/Geom_Obj               = 
 *  +Sem/Group_Hum              = 
 *  +Sem/Group_Hum_Plc          = gruppe mennesker tilsammens eks: konfirmasjonsleir
 *  +Sem/Group_Hum_Plc-abstr    = 
 *  +Sem/Hum_Lang               = human and language
 *  +Sem/Hum_Lang_Plc           = eks menneske, nord/sør, lulesamisk etc.
 *  +Sem/Hum_Mat_Tool           = 
 *  +Sem/Hum_Org                = menneske og organisasjon
 *  +Sem/Hum_Veh                = 
 *  +Sem/Hum_Tool               = 
 *  +Sem/Lang_Tool              = 
 *  +Sem/Mat_Obj-clo            = 
 *  +Sem/Mat_Plant              = material, plante eks bomull
 *  +Sem/Mat_Txt                = 
 *  +Sem/Measr_Obj_Time         = 
 *  +Sem/Measr_Sign             = 
 *  +Sem/Measr_Time             = år, mnd, uke, time, minutt
 *  +Sem/Money_Obj              = 
 *  +Sem/Obj-ling_Obj-surfc     = 
 *  +Sem/Hum_Obj                = 
 *  +Sem/Obj_State              = 
 *  +Sem/Obj_Veh                = 
 *  +Sem/Org_Plc                = 
 *  +Sem/Org_Prod-audio         = 
 *  +Sem/Org_Prod-cogn          = 
 *  +Sem/Org_Prod-vis           = 
 *  +Sem/Org_Rule               = 
 *  +Sem/Org_Txt                = 
 *  +Sem/Part_Prod-cogn         = 
 *  +Sem/Plant_Plantpart        = 
 *  +Sem/Plc-abstr_Route        = 
 *  +Sem/Plc_Pos                = 
 *  +Sem/Plc_Route              = 
 *  +Sem/Plc_Substnc            = 
 *  +Sem/Plc_Substnc_Wthr       = 
 *  +Sem/Plc_Txt                = 
 *  +Sem/Plc_Wthr               = 
 *  +Sem/Prod-audio_Txt         = 
 *  +Sem/Prod-cogn_Txt          = 
 *  +Sem/Semcon_Wthr            = 
 *  +Sem/Substnc_Wthr           = 
 *  +Sem/Time_Wthr              = 
 *  +Sem/Domain_Txt             = 


|  +MWE | multi word expressions, goes to abbr

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.

|  @P.Px.add@ | Giving possibility for Px-suffixes (all except from Nom 3.p)
|  @R.Px.add@ | Requiring P.Px.add-flag for Px-suffixes (all except from Nom 3.p)
|  @P.Nom3Px.add@ |  Giving possibility for Px-suffixes Nom 3.p
|  @R.Nom3Px.add@ | Requiring P.Nom3Px.add flag for Px-suffixes Nom 3.p

|  @P.Pmatch.Backtrack@ | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this poin in the form (to find combinations of shorter analyses that would otherwise be missed)

|  @D.ErrOrth.ON@  | asdf
|  @C.ErrOrth@	 | asdf
|  @P.ErrOrth.ON@ | asdf


## Derivation tags and derivation position tags in a derivation row

Derivations in the same position are mutually exclusive (can not be combined), whereas
tags in different positions can be combined, so that position 1 derivations must
precede position 2 derivations, and so on.


|    Pos1     | Pos2      | Pos3      | POS switches (from-to)| Explanation
| --- | --- | --- | --- | --- 
|  **+Der1** |            |            |      | Position tag, required
|  **+Der2** |            |            |      | Position tag, required
|  **+Der3** |            |            |      | Position tag, required
|  **+Der/htalle** |            |            | VV   | Passive, frekeventative
|  **+Der/lg** |            |            | VV   | Passive
|  **+Der/ijes** |            |            | NA   | Nomen agentis
|  **+Der/ihks** |            |            | VA   | (Handlernomen- tilbøyelig til å utføre den handlingen som grunnordet angir)
|  **+Der/les** |            |            | VA   | Intensive
|  **+Der/ldihkie** |            |            | VA   |
|  **+Der/ldahke** |            |            | VA   | Resultatnomen (?)
|  **+Der/ldh** |            |            | VA   | Attributt
|  **+Der/ht** |            |            | VV   | Causative
|  **+Der/l** |            |            | VV   | Subitive
|  **+Der/st** |            |            | VV   | Diminutive, Subitive
|  **+Der/d** |            |            | VV   | Continuative, Konative, Frequentative, Refleksive, Momentan
|  **+Der/Car** |            |            |      | -hts, Caritive, was Der/heapmi in sme
|  **+Der/htj** |            |            | NN   | Dim-cont, Frequentative
|  **+Der/Dimin** |            |            | NN   | Diminutive
|  **+Der/Rec** |            |            | NN   | Forholdsformer
|  **+Der/laakan** |            |            | AAdv | adverb
|  **+Der/laaketje** |            |            | AA   | adjektiv
|  **+Der/Comp** |            |            | AA   | adjektiv
|  **+Der/Superl** |            |            | AA   | adjektiv 
|             | **+Der/vuota** |            | AN   | Noun
|             | **+Der/adte** |            | VV   | Frequentative, Kontinuativ
|             | **+Der/alla** |            | VV   | Frequentative
|             | **+Der/eds** |            | NA   | Attributt
|             |            | **+Der/PassL** | VV   | long only
|             |            | **+Der/NomAg** | VN   | Nomen Agentis
|             |            | **+Der/NomAct** | VN   | Nomen Actionis
|             |            | **+Der/ahtje** | VV   | Inchoative
|             |            | **+Der/InchL** | VV   | Inchoative




### Other, non-positional derivations

All non-positional derivations should be preceded by the following tag,
to make it possible to target regular expressions in all derivations in a
language-independent way:
just specify
```[+Der](+Der1 .. +Der5)```
and you are set.
* **+Der**:  Tag to precede any non-positional derivation

|   Derivation tag | POS switch | Explanation
| --- | --- | --- 
|  +Der/PassS | VV | short passive only
|  +Der/A | NA | comparation of N's


## Tags for originating language

The following tags are used to guide conversion to IPA: loan words
and foreign names are usually pronounced (approximately) as in the
originating (majority) language. Instead of trying to identify the
correct pronunciation based on phonotactics (orthotactics actually),
we tag all words that can't be correctly transcribed using the SME
transcriber with source language codes. Once tagged, it is possible
to split the lexical transducer in smaller ones according to langu-
age, and apply different IPA conversion to each of them.
The principle of tagging is that we only tag to the extent needed,
and following a priority:
# any untagged word is pronounced with SME orthographic conventions
# NNO and NOB have identical pronunciation, NNO is only used if
  different in spelling from NOB
# SWE has mostly the same pronunciation as NOB, and is only used
  if different in spelling from NOB
# Occasionally even SME (the default) may be tagged, to block other
  languages from being specified, mainly during semi-automatic
  language tagging sessions
All in all, we want to get as much correctly transcribed to IPA
with as little work as possible. On the other hand, if more words
are tagged than strictly needed, this should pose no problem as
long as the IPA conversion is correct - at least some words will
get the same pronunciation whether read as SME or NOB/NNO/SWE.

|   Originating language tag | Originating language
| --- | --- 
|  **+OLang/SME** | North Sámi
|  **+OLang/SMA** | South Sámi
|  **+OLang/FIN** | Finnish
|  **+OLang/SWE** | Swedish
|  **+OLang/NOB** | Norw. bokmål
|  **+OLang/NNO** | Norw. nynorsk
|  **+OLang/ENG** | English
|  **+OLang/RUS** | Russian
|  **+OLang/UND** | Undefined

## Area tags

 * +Area/SE = In Sweden
 * +Area/NO = In Norway


## Triggers for morphophonological rules
* **X2 : Trigger for e:0 before suffix i**:  manne > mannine
* **X3**:  Trigger for e->i in even syllabic verbs Du3
* **X4**:  Trigger for e->i in even syllabic verbs Du2 & Pl12
* **E2**:  insert e ! Fjern denne.

### Morphophonemes and Sámi letters

 * e9  twol rule override, so that e doesn't turn into i infront of j
 * o9  twol rule override,  so that o doesn't turn into u infront of j

## Symbols that need to be escaped on the lower side (towards twolc):
* **»7**:  Literal »
* **«7**:  Literal «
```
  %[%>%]  - Literal >
  %[%<%]  - Literal <
```
## Lexeme disambiguation tags
* **+Hom1**:  Homonymy
* **+Hom2**:  Homonymy

## Stem variant tags
* **+v1**:  variant 1
* **+v2**:  variant 2
* **+v3**:  variant 3
* **+v4**:  variant 4
* **+v5**:  variant 5
* **+v6**:  variant 6
* **+v7**:  variant 7


clitic boundary mark - a multichar that usually just go to zero

## Umlaut and diphthong simplification triggers

|  %^DISIMP | diphthong simplification
|  %^COMPDISIMP | diphthong simplification in comparatives
|  %^COMPDISIMP2 | diphthong simplification in comparatives, type 2
|  %^COMPDISIMP3 | diphthong simplification
|  %^PLCDISIMP | diphthong simplification in ACCRA-names
|  %^NOMAGieDISIMP | diphthong simplification for NomAg ie stems
|  %^1UML | a-uml, like 1sg prs, perf.part of båetedh/V-I, and ill sg of -ie nouns
|  %^2UML | dark e, as 3sg prs & perf.part of tjearodh/V-II, and ill sg of -oe nouns
|  %^3UML | adj Umlaut oeh:an
|  %^3sUML | a-uml in 3sg prs of V-IV (roehtedh - ruahta)
|  %^3dUML | ie-uml in 1du & 3pl prs of V-IV (roehtedh - ruehtien)
|  %^iæUML | not used
|  %^iUML | i-uml in pret of V-I (båetedh - böötim)
|  %^PASSUML | Short passive Umlaut Rx->R5
|  %^didhUML | Der/d Umlaut for GUARKEDH-words
|  %^htjidhUML | Umlaut für der/htjidh derivations
|  %^adteUML | Umlaut für Der/adte and Der/alla derivations
|  %^aLATUS | Latus-Umlaut for -ie stems
|  %^uLATUS | Latus-Umlaut for -oe stems
|  %^ConsDel | Stem consonant deletion in front of Der/PassL
|  %^ILLELA | Stem vowel changes in Illative an Elative
|  %^PLGENPLCOM | Stem vowel changes in final from e -> i, and withoaut -j-
|  %^COMESS | Stem vowel changes in ACCRA-names

|  ∑ | Symbol used before # in dynamic compounds, and only there



## Flag diacritics
We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:
|  @P.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
|  @D.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
|  @C.NeedNoun@ | (Dis)allow compounds with verbs unless nominalised
For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.
|  @P.CmpFrst.FALSE@ | Require that words tagged as such only appear first
|  @D.CmpPref.TRUE@ | Block such words from entering ENDLEX
|  @P.CmpPref.FALSE@ | Block these words from making further compounds
|  @D.CmpLast.TRUE@ | Block such words from entering R
|  @D.CmpNone.TRUE@ | Combines with the next tag to prohibit compounding
|  @U.CmpNone.FALSE@ | Combines with the prev tag to prohibit compounding
|  @U.CmpNone.TRUE@ | Combines with the two previous ones to block compounding
|  @P.CmpOnly.TRUE@ | Sets a flag to indicate that the word has passed R
|  @D.CmpOnly.FALSE@ | Disallow words coming directly from root.
|  @U.CmpHyph.FALSE@ | Flag to control hyphenated compounds like proper nouns
|  @U.CmpHyph.TRUE@ | Flag to control hyphenated compounds like proper nouns
|  @C.CmpHyph@ | Flag to control hyphenated compounds like proper nouns

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.
|  @U.Cap.Obl@ | Allowing downcasing of derived names: deatnulasj.
|  @U.Cap.Opt@ | Allowing downcasing of derived names: deatnulasj.

 * @R.SpellRlx.ON@ Flag used to tag spell-relax-analysed strings (and only those).
 * @D.SpellRlx.ON@ Flag used to tag spell-relax-analysed strings (and only those).
 * @C.SpellRlx@ Flag used to tag spell-relax-analysed strings (and only those).

|  @P.Pmatch.Loc@ | Used on multi-token analyses; tell hfst-tokenise/pmatch where in the form/analysis the token should be split.
|  @P.Pmatch.Backtrack@ | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)


# Lexicon Root
This is the beginning of everything. The **Root** lexicon is reserved in the
LexC language, and must be the first lexicon defined.

Here is the list of lexica in the sma analyser








 *              NounRoot     ; 
 *              Verb         ; 
 *              Adjective    ; 
 *              Pronoun      ; 
 *              Adverb       ; 
 *              Subjunction  ; 
 *              Conjunction  ; 
 *              Particle     ; 
 *              Adposition   ; 
 *              Punctuation  ; 
 *              Symbols      ; 
 *              Interjection ; 
 *  +Use/CircN: Numeral      ; 
 *              Abbreviation ; 
 *              Acronym      ; 




 * **LEXICON ProperNoun**


# Lexicon ENDLEX
And this is the ENDLEX of everything:
```
 @D.CmpOnly.FALSE@@D.CmpPref.TRUE@@D.NeedNoun.ON@ ENDLEX2 ;
```
The `@D.CmpOnly.FALSE@` flag diacritic is ued to disallow words tagged
with +CmpNP/Only to end here.
The `@D.NeedNoun.ON@` flag diacritic is used to block illegal compounds.


# South Sámi morphophonological rule set                   






















# Rules


**e deletion before i-initial suffix**  


* *manneX2ine*
* *mann00ine*


**Diphthong simplification ie:e**  



* *dåeried%>%^DISIMPem*
* *dåer0ed%>0em*

* ★*dåeried%>%^DISIMPem* (is not standard language)
* ★*dåeried%>0em* (is not standard language)

* *gieriehtse%>%^DISIMPm*
* *gier0ehtse%>0m*

* ★*gieriehtse%>%^DISIMPm* (is not standard language)
* ★*gieriehtse%>0m* (is not standard language)

* *gijmie%>%^COMPDISIMPbe*
* *gijm0e%>0be*

* ★*gijmie%>%^COMPDISIMPbe* (is not standard language)
* ★*gijmie%>0be* (is not standard language)





**Diphthong simplification oe:o**  



* *daaroest%>%^DISIMPem*
* *daaro0st%>0em*

* ★*daaroest%>%^DISIMPem* (is not standard language)
* ★*daaroest%>0em* (is not standard language)

* *gaaloehke%>%^DISIMPm*
* *gaalo0hke%>0m*

* ★*gaaloehke%>%^DISIMPm* (is not standard language)
* ★*gaaloehke%>0m* (is not standard language)




* *jearkoe%>%^COMPDISIMPbe*
* *jeark0e%>0be*

* ★*jearkoe%>%^COMPDISIMPbe* (is not standard language)
* ★*jearkoe%>0be* (is not standard language)



**a/e alternation**  



* *aatskad%>%^DISIMPem*
* *aatsked%>0em*

* ★*aatskad%>%^DISIMPem* (is not standard language)
* ★*aatskad%>0em* (is not standard language)

* *daktare%>%^DISIMPm*
* *daktere%>0m*

* ★*daktare%>%^DISIMPm* (is not standard language)
* ★*daktare%>0m* (is not standard language)


* *gæhtja%>%^COMPDISIMPbe*
* *gæhtje%>0be*

* ★*gæhtja%>%^COMPDISIMPbe* (is not standard language)
* ★*gæhtja%>0be* (is not standard language)












**a/i alternation**  



* *jåhtaj%^DISIMP%>em*
* *jåhtij0%>em*

* ★*jåhtaj%^DISIMP%>em* (is not standard language)
* ★*jåhtaj0%>em* (is not standard language)

**a/0 alternation**  








**Even syllabic verbs Du3 e/i alternation V**  

**Proper PlGen, PlCom**  



**Even syllabic verbs Du2, Du3, Pl1, Pl2 e/i class V**  


* *vååjn>eX4jibie*
* *vååjn>i0jibie*

* ★*vååjn>eX4jibie* (is not standard language)
* ★*vååjn>e0jibie* (is not standard language)

* *vååjn>eX3jægan*
* *vååjn>i0jægan*

* ★*vååjn>eX3jægan* (is not standard language)
* ★*vååjn>e0jægan* (is not standard language)

* *juht»ieje%>%^NOMAGieDISIMPm*
* *juht»i0je%>0m*

* ★*juht»ieje%>%^NOMAGieDISIMPm* (is not standard language)
* ★*juht»ieje%>0m* (is not standard language)






















* *kliht%^aLATUS%»tje%^DISIMP*
* *klæhte»tje0*

* *kliht%^aLATUS%»tj%>asse*
* *klæhta»tj%>asse*

* *jepts%^aLATUS%»tje%^DISIMP*
* *japtse»tje0*

* *jepts%^aLATUS%»tj%>asse*
* *japtsa»tj%>asse*

* *gull%^aLATUS%»tje%^DISIMP*
* *gålle»tje0*

* *gull%^aLATUS%»tj%>asse*
* *gålla»tj%>asse*

* *biss%>%^1UMLam*
* *bæss%>0am*

* *belt%>%^1UMLam*
* *balt%>0am*

* *buhtj%>%^1UMLa*
* *båhtj%>0a*

* *paek%>%^1UMLa*
* *paak%>0a*

* *bået%>%^1UMLa*
* *båat%>0a*

* *buel%>%^1UMLa*
* *bual%>0a*

* *kliht%>%^1UMLan*
* *klæht%>0an*

* *jepts%>%^1UMLan*
* *japts%>0an*

* *gull%>%^1UMLan*
* *gåll%>0an*

* *gaevl%>%^1UMLan*
* *gaavl%>0an*

* *gået%>%^1UMLan*
* *gåat%>0an*

* *njuesl%>%^1UMLan*
* *njuasl%>0an*




* *jieht%>%^1UMLa*
* *jeaht%>0a*

* ★*jieht%>%^1UMLa* (is not standard language)
* ★*jieht%>0a* (is not standard language)

* *sjiell%>%^1UMLan*
* *sjeall%>0an*


* *gået^aLATUS»tje^DISIMP*
* *gåate»tje0*


* *gælj%>%^2UMLe*
* *gylj%>0e*

* *færhtje%>%^2UMLse*
* *fyrhtje%>0se*

* *hahtje%>%^2UMLse*
* *hohtje%>0se*

* *rånhtje%>%^2UMLse*
* *ronhtje%>0se*

* ★*færhtje%>%^2UMLse* (is not standard language)
* ★*færhtje%>0se* (is not standard language)

* ★*hahtje%>%^2UMLse* (is not standard language)
* ★*hahtje%>0se* (is not standard language)

* ★*rånhtje%>%^2UMLse* (is not standard language)
* ★*rånhtje%>0se* (is not standard language)








* *tjear%>%^2UMLe*
* *tjyör%>0e*

* ★*tjear%>%^2UMLe* (is not standard language)
* ★*tjear%>0e* (is not standard language)

* *bearke%>%^2UMLse*
* *byörke%>0se*

* ★*bearke%>%^2UMLse* (is not standard language)
* ★*bearke%>0se* (is not standard language)

* *mearhtje%>%^2UMLse*
* *myörhtje%>0se*

* ★*mearhtje%>%^2UMLse* (is not standard language)
* ★*mearhtje%>0se* (is not standard language)



* *haare%>%^2UMLse*
* *hååre%>0se*

* ★*haare%>%^2UMLse* (is not standard language)
* ★*haare%>0se* (is not standard language)

* *råafe%>%^2UMLse*
* *rååfe%>0se*

* ★*råafe%>%^2UMLse* (is not standard language)
* ★*råafe%>0se* (is not standard language)




* *mïnn%>%^3sUMLa*
* *mænn%>0a*

* *jovk%>%^3sUMLa*
* *jåvk%>0a*





* *tjïel%>%^3sUMLa*
* *tjeal%>0a*

* *roeht%>%^3sUMLa*
* *ruaht%>0a*



* *mïnn%>%^3dUMLien*
* *minn%>0ien*

* *bark%>%^3dUMLien*
* *berk%>0ien*

* *jovk%>%^3dUMLien*
* *juvk%>0ien*


* *tjïek%>%^3dUMLien*
* *tjiek%>0ien*

* *dïjveld»ovv%^3dUMLieh*
* *dïjveld»uvv0ieh*

* ★*dïjveld%»ovv%^3dUMLieh* (is not standard language)
* ★*dïjveld»ovv0ieh* (is not standard language)









* *jieht%>%^iUMLim*
* *jeeht%>0im*

* *tjael%>%^iUMLim*
* *tjeel%>0im*




* *bået%>%^iUMLim*
* *bööt%>0im*

* *vuejn%>%^iUMLim*
* *vööjn%>0im*







* *maan%^aLATUS%»tje%^DISIMP*
* *maane»tje0*

* ★*maan%^aLATUS%»tje%^DISIMP* (is not standard language)
* ★*maana»tje0* (is not standard language)

* *maan%^aLATUS%»tj%>asse*
* *maana»tj%>asse*

* ★*maan%^aLATUS%»tj%>asse* (is not standard language)
* ★*maane»tj%>asse* (is not standard language)



* *biss»%^PASSUMLedh*
* *byss»0edh*

* *sïrr»%^PASSUMLedh*
* *syrr»0edh*

* ★*sïrr»%^PASSUMLedh* (is not standard language)
* ★*sïrr»0edh* (is not standard language)


* *gælj»%^PASSUMLedh*
* *gylj»0edh*

* ★*gælj»%^PASSUMLedh* (is not standard language)
* ★*gælj»0edh* (is not standard language)



* *best»%^PASSUMLedh*
* *bost»0edh*

* ★*best»%^PASSUMLedh* (is not standard language)
* ★*best»0edh* (is not standard language)

* *darj»%^PASSUMLedh*
* *dorj»0edh*

* ★*darj»%^PASSUMLedh* (is not standard language)
* ★*darj»0edh* (is not standard language)



* *juht»%^PASSUMLedh*
* *joht»0edh*

* ★*juht»%^PASSUMLedh* (is not standard language)
* ★*juht»0edh* (is not standard language)

* *gåhp»%^PASSUMLedh*
* *gohp»0edh*

* ★*gåhp»%^PASSUMLedh* (is not standard language)
* ★*gåhp»0edh* (is not standard language)

* *govl»%^PASSUMLedh*
* *govl»0edh*




* *viedt»%^PASSUMLedh*
* *vyödt»0edh*

* ★*viedt»%^PASSUMLedh* (is not standard language)
* ★*viedt»0edh* (is not standard language)

* *tjear»%^PASSUMLedh*
* *tjyör»0edh*

* ★*tjear»%^PASSUMLedh* (is not standard language)
* ★*tjear»0edh* (is not standard language)

* *bïepm»%^PASSUMLedh*
* *byöpm»0edh*

* ★*bïepm»%^PASSUMLedh* (is not standard language)
* ★*bïepm»0edh* (is not standard language)


* *daejr»%^PASSUMLedh*
* *dååjr»0edh*

* *gaat»%^PASSUMLedh*
* *gååt»0edh*


* *gaat»%^PASSUMLedh*
* *gååt»0edh*

* *åest»%^PASSUMLedh*
* *ååst»0edh*


* *vuejn»%^PASSUMLedh*
* *vååjn»0edh*

* *guark»%^PASSUMLedh*
* *gåårk»0edh*

* *våaj»%^PASSUMLedh*
* *vååj»0edh*

* *voessj»%^PASSUMLedh*
* *vååssj»0edh*



* *buel»%^htjidhUMLehtjidh*
* *boel»0ehtjidh*

* ★*buel»%^htjidhUMLehtjidh* (is not standard language)
* ★*buel»0ehtjidh* (is not standard language)


* *paek»%^htjidhUMLehtjidh*
* *paak»0ehtjidh*

* ★*paek»%^htjidhUMLehtjidh* (is not standard language)
* ★*paek»0ehtjidh* (is not standard language)







* *veaj»%^didhUMLedidh*
* *vïej»0edidh*

* ★*veaj»%^didhUMLedidh* (is not standard language)
* ★*veaj»0edidh* (is not standard language)

* *guark»%^didhUMLedidh*
* *goerk»0edidh*

* ★*guark»%^didhUMLedidh* (is not standard language)
* ★*guark»0edidh* (is not standard language)


* *skælk»%^didhUMLedidh*
* *skïlk»0edidh*

* ★*skælk»%^didhUMLedidh* (is not standard language)
* ★*skælk»0edidh* (is not standard language)

* *plåtjk»%^didhUMLedidh*
* *plotjk»0edidh*

* ★*plåtjk»%^didhUMLedidh* (is not standard language)
* ★*plåtjk»0edidh* (is not standard language)





* *bået»iest»%^adteUMLalledh*
* *båat»0ast»0alledh*

* ★*bået»iest»%^adteUMLalledh* (is not standard language)
* ★*bået»0ast»0alledh* (is not standard language)

* ★*bået»iest»%^adteUMLalledh* (is not standard language)
* ★*båat»iest»0alledh* (is not standard language)


* *tjear»oel»%^adteUMLadtedh*
* *tjyör»0el»0adtedh*

* ★*tjear»oel»%^adteUMLadtedh* (is not standard language)
* ★*tjear»0el»0adtedh* (is not standard language)

* ★*tjear»oel»%^adteUMLadtedh* (is not standard language)
* ★*tjyör»oel»0adtedh* (is not standard language)





* *dåeriedi%>dh*
* *dåeriedi%>dh*

* *bisse%>dh*
* *bisse%>dh*

* *belte%>dh*
* *belte%>dh*

* *buhtje%>dh*
* *buhtje%>dh*

* *paeke%>dh*
* *paeke%>dh*

* *båete%>dh*
* *båete%>dh*

* *buele%>dh*
* *buele%>dh*

* *æbjo%>dh*
* *æbjo%>dh*

* *hajko%>dh*
* *hajko%>dh*

* *gåhpo%>dh*
* *gåhpo%>dh*

* *tjearo%>dh*
* *tjearo%>dh*

* *baajsko%>dh*
* *baajsko%>dh*

* *gåaro%>dh*
* *gåaro%>dh*

* *skælke%>dh*
* *skælke%>dh*

* *skajke%>dh*
* *skajke%>dh*

* *plåtjke%>dh*
* *plåtjke%>dh*

* *sleapke%>dh*
* *sleapke%>dh*

* *snjåarke%>dh*
* *snjåarke%>dh*

* *sïrre%>dh*
* *sïrre%>dh*

* *sarje%>dh*
* *sarje%>dh*

* *sodte%>dh*
* *sodte%>dh*

* *skïerke%>dh*
* *skïerke%>dh*

* *slaapke%>dh*
* *slaapke%>dh*

* *snjåare%>dh*
* *snjåare%>dh*

* *tjoehpe%>dh*
* *tjoehpe%>dh*

* *skylle%>dh*
* *skylle%>dh*

* *aalhteroste%>dh*
* *aalhteroste%>dh*

* *skyöre%>dh*
* *skyöre%>dh*

* *vååjne%>dh*
* *vååjne%>dh*

* *skilhte%>dh*
* *skilhte%>dh*

* *sijle%>dh*
* *sijle%>dh*

* *snjurme%>dh*
* *snjurme%>dh*

* *snjeere%>dh*
* *snjeere%>dh*

* *gööle%>dh*
* *gööle%>dh*



Spesialregel for 'soptsesovvedh' < soptsestidh.
Ingen andre verb har st > s framfor passivderivasjon.

* *soptsest»ovvedh*
* *soptses0»ovvedh*



* *laajhna#aaltoe*
* *laajhna-aaltoe*

* *aerpie#eeke*
* *aerpie-eeke*

* ★*laajhna#aaltoe* (is not standard language)
* ★*laajhna#aaltoe* (is not standard language)

* ★*aerpie#eeke* (is not standard language)
* ★*aerpie#eeke* (is not standard language)







* *Aevjie#aesie*
* *Aevjie#aesie*

* ★*Aevjie#aesiede* (is not standard language)
* ★*Aevjie-eesi0de* (is not standard language)



# Nominal inflection sublexica

## Inflection for odd-syllable nouns



The basic odd-syll lexicon is: N_ODD_INFL

### Inflection for odd-syllable nouns: lexicon N_ODD_INFL
Short descrioption of this lexicon, and its purpose.


*gierehtse # Odd-syllable test examples:*
* *gierehtse:* `gierehtse+N+Sg+Nom`
* *gierehtsen:* `gierehtse+N+Sg+Gen`
* *gierehtsem:* `gierehtse+N+Sg+Acc`
* *gieriehtsasse:* `gierehtse+N+Sg+Ill`
* *gieriehtsisnie:* `gierehtse+N+Sg+Ine`
* *gieriehtsistie:* `gierehtse+N+Sg+Ela`
* *gieriehtsinie:* `gierehtse+N+Sg+Com`
* *gierehtsh:* `gierehtse+N+Pl+Nom`
* *gieriehtsidie:* `gierehtse+N+Pl+Acc`
* *gierehtsi:* `gierehtse+N+Pl+Gen`
* *gieriehtsidie:* `gierehtse+N+Pl+Ill`
* *gieriehtsinie:* `gierehtse+N+Pl+Ine`
* *gieriehtsijstie:* `gierehtse+N+Pl+Ela`
* *gierehtsigujmie:* `gierehtse+N+Pl+Com`
* *gieriehtsinie:* `gierehtse+N+Ess`


* Odd-syll loanwords: lexicon N_ODD_MEETERE


* Odd-syll loanwords on -ihtele, such as kapihtele: lexicon IHTELE

* Odd-syll loanwords: lexicon N_ODD_LOAN


** Odd-syll sg: lexicon N_ODD_SG

** Odd-syll pl: lexicon N_ODD_PL

** Odd-syll loanwords: lexicon N_ODD_ESS

** Default N_ODD plural lexicon: lexicon ÅABPETJH


LEXICON TJE_LASSJE_RESIPR


















*beetnege # Odd-syllable test examples:*
* *beetnege:* `beetnege+N+Sg+Nom`
* *beetneh:* `beetnege+N+Sg+Nom`
* *beetnegen:* `beetnege+N+Sg+Gen`
* *beetnegasse:* `beetnege+N+Sg+Ill`
* *beetnegisnie:* `beetnege+N+Sg+Ine`
* *beetnegistie:* `beetnege+N+Sg+Ela`
* *beetneginie:* `beetnege+N+Sg+Com`
* *beetnegh:* `beetnege+N+Pl+Nom`
* *beetnegidie:* `beetnege+N+Pl+Acc`
* *beetnegi:* `beetnege+N+Pl+Gen`
* *beetnegidie:* `beetnege+N+Pl+Ill`
* *beetneginie:* `beetnege+N+Pl+Ine`
* *beetnegijstie:* `beetnege+N+Pl+Ela`
* *beetnegigujmie:* `beetnege+N+Pl+Com`
* *beetneginie:* `beetnege+N+Ess`



















*åeruve # Odd-syllable test examples:*
* *åeruve:* `åeruve+N+Sg+Nom`
* *åeruven:* `åeruve+N+Sg+Gen`
* *åeruvem:* `åeruve+N+Sg+Acc`
* *åerievasse:* `åeruve+N+Sg+Ill`
* *åerievisnie:* `åeruve+N+Sg+Ine`
* *åerievistie:* `åeruve+N+Sg+Ela`
* *åerievinie:* `åeruve+N+Sg+Com`
* *åeruvh:* `åeruve+N+Pl+Nom`
* *åerievidie:* `åeruve+N+Pl+Acc`
* *åeruvi:* `åeruve+N+Pl+Gen`
* *åerievidie:* `åeruve+N+Pl+Ill`
* *åerievinie:* `åeruve+N+Pl+Ine`
* *åerievijstie:* `åeruve+N+Pl+Ela`
* *åeruvigujmie:* `åeruve+N+Pl+Com`
* *åerievinie:* `åeruve+N+Ess`
* *åerievadtje:* `åeruve+N+Der/Dimin+N+Sg+Nom`
* *åerievadtjen:* `åeruve+N+Der/Dimin+N+Sg+Gen`
* *åerievadtjem:* `åeruve+N+Der/Dimin+N+Sg+Acc`
* *åerievadtjese:* `åeruve+N+Der/Dimin+N+Sg+Ill`
* *åerievadtjesne:* `åeruve+N+Der/Dimin+N+Sg+Ine`
* *åerievadtjeste:* `åeruve+N+Der/Dimin+N+Sg+Ela`
* *åerievadtjine:* `åeruve+N+Der/Dimin+N+Sg+Com`
* *åerievadtjine:* `åeruve+N+Der/Dimin+N+Ess`
* *åerievadtjh:* `åeruve+N+Der/Dimin+N+Pl+Nom`
* *åerievadtji:* `åeruve+N+Der/Dimin+N+Pl+Gen`
* *åerievadtjide:* `åeruve+N+Der/Dimin+N+Pl+Acc`
* *åerievadtjide:* `åeruve+N+Der/Dimin+N+Pl+Ill`
* *åerievadtjine:* `åeruve+N+Der/Dimin+N+Pl+Ine`
* *åerievadtjijste:* `åeruve+N+Der/Dimin+N+Pl+Ela`
* *åerievadtjigujmie:* `åeruve+N+Der/Dimin+N+Pl+Com`
* *åerievadtjine:* `åeruve+N+Der/Dimin+N+Ess`






























*seerije # ODD-syllable test examples:*
* *seerije:* `seerije+N+Sg+Nom`
* *seerijem:* `seerije+N+Sg+Acc`
* *seerijen:* `seerije+N+Sg+Gen`
* *seerijasse:* `seerije+N+Sg+Ill`
* *seerijisnie:* `seerije+N+Sg+Ine`
* *seerijistie:* `seerije+N+Sg+Ela`







*daktere # Odd-syllable test examples:*
* *daktere:* `daktere+N+Sg+Nom`
* *dakteren:* `daktere+N+Sg+Gen`
* *dakterem:* `daktere+N+Sg+Acc`
* *daktarasse:* `daktere+N+Sg+Ill`
* *daktarisnie:* `daktere+N+Sg+Ine`
* *daktaristie:* `daktere+N+Sg+Ela`
* *daktarinie:* `daktere+N+Sg+Com`
* *dakterh:* `daktere+N+Pl+Nom`
* *daktaridie:* `daktere+N+Pl+Acc`
* *dakteri:* `daktere+N+Pl+Gen`
* *daktaridie:* `daktere+N+Pl+Ill`
* *daktarinie:* `daktere+N+Pl+Ine`
* *daktarijstie:* `daktere+N+Pl+Ela`
* *dakterigujmie:* `daktere+N+Pl+Com`
* *daktarinie:* `daktere+N+Ess`
* *daktaradtje:* `daktere+N+Der/Dimin+N+Sg+Nom`
* *daktaradtjen:* `daktere+N+Der/Dimin+N+Sg+Gen`
* *daktaradtjem:* `daktere+N+Der/Dimin+N+Sg+Acc`
* *daktaradtjese:* `daktere+N+Der/Dimin+N+Sg+Ill`
* *daktaradtjesne:* `daktere+N+Der/Dimin+N+Sg+Ine`
* *daktaradtjeste:* `daktere+N+Der/Dimin+N+Sg+Ela`
* *daktaradtjine:* `daktere+N+Der/Dimin+N+Sg+Com`
* *daktaradtjine:* `daktere+N+Der/Dimin+N+Ess`
* *daktaradtjh:* `daktere+N+Der/Dimin+N+Pl+Nom`
* *daktaradtji:* `daktere+N+Der/Dimin+N+Pl+Gen`
* *daktaradtjide:* `daktere+N+Der/Dimin+N+Pl+Acc`
* *daktaradtjide:* `daktere+N+Der/Dimin+N+Pl+Ill`
* *daktaradtjine:* `daktere+N+Der/Dimin+N+Pl+Ine`
* *daktaradtjijste:* `daktere+N+Der/Dimin+N+Pl+Ela`
* *daktaradtjigujmie:* `daktere+N+Der/Dimin+N+Pl+Com`
* *daktaradtjine:* `daktere+N+Der/Dimin+N+Ess`




*australijeenere # Even-syllable test examples:*
* *australijeenere:* `australijeenere+N+Sg+Nom`
* *australijeenerem:* `australijeenere+N+Sg+Acc`
* *australijeeneren:* `australijeenere+N+Sg+Gen`
* *australijeenaristie:* `australijeenere+N+Sg+Ela`




*sisilijaanere # Even-syllable test examples:*
* *sisilijaanere:* `sisilijaanere+N+Sg+Nom`
* *sisilijaanerem:* `sisilijaanere+N+Sg+Acc`
* *sisilijaaneren:* `sisilijaanere+N+Sg+Gen`
* *sisilijaanaristie:* `sisilijaanere+N+Sg+Ela`



*radijaatore # Even-syllable test examples:*
* *radijaatore:* `radijaatore+N+Sg+Nom`
* *radijaatorem:* `radijaatore+N+Sg+Acc`
* *radijaatoren:* `radijaatore+N+Sg+Gen`
* *radijaatorisnie:* `radijaatore+N+Sg+Ine`
* *radijaatoristie:* `radijaatore+N+Sg+Ela`
* *radijaatorinie:* `radijaatore+N+Sg+Com`



*pijaanove # ODD-syllable test examples:*
* *pijaanove:* `pijaanove+N+Sg+Nom`
* *pijaanovem:* `pijaanove+N+Sg+Acc`
* *pijaanoven:* `pijaanove+N+Sg+Gen`
* *pijaanovisnie:* `pijaanove+N+Sg+Ine`
* *pijaanovistie:* `pijaanove+N+Sg+Ela`
* *pijaanovinie:* `pijaanove+N+Sg+Com`



*administraatore# ODD-syllable test examples:*
* *administraatore:* `administraatore+N+Sg+Nom`
* *administraatorem:* `administraatore+N+Sg+Acc`
* *administraatoren:* `administraatore+N+Sg+Gen`
* *administraatorisnie:* `administraatore+N+Sg+Ine`
* *administraatoristie:* `administraatore+N+Sg+Ela`
* *administraatorinie:* `administraatore+N+Sg+Com`



*faktore# Even-syllable test examples:*
* *faktore:* `faktore+N+Sg+Nom`
* *faktorem:* `faktore+N+Sg+Acc`
* *faktoren:* `faktore+N+Sg+Gen`
* *faktorisnie:* `faktore+N+Sg+Ine`
* *faktoristie:* `faktore+N+Sg+Ela`
* *faktorinie:* `faktore+N+Sg+Com`



























## Inflection for nouns ending in oe


The oe with umlaut generate the uml-ones
and have the non-uml ones as +Use/NG.








The oe without umlaut generate the non-uml-ones
only, naturally without +Use/NG.


Lexicon N_OE_OBL is for the -oe nouns without umlaut
Illative is lifted out in order to allow for Use/NG for the
umlauted ones.





































































































































 LEXICON EETE_LOAN    loanwords with -eete -


*universiteete # Even-syllable test examples:*
* *universiteete:* `universiteete+N+Sg+Nom`
* *universiteetem:* `universiteete+N+Sg+Acc`
* *universiteetesne:* `universiteete+N+Sg+Ine`
* *universiteetetje:* `universiteete+N+Der/Dimin+N+Sg+Nom`
* *universiteetetjem:* `universiteete+N+Der/Dimin+N+Sg+Acc`
* *universiteetetjisnie:* `universiteete+N+Der/Dimin+N+Sg+Ine`

















## Inflection for NIEJTE_SG nouns: lexicon NIEJTE_SG
Short descrioption of this lexicon, and its purpose.


















*vïelle # Even-syllable test examples:*
* *vïelle:* `vïelle+N+Sg+Nom`
* *vïellese:* `vïelle+N+Sg+Ill`
* *vïelline:* `vïelle+N+Sg+Com`
* *vïelletje:* `vïelle+N+Der/Dimin+N+Sg+Nom`
* *vïelletjasse:* `vïelle+N+Der/Dimin+N+Sg+Ill`
* *vïellemem:* `vïelle+N+Sg+Acc+PxSg1`
* *vïelleme:* `vïelle+N+Sg+Acc+PxSg1`
* *vïellemdh:* `vïelle+N+Sg+Acc+PxSg2`
* *vïellese:* `vïelle+N+Sg+Nom+PxSg3`
* *vïellebe:* `vïelle+N+Sg+Nom+PxSg3`







 LEXICON KONTO   Lexicon for vowel-final words with invariant stems"
```
  : KONTODECL ; 
```
 LEXICON KONTODECL  Lexicon for vowel-final words with invariant stems"
```
                +Sg:     KONTO_SG ; 
                +Pl:     KONTO_PL ; 
                         EVEN_ESS ; 
          +Cmp/SgNom:     R        ; 
          +Cmp/SgGen:%>n  R        ; 
          +Cmp/PlGen:%>j  R        ; 
  +Der1+Der/Dimin+N:%»tj GÅATETJE ; 
```





































## Px lexica     = Copy from Julev









# Proper nouns morphology

## Table of content
* Continuation lexica
* Personal names
** First names
** Surnames
* Place names





















*Tunturi # ODD-syllable examples:*
* *Tunturi:* `Tunturi+N+Prop+Sem/Plc+Attr`
* *Tunturim:* `Tunturi+N+Prop+Sem/Plc+Sg+Acc`
* *Tunturasse:* `Tunturi+N+Prop+Sem/Plc+Sg+Ill`
* *Tunturisnie:* `Tunturi+N+Prop+Sem/Plc+Sg+Ine`
* *Tunturistie:* `Tunturi+N+Prop+Sem/Plc+Sg+Ela`
* *Tunturinie:* `Tunturi+N+Prop+Sem/Plc+Sg+Com`
* *Tunturinie:* `Tunturi+N+Prop+Sem/Plc+Ess`



























































*Eira # Even-syllable                   !   Går som MAANA  !    PL+ examples:*
* *Eira:* `Eira+N+Prop+Sem/Sur+Attr` (Eng. ! Går som MAANA ! PL+Nom Eirah)
* *Eiram:* `Eira+N+Prop+Sem/Sur+Sg+Acc` (Eng. ! Går som MAANA ! PL+Acc Eiride --> Komp. ikke)
* *Eirese:* `Eira+N+Prop+Sem/Sur+Sg+Ill` (Eng. ! Går som MAANA ! PL+Ill Eiride --> Komp. ikke)
* *Eiresne:* `Eira+N+Prop+Sem/Sur+Sg+Ine` (Eng. ! Går som MAANA ! PL+Ine Eirine)
* *Eireste:* `Eira+N+Prop+Sem/Sur+Sg+Ela` (Eng. ! Går som MAANA ! PL+Ela Eirijste --> Komp. ikke)
* *Eirine:* `Eira+N+Prop+Sem/Sur+Sg+Com` (Eng. ! Går som MAANA ! PL+Com Eirajgujmie)
* *Eirine:* `Eira+N+Prop+Sem/Sur+Ess` (Eng. ! Går som MAANA ! PL+Ess Eirine)


*Anu # Even-syllable                    !   Går som gaalloe !               ! Pl+Nom examples:*
* *Anu:* `Anu+N+Prop+Sem/Fem+Attr` (Eng. ! Går som gaalloe ! Arkivfoto ! Pl+Nom Anuh)
* *Anum:* `Anu+N+Prop+Sem/Fem+Sg+Acc` (Eng. ! Går som gaalloe ! Arkivfotom ! Pl+Acc Anujde)
* *Anuse:* `Anu+N+Prop+Sem/Fem+Sg+Ill` (Eng. ! Går som gaalloe ! Arkivfotose ! Pl+Ill Anujde)
* *Anusne:* `Anu+N+Prop+Sem/Fem+Sg+Ine` (Eng. ! Går som gaalloe ! Arkivfotosne ! Pl+Ine Anujne)
* *Anuste:* `Anu+N+Prop+Sem/Fem+Sg+Ela` (Eng. ! Går som gaalloe ! Arkivfotoste ! Pl+Ela Anujste)
* *Anune:* `Anu+N+Prop+Sem/Fem+Sg+Com` (Eng. ! Går som gaalloe ! Arkivfotojne ! Pl+Com Anujgujmie)
* *Anune:* `Anu+N+Prop+Sem/Fem+Ess` (Eng. ! Går som gaalloe ! Arkivfotojne ! Pl+Ess Anujne)



*Ane # Even-syllable                    !   Går som nïejte examples:*
* *Ane:* `Ane+N+Prop+Sem/Fem+Attr` (Eng. ! Går som nïejte)
* *Anem:* `Ane+N+Prop+Sem/Fem+Sg+Acc` (Eng. ! Går som nïejte)
* *Anese:* `Ane+N+Prop+Sem/Fem+Sg+Ill` (Eng. ! Går som nïejte)
* *Anesne:* `Ane+N+Prop+Sem/Fem+Sg+Ine` (Eng. ! Går som nïejte)
* *Aneste:* `Ane+N+Prop+Sem/Fem+Sg+Ela` (Eng. ! Går som nïejte)
* *Anine:* `Ane+N+Prop+Sem/Fem+Sg+Com` (Eng. ! Går som nïejte)
* *Anine:* `Ane+N+Prop+Sem/Fem+Ess` (Eng. ! Går som nïejte)


* *Anide:* `Ane+N+Prop+Sem/Fem+Pl+Acc` (Eng. ! Går som nïejte ! -> Kompilerer ikke)
* *Anide:* `Ane+N+Prop+Sem/Fem+Pl+Ill` (Eng. ! Går som nïejte ! -> Kompilerer ikke)
* *Anine:* `Ane+N+Prop+Sem/Fem+Pl+Ine` (Eng. ! Går som nïejte ! -> Kompilerer ikke)
* *Anijste:* `Ane+N+Prop+Sem/Fem+Pl+Ela` (Eng. ! Går som nïejte ! -> Kompilerer ikke)
* *Anigujmie:* `Ane+N+Prop+Sem/Fem+Pl+Com` (Eng. ! Går som nïejte ! -> Kompilerer ikke)


*Ally # Even-syllable                  !   Går som y   examples:*
* *Ally:* `Ally+N+Prop+Sem/Fem+Attr` (Eng. ! Går som nïejte)
* *Allym:* `Ally+N+Prop+Sem/Fem+Sg+Acc` (Eng. ! Går som nïejte)
* *Allyn:* `Ally+N+Prop+Sem/Fem+Sg+Gen` (Eng. ! Går som nïejte)
* *Allyse:* `Ally+N+Prop+Sem/Fem+Sg+Ill` (Eng. ! Går som nïejte)
* *Allysne:* `Ally+N+Prop+Sem/Fem+Sg+Ine` (Eng. ! Går som nïejte)
* *Allyste:* `Ally+N+Prop+Sem/Fem+Sg+Ela` (Eng. ! Går som nïejte)
* *Allyne:* `Ally+N+Prop+Sem/Fem+Sg+Com` (Eng. ! Går som nïejte)
* *Allyne:* `Ally+N+Prop+Sem/Fem+Ess` (Eng. ! Går som nïejte)
* *Allyde:* `Ally+N+Prop+Sem/Fem+Pl+Acc` (Eng. !)
* *Allyj:* `Ally+N+Prop+Sem/Fem+Pl+Gen` (Eng. !)
* *Allyde:* `Ally+N+Prop+Sem/Fem+Pl+Ill` (Eng. !)
* *Allyne:* `Ally+N+Prop+Sem/Fem+Pl+Ine` (Eng. !)
* *Allyjste:* `Ally+N+Prop+Sem/Fem+Pl+Ela` (Eng. !)
* *Allyjgujmie:* `Ally+N+Prop+Sem/Fem+Pl+Com` (Eng. !)


*Aunio # Even-syllable                  !   Går som GAALLOE    examples:*
* *Aunio:* `Aunio+N+Prop+Sem/Sur+Attr` (Eng. ! Går som)
* *Auniom:* `Aunio+N+Prop+Sem/Sur+Sg+Acc` (Eng. !)
* *Auniose:* `Aunio+N+Prop+Sem/Sur+Sg+Ill` (Eng. !)
* *Auniosne:* `Aunio+N+Prop+Sem/Sur+Sg+Ine` (Eng. !)
* *Aunioste:* `Aunio+N+Prop+Sem/Sur+Sg+Ela` (Eng. !)
* *Aunione:* `Aunio+N+Prop+Sem/Sur+Sg+Com` (Eng. !)
* *Aunione:* `Aunio+N+Prop+Sem/Sur+Ess` (Eng. !)





































 LEXICON LONDON-obj    Objects. ODD-syllable


*Windows # Odd-syllable test examples:*
* *Windows:* `Windows+N+Prop+Sem/Obj+Attr`
* *Windows:* `Windows+N+Prop+Sem/Obj+Sg+Nom`
* *Windowsasse:* `Windows+N+Prop+Sem/Obj+Sg+Ill`
* *Windowsistie:* `Windows+N+Prop+Sem/Obj+Sg+Ela`





























































*Courtrai # Even-syllable examples:*
* *Courtrai:* `Courtrai+N+Prop+Sem/Plc+Attr`
* *Courtrajjem:* `Courtrai+N+Prop+Sem/Plc+Sg+Acc`
* *Courtrajjese:* `Courtrai+N+Prop+Sem/Plc+Sg+Ill`
* *Courtrajjesne:* `Courtrai+N+Prop+Sem/Plc+Sg+Ine`
* *Courtrajjeste:* `Courtrai+N+Prop+Sem/Plc+Sg+Ela`
* *Courtrajjine:* `Courtrai+N+Prop+Sem/Plc+Sg+Com`
* *Courtrajjine:* `Courtrai+N+Prop+Sem/Plc+Ess`
























*Haukilahti # Even-syllable   POLITI  examples:*
* *Haukilahti:* `Haukilahti+N+Prop+Sem/Plc+Sg+Nom`
* *Haukilahtijjem:* `Haukilahti+N+Prop+Sem/Plc+Sg+Acc`
* *Haukilahtan:* `Haukilahti+N+Prop+Sem/Plc+Sg+Ill`
* *Haukilahtijjese:* `Haukilahti+N+Prop+Sem/Plc+Sg+Ill`
* *Haukilahtijjesne:* `Haukilahti+N+Prop+Sem/Plc+Sg+Ine`
* *Haukilahtijjeste:* `Haukilahti+N+Prop+Sem/Plc+Sg+Ela`
* *Haukilahtijjine:* `Haukilahti+N+Prop+Sem/Plc+Sg+Com`
* *Haukilahtijjine:* `Haukilahti+N+Prop+Sem/Plc+Ess`













  OBS! Egentlig Mâki og Järvi kan egentlig slås sammen! - MAJA



*Hautajärvi # Even-syllable examples:*
* *Hautajärvi:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Nom`
* *Hautajärvim:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Acc`
* *Hautajärvan:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Ill`
* *Hautajärvesne:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Ine`
* *Hautajärveste:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Ela`
* *Hautajärvine:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Com`
* *Hautajärvine:* `Hautajärvi+N+Prop+Sem/Plc+Sg+Ess`






*gata # Even-syllable examples:*
* *Akersgata:* `Akersgata+N+Prop+Sem/Plc+Attr`
* *Akersgatam:* `Akersgata+N+Prop+Sem/Plc+Sg+Acc`
* *Akersgatese:* `Akersgata+N+Prop+Sem/Plc+Sg+Ill`













# LEXICON ACCRA-femplc
Propernoun


*gata #  examples:*
* *Abia:* `Abia+N+Prop+Sem/Plc+Sg+Nom`
* *Abian:* `Abia+N+Prop+Sem/Plc+Sg+Gen`
* *Abiam:* `Abia+N+Prop+Sem/Plc+Sg+Acc`
* *Abiese:* `Abia+N+Prop+Sem/Plc+Sg+Ill`
* *Abiesne:* `Abia+N+Prop+Sem/Plc+Sg+Ine`
* *Abieste:* `Abia+N+Prop+Sem/Plc+Sg+Ela`
* *Abine:* `Abia+N+Prop+Sem/Plc+Sg+Com`
* *Abine:* `Abia+N+Prop+Sem/Plc+Ess`

















the sne / snie business remains to be sorted out.
the sne / snie business remains to be sorted out.






















+Pl+Nom:e%>h       FINAL1 ;
+Pl+Acc:e%>ide      FINAL1 ;
+Pl+Gen:e%>i       FINAL1 ;
+Pl+Ill:e%>ide      FINAL1 ;
+Pl+Ine:e%>ine      FINAL1 ;
+Pl+Ela:e%>iste    FINAL1 ;
+Pl+Com:e%>igujmie  FINAL1 ;



+Pl: N_ODD_PL ;     ! normal noun



























































# LEXICON NIEMI
Propernoun

*propernoun examples:*
* *Ahoniemi:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Nom`
* *Ahoniemin:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Gen`
* *Ahoniemim:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Acc`
* *Ahoneaman:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Ill`
* *Ahoniemesne:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Ine`
* *Ahoniemeste:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Ela`
* *Ahoniemine:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Com`
* *Ahoniemine:* `Ahoniemi+N+Prop+Sem/Plc+Sg+Ess`



















+N+Prop+Sem/Plc+Sg+Ill:%>an                FINAL1 ; !SUB - is this possible? IllSg without Uml in -ie?





















































 +N+Prop+Sem/Plc+Pl: NIEJTE_PL ;



+N+Prop+Sem/Plc+Pl+Com+Err/Orth:%>igyjmie  FINAL1 ; !













































+N+Prop+Sem/Plc+Pl: CNAME_ODD_PL ;     ! name special


























# Adjective affixes

This is one of two parallel files containing adjective affixes.
The files represent two alternative interpretation of the same data
(South Saami adjectives).
This file is used for spellchecking, the alternative file
*adjectives-oahpa.lexc* is used for dictionary and icall applications.
This file is compiled by default, the other one is compiled by in
langs/sma giving the command *.configure --with-oahpa*
before compiling.
































# LEXICON PRED_S
The __PRED_S__ lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>s FINAL1 ; 
```

# LEXICON PRED_0
The __PRED_0__ lexicon is used for adjectives Predicatives.
```
  +Sg+Nom: FINAL1 ; 
```

# LEXICON PRED_H
The __PRED_H!!≈__ lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>h FINAL1 ; 
```


denne skal også ut ! - --> intersatn om dette er en norsk suffiks egentlig?
# LEXICON PRED_NE_ODD
The __PRED_NE_ODD!!≈__ lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>ne FINAL1     ; 
          :n     ODDCASEOBL ; 
          :n     ODDCOMP    ; 
```

# LEXICON PRED_N    -  GENITIV
The __PRED_N!!≈__ lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>n FINAL1 ; 

```











# LEXICON e_E_EVEN
The __e_E_EVEN!!≈__ lexicon is used for adjectives on `–e` and `–e`  In attributes and predicatives.With EVEN-NOCOMP.
```
       :e ATTR_0      ; 
       :e PRED_0      ; 
  +Sg:  NIEJTESGOBL ; 
  +Pl:  NIEJTE_PL   ; 
       NIEJTEREST  ; 
       :e EVENCOMP    ; 
```

# LEXICON e_E_EVENNOCOMP1
The __e_E_EVENNOCOMP1!!≈__ lexicon is used for adjectives on `–e` and `–e` stem. In attributes and predicatives.With EVEN-NOCOMP.

```
       :e ATTR_0      ; 
       :e PRED_0      ; 
  +Sg:  NIEJTESGOBL ; 
###  +Sg:  NIEJTESGOBL ; 
  +Pl:  NIEJTE_PL   ; 
       NIEJTEREST  ; 
```


# LEXICON a_A_EVEN1
The __a_A_EVEN1!!≈__ lexicon is used for adjectives on `–a` and `–a`  In attributes and predicatives.With EVEN-COMP.
```
       :a ATTR_0     ; 
  +Sg:  MAANASGNOM ; 
       MAANAOBL   ; 
       :a EVENCOMP   ; 
```

# LEXICON as_AS_EVEN1 ! Disse har opprinnelig vært as_a_EVEN_adjektiv
The __as_AS_EVEN1!!≈__ lexicon is used for adjectives on `–as` and `–as`  In attributes and predicatives.With EVEN-COMP.
```
               :a  ATTR_S   ; 
      +Sg+Nom:as FINAL1   ; 
   +Cmp/SgNom:as R        ; 
```


# LEXICON ie_IE_EVEN1
The __ie_IE_EVEN1!!≈__ lexicon is used for adjectives on `–ie` and `–ie`  In attributes and predicatives.With EVEN-COMP.
```
    :ie ATTR_0     ; 
     N_IE_FORMS ; 
    :ie EVENCOMP   ; 
```


# LEXICON ie_IE_EVENNOCOMP
The __ie_IE_EVENNOCOMP!!≈__ lexicon is used for adjectives on `–ie` and `–ie`  In attributes and predicatives. With EVEN-COMP.
```
    :ie ATTR_0     ; 
     N_IE_FORMS ; 
```

The __a_A_EVEN1_NOCOMP__ lexicon is used for adjectives on `–ie` and `–ie`  In attributes and predicatives. With EVEN-COMP.
```
       :a ATTR_0     ; 
```

# LEXICON es_ES_EVEN
The __es_ES_EVEN!!≈__ lexicon is used for adjectives on `–es` and `–es`  In attributes and predicatives. With EVEN-COMP.
```
            :e      ATTR_S       ; 
            :e      PRED_S       ; 
            :e      EVENCOMP     ; 
```





The __es_ES_EVENNOCOMP1__ lexicon is used for adjectives on `–es` and `–es`  In attributes and predicatives. With EVEN-NOCOMP.

```
  :e  ATTR_S     ; 
  :e  PRED_S     ; 
  :es ODDCASEOBL ; 
```


The __ies_IES_EVEN1__ lexicon is used for adjectives on `–ies` and `–ies`  In attributes and predicatives. With EVEN-COMP.
```
      ies_IES_EVENNOCOMP1 ; 
  :ie EVENCOMP            ; 
```


The __ies_IES_EVENNOCOMP1__ lexicon is used for adjectives on `–ies` and `–ies`  In attributes and predicatives. With EVEN-NOCOMP.
```
   :ie ATTR_S    ; 
   :ie PRED_S    ; 
```








*adjectives examples:*
* *gööktengïeleh:* `guektiengïeleh+A+Attr`
* *göökten-gïeleh:* `guektiengïeleh+A+Attr`
* *guektiengïeleh:* `guektiengïeleh+A+Attr`
* *guektien-gïeleh:* `guektiengïeleh+A+Attr`
* *gööktengïeleh:* `guektiengïeleh+A+Sg+Nom`
* *gööktengïelege:* `guektiengïeleh+A+Sg+Nom`
* *göökten-gïeleh:* `guektiengïeleh+A+Sg+Nom`
* *göökten-gïelege:* `guektiengïeleh+A+Sg+Nom`
* *guektiengïeleh:* `guektiengïeleh+A+Sg+Nom`
* *guektiengïelege:* `guektiengïeleh+A+Sg+Nom`
* *guektien-gïeleh:* `guektiengïeleh+A+Sg+Nom`
* *guektien-gïelege:* `guektiengïeleh+A+Sg+Nom`




# BÅERIES LEXICON BAERIES
UNEVEN adjective, attr = pred. Comporation uneven syllable.
Presentlly only used for "båeries" adjective.
```
   :båerie ATTR_S   ; 
   :båerie PRED_S   ; 
   :båaras ODDCOMP  ; 
```

# ÅEHPIES LEXICON ÅEHPIES
ODD adjective, attr = pred. Comporation uneven syllable.
```
```


# GEAREHKE LEXICON GIERIES
Umlaut from attr--> pred. Comporation uneven syllable.
Presentlly only used for "gieries-gearehke" adjective.
This lexicon covers the ies - ehke + umlaut change.
```
         :gierie   ATTR_S  ; 
         :gearahk  ODDCASE ; 
         :gearahk  ODDCOMP ; 
  +Use/NG:gearahtj ODDCOMP ; 
  +Use/NG:gearahg  ODDCOMP ; 
```





# BUERIE LEXICON BUERIE_UMLAUT_IE_STAMME
EVEN adjective with EVEN-UMLAUT Comporation for -ie-stems.
```
  :buer   ie_IE_EVENNOCOMP ; 
  :buerie EVENCOMPONLY     ; 
  :bööre  MES              ; 
  :buerie DIMCOMP          ; 


```







UMLAUT 3 = e(3)-stamme  = Unødvendig lexicon

UMLAUT 3 = e(3)-stamme













# LEXICON ihks_IHKS_igs_IGS_EVENNOCOMP
Adjective with no comp.


*adjectives examples:*
* *isvelihks:* `isvelihks+A+Attr`
* *isveligs:* `isvelihks+A+Attr`
* *isvelihks:* `isvelihks+A+Sg+Nom`
* *isveligs:* `isvelihks+A+Sg+Nom`

* *isvelihke:* `isvelihks+A+Sg+Nom`
* *isveligke:* `isvelihks+A+Sg+Nom`
* *isveligie:* `isvelihks+A+Sg+Nom`
* *isveligke:* `isveligke+Adv`
* *isvelihke:* `isvelihke+Adv`

```
          +Use/NG:ihk%>s ATTRCONT   ; 
                 :ig     ATTR_S     ; 
        +Err/Orth:igks     ATTR_H     ;  onterligksh
   +Sg+Nom+Use/NG:ihk%>s FINAL1     ; 
   +Sg+Nom+Use/NG:ig%>s  FINAL1     ; 
                 :ihk    X_NIEJTE   ; 
          +Use/NG:igk    X_NIEJTE   ; 
          +Use/NG:ig     N_IE_FORMS ; 
```






# LEXICON ihks_IHKS_igs_IGS_EVENNOCOMP
EVEN/ODD adjective with Comporation.

```
```

# LEXICON e_ES_EVENNOCOMP2
This is for the adjective "jaame"


*adjectives examples:*
* *jaame:* `jaame+A+Attr`
* *jaames:* `jaame+A+Sg+Nom`

```
  :e ATTR_0   ; 
  :e PRED_S   ; 
     eCASEOBL ; 
```



  :e ATTR_0     ; 
  :e PRED_S     ; 

  :e ATTR_0     ; 



  :e ATTR_0     ; 
  :e PRED_S     ; 





           :e ATTR_0   ; 


           :e PRED_S   ; 






+Err/Attr:e ATTR_S   ;





# LEXICON ODDEVEN2
This one gives EVEN and ODD  Comporation.

```

              :es ODDCASEOBL ; 
              :e  EVENCOMP   ; 
  +Cmp/SgNom:es R          ; 
       +Use/NG:es ODDCOMP    ;  ! trond test, utkommentert gjev Total passes: 1140, Total fails: 61, Total: 1201
```



















# LEXICON es_E_EVEN3
This one gives EVEN Comporation, and -s in attributt and wowel in predikativ, which gives EVEN-COMP.
```
         :e ATTR_S      ; 
         :e EVENCOMP    ; 
```

# LEXICON as_oes_A_OE_EVEN3
This one gives EVEN Comporation, and -s in attributt and wowel in predikativ, which gives EVEN-COMP.
```
       +Use/NG:a  ATTR_S      ; 
              :oe ATTR_S      ; 
              :oe EVENCOMP_oe ; 
       +Use/NG:a  EVENCOMP    ; 
```

# LEXICON oeh_ah_OE_A_EVEN3
This one gives EVEN Comporation, and -s in attributt and wowel in predikativ, which gives EVEN-COMP.
```
         :oe ATTR_H      ; 
  +Use/NG:a  ATTR_H      ; 
             N_OE        ; 
  +Use/NG:   MAANA       ; 
         :oe EVENCOMP_oe ; 
  +Use/NG:e  EVENCOMP    ; 
```

# LEXICON ies_IE_EVEN3
This one gives EVEN Comporation, and -s in attributt and wowel in predikativ, which gives EVEN-COMP.
```
    :ie ATTR_S     ; 
     N_IE_FORMS ; 
    :ie EVENCOMP   ; 
```

# LEXICON ies_IE_EVEN3NOCOMP
This one gives EVEN Comporation, and -s in attributt and wowel in predikativ.
```
    :ie ATTR_S     ; 
     N_IE_FORMS ; 
```














# UMLAUT LEXICON asATTR_anADVERB
These 6 adjectives is in the 4. group of the southsámi adjectives, the group
which contains all umlaut-adjectives. Theese adjectives whivh have -as  as
attributeform and an as predicativeform, is south-southsámi adjectives, and
they dont have any comparation.
This group which covers the ies - an/ as-an and oes-an + umlaut change, is a
small undergruppe of the 4.group
```
   +A:a  ATTR_S   ; 
```

# UMLAUT LEXICON oesATTR
Theese 5 adjectives is in the 4. group of the southsámi adjectives, The group which contains all
umlaut-adjectives. Theese adjectives which have -oes  as attributeform and -an as predicativeform, is north-southsámi adjectives, and they dont have any comparation.
This group which covers the ies -> an/ as-> an and oes-> an + umlaut change, is a small undergruppe of the 4.group
```
   +A:oe     ATTR_S   ; 
   +A:       N_OE_OBL ; 
```


```
   +A:oe  ATTR_H     ; 
```

```
          +A:oe        ATTR_H    ; 

```













































# LEXICON MAST
The **MAST** lexicon is used for adjectives on `–masten` and `masth` with an
used with the stem *masten*
```
                 ATTR_S      ; 
       +Use/NG:e ATTR_S      ; 
       +Use/NG:  ATTR_H      ; 
       +Use/NG:e ATTR_N      ; 
              :e PRED_N      ; 
```


# IJVE_LOAN_ADJ LEXICON IJVEadj
EVEN adjective EVEN Comporation.
Used for all loan-adjectives "ijve".
```
           :ijv e_E_EVEN ; 
    +Use/NG:ïjv e_E_EVEN ; 
  +Err/Orth:iv  e_E_EVEN ; 
```





# LEXICON JELLE
The **JELLE** lexicon is used for loanadjectives on `jelle` and `–jelle` with an
used with the stem *jelle* This one should be 'jeelle'? SGM?

```
  +Err/Orth:^ell e_ES_LOAN ; 
          :jell e_ES_LOAN ; 
```

# LEXICON UELLE
```
          :^ell e_ES_LOAN ; 
  +Err/Orth:vell e_ES_LOAN ; 
```












































































 * __LEXICON s_H_EVENNOCOMP   __






























 :ijl e_E_EVEN ;








This is the file for the South Saami verb inflection and derivation.

# Verbal inflection sublexica

Table of content for this file:

* The auxiliaries
** The negative verb
** Other auxiliaries
* Odd-syllable verbs
** Inflection common to all odd verbs
* Even-syllable verbs
** Nominal derivation sublexica
* Verbal affixes
** Finite forms
** Even
*** Present
*** Imperative
*** Present
** Odd
*** Present
*** Past
*** Imperative
** Common even-odd
*** Present
*** Past


# The auxiliaries

First we just list the auxiliaries and their inflection.

 * **LEXICON LEA** the copula


 ** **LEXICON LEA-PRES**


 ** **LEXICON LEA-PRET**

 ** **LEXICON LEA-IMP**




## The negative verb

 * **LEXICON NEG**











 ** **LEXICON OLLE**


 ** **LEXICON NEGIMP**


 ** **LEXICON IJ-PRES**







## Other auxiliaries

 * **LEXICON EDTJEDH**



 ** **LEXICON ED-PRES**



 ** **LEXICON ED-PRET**

 ** **LEXICON ED-IMP**




# Odd-syllable verbs

Odd syllable verbs differ in Prt Sg3.
This form is treated separately, and
the rest of the paradigm is conflated.


 * __LEXICON TJOEVERIDH_IV  __





 * __LEXICON GOLTELIDH_TV  __

 * __LEXICON AALHTEDIDH_TV  __

 * __LEXICON GOLTELIDH_IV  __


 * **LEXICON GOLTELIDH**, odd-syll with -adte- as Der2




 * **LEXICON BALVEDIDH**





 * **LEXICON RIHPESIDH**,  -nidh and -sidh

 * __LEXICON AAJVESTIDH_TV     __, for stems ending -t-: dåajvoeht-, odd-syll with -alle- as Der2 and passive -sovvedh

 * __LEXICON DÅAJVOEHTIDH_TV  __



 * __LEXICON DÅAJVOEHTIDH_IV  __


 * **LEXICON DÅAJVOEHTIDH** for stems ending -t-: dåajvoeht-, odd-syll with -alle- as Der2



## Inflection common to all odd verbs

 * **LEXICON COMMON-ODD**

* Finite forms

* Infinite forms



* Derivations



# Even-syllable verbs

 * __LEXICON MAEHTEDH_TV  __


 * __LEXICON BÅETEDH_TV  __

 * __LEXICON BÅETEDH_TV_ePRET  __

 * __LEXICON BÅETEDH_IV  __

 * __LEXICON BÅETEDH_IV_ePRET  __


 * **LEXICON BÅETEDH** row A - Group I



 * __LEXICON BÅETEDH_NOTVGEN   __ row A - Group Ixxf


 * **LEXICON SEVTEDH** row A - Group I  IMPERSONALS!




 * **LEXICON ÅEREDH** row A - Group I   Hasselbrink: "öörim."- (Thomassen) Qvigstad: "vöörtim" 




 * __LEXICON ÅEREDH_TV   __ row A - Group I   NO -øø-UMLAUT!!!!





 * __LEXICON TJEARODH_TV  __


 * __LEXICON TJEARODH_IV  __


 * **LEXICON TJEARODH** row C - Group II




 * **LEXICON ABRODH** row C - Group II


 * __LEXICON TSEAHKODH_TV  __

 * __LEXICON TSEAHKODH_IV  __


 * **LEXICON TSEAHKODH** row C - Group II    these have (lexicalized) diminutives on -estit, and passives on -algidh


 * __LEXICON GUARKEDH_TV  __

 * __LEXICON GUARKEDH_IV  __


 * **LEXICON GUARKEDH** row B - Group III

Fått tilbakemelding på denne om at "jarkah" er +Ind+Prs+Sg2, og "Jarkh!" er +Imprt. Har forelöpig satt denne inn som Err/Orth


 * __LEXICON SIJHTEDH_TV   __



 * __LEXICON TJOEHPEDH_TV  __

 * __LEXICON GALKEDH_IV  __



 * __LEXICON TJOEHPEDH_IV  __


 * **LEXICON TJOEHPEDH** row D - Group IV


 * __LEXICON TJOEHPEDH_NOTVGEN  __


 * __LEXICON GALKEDH_CONT   __ row D - Group IV




 * **LEXICON BIEGKEDH** row D - Group IV !impersonals

 * __LEXICON BÅÅHKEDH_TV  __

 * __LEXICON SÅÅJHTEDH_IV  __



 * __LEXICON BÅÅHKEDH_IV  __


 * **LEXICON BÅÅHKEDH** row E - Group V

 * __LEXICON SÅÅJHTEDH_CONT   __ row E - Group V

 * **LEXICON VÅÅJNEDH**



 * __LEXICON GÖÖLEDH_TV  __


 * __LEXICON GÖÖLEDH_IV  __


 * **LEXICON GÖÖLEDH** row F - Group VI


 * **LEXICON BÖÖVTEDH** row F - Group VI


 * __LEXICON EEREDH_TV  __

 * __LEXICON EEREDH_IV  __




 * __LEXICON ÅARAJEHTEDH_TV  __


 * __LEXICON ÅARAJEHTEDH_IV  __


 * **LEXICON ÅARAJEHTEDH** row A - Group I

 * **LEXICON BUARADEHTEDH**


 * __LEXICON GOEGKERDADTEDH_TV  __

 * __LEXICON GOEGKERDADTEDH_IV  __


 * **LEXICON GOEGKERDADTEDH** row D - Group IV

 * **LEXICON OBREDADTEDH**

 * __LEXICON GÅETEDH_TV  __

 * __LEXICON GÅETEDH_IV  __


 * **LEXICON GÅETEDH** from Der/InchL

 * **LEXICON STIEHPEGÅETEDH**


 * __LEXICON AHTJE_TV  __

 * __LEXICON AHTJE_IV  __

 * **LEXICON OBRIJAHTJEDH**


 * **LEXICON AHTJE** row D - Group IV

 * **LEXICON SOVVEDH**row D - Group IV

 * __LEXICON IV_PASSIVE_L  __ - Passive of intransitive verbs => impersonate verbs, like "dïjvelduvvieh" = "(de sakene) ble diskutert", from "dïjveldidh" = "diskutere" (IV), only used in 3rd person Sg and Pl.



Infinite forms
--------------
                 +V+IV+Act:%>eme       FINAL1        ;
              +V+IV+PrsPrc:%>ije       FINAL1        ;
              +V+IV+PrsPrc:%>ijes      FINAL1        ;
Derivations
-----------


 * **LEXICON LGIDH**









Nominal derivation sublexica




 * __LEXICON LAAHKOEH_ODD  __

 ** __LEXICON LAAHKOEH_ÅBPOE  __


 ** __LEXICON LAAHKOEH_OMMES   __



 * **LEXICON IGENSUFF**


# Verbal affixes

## Finite forms

### Even

### Present

 * **LEXICON V-I-PRS-SG** Merge with V-EVEN-PRS if nothing special here.

 * **LEXICON V-II-PRS-SG**

 * **LEXICON V-III-PRS-SG**

 * **LEXICON VSUF-V-EVEN-PRS**

 * **LEXICON VSUF-V-EVEN-PRS-DUPL**



 * **LEXICON VSUF-EVEN-PRS-DUPL**









 * **LEXICON VSUF-VI-EVEN-PRS**


### Imperative

 * **LEXICON VSUF-EVEN-IMP**



 * **LEXICON VSUF-II-EVEN-IMP**



 * **LEXICON VSUF-III-EVEN-IMP**
### Present




 * **LEXICON V-IV-EVEN-PRS**






Ulikestavelsesverb - ODD

### Present

 * **LEXICON VSUF-ODD-PRS**

 ** **LEXICON V-ODD-PRS-SG**

 ** **LEXICON V-ODD-PRS-DUPL**

 ** __LEXICON ODD_PRS_NON_DU3  __

 ** __LEXICON ODD_PRS_DU3  __


### Past

 * **LEXICON VSUF-ODD-PRT**

### Imperative

 * **LEXICON VSUF-ODD-IMP**




## Common even-odd


### Present

 * **LEXICON V-PRS-SG-12** Kutt denne viss ikkje ref til

 * **LEXICON V-PRS-SG-1**

 * **LEXICON V-PRS-SG-2**

 * **LEXICON V-PRS-SG-3**


### Past

 * **LEXICON VSUF-PRT**



 * **LEXICON VSUF-PRT-SG-12**

 * **LEXICON VSUF-PRT-SG-3**


 * **LEXICON VSUF-PRT-DUPL**













LEXICON V-EVEN-PRS
  V-PRS-SG-12 ;
  V-PRS-SG-3 ;
   V-EVEN-PRS-DUPL ;





































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








# Continuation lexicons for abbreviations

## Lexica for adding tags and periods

## The sublexica

### Continuation lexicons for abbrs both with and witout final period


 * **LEXICON ab-noun**

 * **LEXICON ab-adj**

 * **LEXICON ab-adv**

 * **LEXICON ab-num**

### Lexicons without final period

 * **LEXICON ab-nodot-noun**  The bulk

 * **LEXICON ab-nodot-adj**

 * **LEXICON ab-nodot-adv**

 * **LEXICON ab-nodot-num**

### Lexicons with final period

 * **LEXICON ab-dot-noun**  This is the lexicon for abbrs that must have a period.

 * **LEXICON ab-dot-adj**  This is the lexicon for abbrs that must have a period.

 * **LEXICON ab-dot-adv**  This is the lexicon for abbrs that must have a period.

 * **LEXICON ab-dot-num**  This is the lexicon for abbrs that must have a period.

 * **LEXICON ab-dot-cc**





 * **LEXICON ab-dot-verb**

 * **LEXICON ab-nodot-verb**


 * **LEXICON ab-dot-IVprfprc**


 * **LEXICON nodot-attrnomaccgen-infl**

 * **LEXICON nodot-attr-infl**

 * **LEXICON nodot-nomaccgen-infl**


 * **LEXICON dot-attrnomaccgen-infl**

 * **LEXICON dot-attr**

 * **LEXICON dot-nomaccgen-infl**


 * **LEXICON DOT** - Adds the dot to dotted abbreviations.






 * **LEXICON UNIT**  As acro, but without paradigm

 * __LEXICON ACRO_ACCRA  __ 





















# Adjective stems

This is one of two parallel files containing adjective stems.
The files represent two alternative interpretation of the same data
(South Saami adjectives).
This file is used for spellchecking, the alternative file
*adjectives-oahpa.lexc* is used for dictionary and icall applications.
This file is compiled by default, the other one is compiled by in
langs/sma giving the command *.configure --with-oahpa*
before compiling.





































































































































































































# S O U T H   S Á M I   D I S A M B I G U A T O R          







## Delimiters 


"<.>" "<!>" "<?>" "<...>" "<¶>" sent


## Tags and sets 

### BOS/EOS:

* (>>>) (<s>)
  (<<<) (</s>)

### Morphological tags

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















### Derivation tags

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



<vdic>



###  Semantic tags











### Syntactic tags

* @CNP
@CVP
@+FAUXV
@+FMAINV
@-FAUXV
@-FMAINV
MAINV  = 



### Titles


REAL-TITLE
OFFICE
TITLE


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
















### Adective sets



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




Rule for adding Sem/Date as a tag to readings which looks like dates (fjernes når vi får felles numeralfil fra shared)

## Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses


## Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses








Rules for adding <vdic> to verbs denoting verbal actions like: ... jeahta Aili Kestkitalo.








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


Rel or Interr







### Adverbs
Selecting adverbs in local contexts








### Verbs
Selecting verbs in local contexts, based upon agreement patterns












Selecting imperative sentence-initially with appropriate right context




Remove verb readings












## Mapping rules

### CC- and CS-Mapping

* *COMPCS*  @COMP-CS< to Adv or A after goh etc.



## CNP mapping

Mapping CNP to CC and CS.






## CVP Mapping

Mapping @CVP to all CS











Attributes or not










## PrfPrc

Select PrfPrc if DerNomAct



Mapping verbs
























### *killifVinCohort* This rule removes all other readings, if there is a mapped V reading in the same cohort. Every case which this goes wrong, should be fixed in mapping rules or previous disrules.



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



















