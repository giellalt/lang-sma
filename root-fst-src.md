
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
 * **+Logo** - ?
 * **+Subqst** - used for adverbs
 * **+Dyn** = Code dynamic acronyms

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
 * **+Rom** = Roman numeral

## Error (non-standard language) tags

|                     Error tag | Explanation
|                           --- | ---
 | **+Err/Orth** | Substandard, unormert form av et ord
 | **+Err/Hyph** | Substandard, unormert
 | **+Err/SpaceCmp** | Substandard, unormert
 | **+Err/Attr** | Substandard, unormert Attr-form av et ord
 | **+Err/Lex** | lemma med dens ordformer er utenfor normen. <br/>No normative lemma, it's grammatically correct.
 | **+Err/Der** | Errors in derivations
 | **+Err/Spellrelax** | Used to tag spellrelaxed typos (tag is inserted via flag diacritics)
 | **+Err/MissingSpace** | in use in smi lexc

### Usage tags

|                    Usage tag | Explanation
|                          --- | ---
 | **+Use/Marg** | Marginal, korrekte, eksisterende former, men som er sjeldne. vi kan fjerne disse ordene f.eks fra speller, fordi de er så sjeldne og lite i bruk at de lemma som ligger nært kan bli forvekslet.
 | **+Use/-Spell** | Excluded from speller
 | **+Use/-PLX** | Excluded in PLX speller
 | **+Use/SpellNoSugg** | Recognized but not suggested in speller
 | **+Use/Circ** | Circular path
 | **+Use/CircN** | Circular number path?
 | **+Use/Ped** | Remove from pedagogical speller
 | **+Use/NG** | Do not generate <br/> for isme-ped.fst and apertium
 | **+Use/MT** | Generate for apertium only
 | **+Use/NotDNorm** | For (spellings of) words that do not follow the orthographic principles of sma. Divvun suggest that this shouldn't be normative, even though they are decided upon by GG. Included in speller.
 | **+Use/DNorm** | For words without formal normalization. Divvun suggest that this should be normative. Included in speller. Based on 2010 normative decision & Ove Lorentz' suggestions for the norm.
 | **+Use/PMatch** | Do *only* include in fst's for hfst-pmatch
 | **+Use/-PMatch** | Do not include in fst's made for hfst-pmatch
 | **+Use/GC** | only retained in the HFST Grammar Checker disambiguation analyser
 | **+Use/-GC** | never retained in the HFST Grammar Checker disambiguation analyser

## Dialect tags

|            Dialect tag | Explanation
|                    --- | ---
 | **+Dial/-S** | Not in the South
 | **+Dial/S** | Only in the South
 | **+Dial/-N** | Not in the North
 | **+Dial/N** | Only in the North
 | **+Dial/-NOR** | Words not in Norway
 | **+Dial/NOR** | Words only in Norway
 | **+Dial/-SW** | Words not in Sweden
 | **+Dial/SW** | Words only in Sweden
 | **+Dial/SH** | Short forms
 | **+Dial/L** | Long forms






## Normative/prescriptive compounding tags
(to govern compound behaviour for the speller, ie what a compound SHOULD BE)

### The left part of a compound should be ...

The default is `+CmpN/SgN`, so when nothing is specified, that
will be used. To override that one, specify one or more of the
following tags. `+CmpN/SgN` must be specified if also other tags
are listed - unless `+CmpN/SgN` should *not* be used, for course.

|    Normative compounding tag | Explanation
|                        :---- | :----
 |  **+CmpN/Sg** | Singular
 |  **+CmpN/SgN** | Singular Nominative
 |  **+CmpN/SgG** | Singular Genitive
 |  **+CmpN/PlG** | Plural Genitive


### The right part of a compound requires to the left ...

These tags overrule the regular tags defined above. One or more
can be specified.

| Normative left-governing tag | Explanation
|                          --- | ---
 |  **+CmpN/SgLeft** | Sg to the left
 |  **+CmpN/SgNomLeft** | etc.
 |  **+CmpN/SgGenLeft** | "
 |  **+CmpN/PlGenLeft** | "

### This part of the component can ...

|        Normative position tag | Explanation
|                           --- | ---
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

| Descriptive compounding tag | Explanation
|                       --- | ---
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

## Tags for Case, Number & Possessive Inflection
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


## Possessive
 * **+PxSg1** =  Possessives Singular
 * **+PxSg2** =  Possessives Singular
 * **+PxSg3** =  Possessives Singular
 * **+PxDu1** =  Possessives Dual
 * **+PxDu2** =  Possessives Dual
 * **+PxDu3** =  Possessives Dual
 * **+PxPl1** =  Possessives Plural
 * **+PxPl2** =  Possessives Plural
 * **+PxPl3** =  Possessives Plural

## Tense, Person & Number
|                                                 Tense tag | Explanation
|                                                       --- | ---
 |  **+Prs** | Presens
 |  **+Prt** | Preteritum

|                                  Person & Number tag | Explanation
|                                                  --- | ---
 |  **+Sg1** | Singular, 1.person
 |  **+Sg2** | Singular, 2.person
 |  **+Sg3** | Singular, 3.person
 |  **+Du1** | Dual    , 1.person
 |  **+Du2** | Dual    , 2.person
 |  **+Du3** | Dual    , 3.person
 |  **+Pl1** | Plural  , 1.person
 |  **+Pl2** | Plural  , 2.person
 |  **+Pl3** | Plural  , 3.person

## Other verbal tags

|             Verbal tag | Explanation
|                    --- | ---
 | **+Neg** | negation verb ij
 | **+ConNeg** | main verb complement to Neg, form identical to Imp
 | **+VAbess** | Verb Abessive
 | **+Inf** | Infinitive and participles
 | **+PrfPrc** | Infinitive and participles
 | **+PrsPrc** | Infinitive and participles
 | **+Ger** | Gerundium
 | **+VGen** | Verbgenitive
 | **+Ind** | Indicative
 | **+Imprt** | Imperative
 | **+ImprtII** | Imperative, for Neg:  ollem ollh ...
 | **+Cond** | Kondisjonalis, for one form:  lidtjie. To be looked at.+ lidtjim, + lidtjih
 | **+Act** | *-eme*, could be changed to `+Actio`

## Tags for adjectives

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

### tags for adverbs and komparerte adj
 * **+Gram/Comp +Gram/Superl**:


## Semantic tags to help disambiguation & synt. analysis:

 * +Sem/Act = Activity
 * +Sem/Adr = Webadr
 * +Sem/Amount = Amount; pile, amount of lynx, amount of food, one fifteenth, ten percent
 * +Sem/Ani = Animate; dog, reindeer, teddy bear,ndragon, lice
 * +Sem/Ani-fish = fisk
 * +Sem/Aniprod = Animal Product; sweat, reindeer skin, lice egg, blood for making dumplings, pee
 * +Sem/Body = Bodypart; ear, bone, ear canal, artificial leg, mustache, nervous system
 * +Sem/Body-abstr = Non-physical body part; Sjel, ånd, reason, soul, voice, eyesight, conscience
 * +Sem/Build = Building; house, museum, Sámi tent, nest, sandcastle
 * +Sem/Build-room = Room in a building, typically place to be
 * +Sem/Buildpart = Part of building; closet, room, door, balcony, pool, office
 * +Sem/Cat = Category; name, subjunction, suffix, password, existential sentence
 * +Sem/Clth = Clothes/Clothing; shirt, hat, theater costume, shawl, seatbelt, diaper
 * +Sem/Clth-jewl = Jewelery and similar; watch, sunglasses, ring, necklace, crown
 * +Sem/Clthpart = Part of clothes; knapp, søm, pocket (OBS! Ctain-abstr), bottom part of an article of clothing, upper part of trousers, seam, button
 * +Sem/Ctain = Container; suitcase, terrarium, closet, container, gas tank
 * +Sem/Ctain-abstr = Abstract container; bank account, fund, account, loan fund, pot, bank account
 * +Sem/Ctain-clth = Pocket
 * +Sem/Curr = Currency; not money, euro, US dollar, denar, Danish crown, currency
 * +Sem/Dance = Dance; swing, rumba, ballet, belly dance, war dance
 * +Sem/Date = Date
 * +Sem/Dir = Direction like GPS-kursa / Direction; GPS course, stock exchange price, graph, tendency, starboard
 * +Sem/Domain = Domain like politics, reindeerherding (a system of actions), anthropology, punk rock, biology, linguistics, medicine
 * +Sem/Drink = Drink; tea, beer, UHT milk, soda, communion wine
 * +Sem/Dummytag = Default tag for uncategorized nouns
 * +Sem/Edu = Educational event; skiing high school skiing academy, course, music lesson, lesson, master
 * +Sem/Event = Event; wedding, meeting, competition, election, festival
 * +Sem/Feat = Feature; Árvu, age difference, homosexuality, femininity, identity, congruence
 * +Sem/Feat-measr = Measurable feature; radius, diameter, volume, circumference, perimeter, frequency
 * +Sem/Feat-phys = Physiological feature; size, color, height, shape, weight, horsepower
 * +Sem/Feat-psych = Psychological feature; authority, nature, childishness, creativity, arrogance
 * +Sem/Fem = Female name
 * +Sem/Food = Food; bread, vegetarian food, flour, tobacco, salt/ mat, krydder
 * +Sem/Food-med = Medicine; birth-control pill, asthma medicine, medicine, penicillin, vaccine/ medisin eks: hodetabelett
 * +Sem/Fruit = Fruit and fruit-like edibles/ frukt,bær, salat
 * +Sem/Furn = Furniture; throne, chair, table, altar, trampoline
 * +Sem/Game = Game; biŋgo bingo, TV game, flipper, paintball, chess
 * +Sem/Geom = Geometrical object; triangle, triangle, tetrahedron, asymptote, star
 * +Sem/Group = Animal or Human Group; family, herd, group, indigenous people, delegation
 * +Sem/Hum = Human
 * +Sem/ID = ID
 * +Sem/Ideol = Ideology; nomadism, buddhism, feminism, christianity, fanaticism
 * +Sem/Lang = Language; South Sámi, mother tongue, Maori, Yiddish, second language
 * +Sem/Mal = Male name
 * +Sem/Mat = Material for producing things; paper, steel, wood, leather, wool/ eks: mineral, nikkel,plast, kalvskinn
 * +Sem/Measr = Measure; unit of volume, quarter meter, hour, minus degree, wátta watt
 * +Sem/Money = Has to do with money; wages, not Curr(ency), treasure, belongings, debt, food price, bill, pension / penger,depositum, gevinst, stipend
 * +Sem/Obj = Object; thing, cup, thing, toy, painting
 * +Sem/Obj-clo = Cloth; carpet, flag, curtain, silk sheets, napkin
 * +Sem/Obj-el = (Electrical) machine or apparatus; player, lamp, TV, radio, oven
 * +Sem/Obj-ling = Object with something written on it: kort,biletter
 * +Sem/Obj-play = Play object: ball eks:vollyball,fotball, snøball
 * +Sem/Obj-rope = flexible ropelike object; barbed wire, thread, rope, cable, dental floss
 * +Sem/Obj-surfc =  Surface object; blackboard, drawing paper, canvas, board (for playing board games), (money) bill
 * +Sem/Org = Organisation; newspaper, supreme court, company, museum, administration
 * +Sem/Part = Feature, part of something; half, part, percent, rest, tenth
 * +Sem/Perc-emo = Emotional perception; fear, feeling of identity, empathy, sadness, working motivation
 * +Sem/Perc-phys = Physical perception; shoulder pain, gass smell, sleep (during the night), need of sleep, hunger
 * +Sem/Plant = Plant; lichen, plant, cucumber, bluebell, poisonous mushroom
 * +Sem/Plantpart = Plant part; twig, leaf, root, seed, pine trunk
 * +Sem/Plc = Place; world, nature, airport, workplace, fireplace
 * +Sem/Plc-abstr = Abstract place; bachelor level, job market, third place, Troms website, address
 * +Sem/Plc-elevate = Elevated place; mountain, peak, mountain top, scree, volcano
 * +Sem/Plc-line = Place limitations; national border, border, finish line, stop line, equator
 * +Sem/Plc-water = Water; river, lake, polar sea, sea, well
 * +Sem/Pos = Position (as in social position job); 50% position, presidency, fixed position, kindergarten place, role in society
 * +Sem/Process = Process
 * +Sem/Prod = Product
 * +Sem/Prod-audio = Audio product; yoik, roar, Beatles song, Bible psalm, blues
 * +Sem/Prod-cogn = Cognition product; thought, decision, knowledge, lack of understanding, requirement
 * +Sem/Prod-ling = Linguistic product; message, question, agreement, translation, criticism
 * +Sem/Prod-vis = Visual product; picture, film, TV series, documentary, art
 * +Sem/Rel = Relation; relation, dependency, subordination, analogy, equivalence
 * +Sem/Route = Route-like place; street, path, corridor, bridge, winter path
 * +Sem/Rule = Rule or convention; cultural tradition, abortion law, EU rule, law of cosines, fair play
 * +Sem/Semcon = Abstract semantic concept; result, objective, reason, alternative, case
 * +Sem/Sign = Sign (e.g. numbers, punctuation); ID number, ČSV letters, quotation mark, hieroglyph, symbol
 * +Sem/State = State; hurry, captivity, anarchy, biodiversity, chaos
 * +Sem/State-sick = Illness; allergy, cold, autism, dementia, somnambulism
 * +Sem/Substnc = Substance; Water, sand, air, smoke, carbohydrate, vitamin, dust
 * +Sem/Sur = Surname
 * +Sem/Time = Time; áigi time, April, half an hour, Tuesday, deadline
 * +Sem/Time-clock = Time
 * +Sem/Tool = Prototypical tool for repairing things; axe, knife, fire striker, plastic hammer, wrench
 * +Sem/Tool-catch = Tool used for catching; artificial fly, fishing net for cod, fishing rod, lasso used in wintertime, mouse trap
 * +Sem/Tool-clean = Tool used for cleaning; broom, vegetable brush, toothbrush, cleaning equipment
 * +Sem/Tool-it = Tool used in IT/tool within IT; IT infrastructure, analyzer, searching function, computer program, browser
 * +Sem/Tool-music = Musical instrument; shaman drum, guitar, violin, musical instrument, jaw harp
 * +Sem/Tool-write = Writing tool; colored pen, pencil, chalk, paintbrush, paint
 * +Sem/Txt = Written document; paper, book, letter, e-mail, song
 * +Sem/Veh = Vehicle; car, boat, sled, vehicle, draft reindeer, bicycle
 * +Sem/Wpn = Weapon; rifle, bow, sword, arrow, war axe
 * +Sem/Wthr = The Weather or the state of ground; cloudy weather, wind, driving conditions, night sunlight, rain shower
 * +Sem/Year = year (i.e. 1000 - 2999), used only for numerals


Multiple Semantic tags

 * +Sem/Act_Domain =
 * +Sem/Act_Fruit = frukt og handling
 * +Sem/Act_Plc = handling og plass
 * +Sem/Act_Route = handling og vei
 * +Sem/Act_Event = Hendelse
 * +Sem/Act_Tool-it = hendelse og it verktøy
 * +Sem/Ani_Body-abstr_Hum = dyrekropp, abstrakt begrep på mennesker, menneske
 * +Sem/Ani_Buildpart = dyr og bygningsdel
 * +Sem/Ani_Group = gruppe med dyr
 * +Sem/Ani_Group_Hum =
 * +Sem/Ani_Hum =
 * +Sem/Ani_Obj-el =
 * +Sem/Ani_Plc_Txt =
 * +Sem/Ani_Time =
 * +Sem/Ani_Tool =
 * +Sem/Ani_Veh = dyr + kjöretöy eks hest
 * +Sem/Aniprod_Hum =
 * +Sem/Aniprod_Plc_Route =
 * +Sem/Body_Food =
 * +Sem/Body_Hum = kroppsdeler, mennesker
 * +Sem/Body_Mat = kroppsdeler og dudtjie matriell
 * +Sem/Body_Measr =
 * +Sem/Body_Obj_Tool-catch =
 * +Sem/Body_Plc =
 * +Sem/Body_Plc-elevate =
 * +Sem/Buildpart_Ctain_Obj =
 * +Sem/Build_Clthpart =
 * +Sem/Build_Edu_Org =
 * +Sem/Build_Org =
 * +Sem/Cat_Group_Hum_Plc =
 * +Sem/Clth-jewl_Curr =
 * +Sem/Clth-jewl_Curr_Obj =
 * +Sem/Ctain-abstr_Org =
 * +Sem/Ctain-clth_Plant =
 * +Sem/Ctain-clth_Veh =
 * +Sem/Ctain_Furn =
 * +Sem/Ctain_Tool =
 * +Sem/Curr_Obj =
 * +Sem/Domain_Hum =
 * +Sem/Domain_Money =
 * +Sem/Drink_Plant =
 * +Sem/Edu_Event = eks: seminar, søndagsskole
 * +Sem/Edu_Geom =
 * +Sem/Edu_Hum =
 * +Sem/Edu_Mat = utbildning og mat
 * +Sem/Edu_Org =
 * +Sem/Event_Plc-elevate =
 * +Sem/Feat-measr_Plc =
 * +Sem/Feat-phys_Tool-write =
 * +Sem/Feat-psych_Hum =
 * +Sem/Feat-psych_Plc =
 * +Sem/Feat_Plant =
 * +Sem/Food_Plant = tobakk
 * +Sem/Furn_Time =
 * +Sem/Game_Obj-play = leker eks: snøballkastning.sekkelek
 * +Sem/Geom_Obj =
 * +Sem/Group_Hum =
 * +Sem/Group_Hum_Plc = gruppe mennesker tilsammens eks: konfirmasjonsleir
 * +Sem/Group_Hum_Plc-abstr =
 * +Sem/Hum_Lang = human and language
 * +Sem/Hum_Lang_Plc = eks menneske, nord/sør, lulesamisk etc.
 * +Sem/Hum_Mat_Tool =
 * +Sem/Hum_Org = menneske og organisasjon
 * +Sem/Hum_Veh =
 * +Sem/Hum_Tool =
 * +Sem/Lang_Tool =
 * +Sem/Mat_Obj-clo =
 * +Sem/Mat_Plant = material, plante eks bomull
 * +Sem/Mat_Txt =
 * +Sem/Measr_Obj_Time =
 * +Sem/Measr_Sign =
 * +Sem/Measr_Time = år, mnd, uke, time, minutt
 * +Sem/Money_Obj =
 * +Sem/Obj-ling_Obj-surfc =
 * +Sem/Hum_Obj =
 * +Sem/Obj_State =
 * +Sem/Obj_Veh =
 * +Sem/Org_Plc =
 * +Sem/Org_Prod-audio =
 * +Sem/Org_Prod-cogn =
 * +Sem/Org_Prod-vis =
 * +Sem/Org_Rule =
 * +Sem/Org_Txt =
 * +Sem/Part_Prod-cogn =
 * +Sem/Plant_Plantpart =
 * +Sem/Plc-abstr_Route =
 * +Sem/Plc_Pos =
 * +Sem/Plc_Route =
 * +Sem/Plc_Substnc =
 * +Sem/Plc_Substnc_Wthr =
 * +Sem/Plc_Txt =
 * +Sem/Plc_Wthr =
 * +Sem/Prod-audio_Txt =
 * +Sem/Prod-cogn_Txt =
 * +Sem/Semcon_Wthr =
 * +Sem/Substnc_Wthr =
 * +Sem/Time_Wthr =
 * +Sem/Domain_Txt =

|              Tag | Explanation
|                    --- | ---
 |  +MWE | multi word expressions, goes to abbr

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.

|              Flag | Explanation
|                    --- | ---
 |  @P.Px.add@ | Giving possibility for Px-suffixes (all except from Nom 3.p)
 |  @R.Px.add@ | Requiring P.Px.add-flag for Px-suffixes (all except from Nom 3.p)
 |  @P.Nom3Px.add@ |  Giving possibility for Px-suffixes Nom 3.p
 |  @R.Nom3Px.add@ | Requiring P.Nom3Px.add flag for Px-suffixes Nom 3.p
 |  @P.Pmatch.Backtrack@ | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this poin in the form (to find combinations of shorter analyses that would otherwise be missed)
 |  @D.ErrOrth.ON@  | asdf
 |  @C.ErrOrth@ | asdf
 |  @P.ErrOrth.ON@ | asdf


## Derivation tags and derivation position tags in a derivation row

Derivations in the same position are mutually exclusive (can not be combined), whereas
tags in different positions can be combined, so that position 1 derivations must
precede position 2 derivations, and so on.


|    Pos1     | Pos2      | Pos3      | POS switches (from-to)| Explanation
| --- | --- | --- | --- | ---
 |  **+Der1** |            |            |      | Position tag, required
 |             | **+Der2** |            |      | Position tag, required
 |             |            | **+Der3** |      | Position tag, required
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
we tag all words that can't be correctly transcribed using the SMA
transcriber with source language codes. Once tagged, it is possible
to split the lexical transducer in smaller ones according to langu-
age, and apply different IPA conversion to each of them.
The principle of tagging is that we only tag to the extent needed,
and following a priority:
1. any untagged word is pronounced with SME orthographic conventions
1. NNO and NOB have identical pronunciation, NNO is only used if
different in spelling from NOB
1. SWE has mostly the same pronunciation as NOB, and is only used
if different in spelling from NOB
1. Occasionally even SME (the default) may be tagged, to block other
languages from being specified, mainly during semi-automatic
language tagging sessions
All in all, we want to get as much correctly transcribed to IPA
with as little work as possible. On the other hand, if more words
are tagged than strictly needed, this should pose no problem as
long as the IPA conversion is correct - at least some words will
get the same pronunciation whether read as SMA or NOB/NNO/SWE.

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
 %[%>%] - Literal >
 %[%<%] - Literal <
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

|                    Trigger | Explanation
|                        --- | ---
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
 |  ∑ | Symbol used before `#` and `-` in dynamic compounds, and only there. Used to block optional conversion of word boundaries to spaces for error detection in grammar checkers. That is, dynamic compounds are not allowed to be written appart for error detection, only lexicalised ones. This is done to reduce the amound of ambiguity in the raw analyses to an amount we can cope with.



## Flag diacritics
We have manually optimised the structure of our lexicon using the following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:

|                         Flag | Explanation
|                          --- | ---
 |  @P.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
 |  @D.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
 |  @C.NeedNoun@ | (Dis)allow compounds with verbs unless nominalised


For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.

|                        Flag | Explanation
|                         --- | ---
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

|                         Flag | Explanation
|                          --- | ---
 |  @U.Cap.Obl@ | Allowing downcasing of derived names: deatnulasj.
 |  @U.Cap.Opt@ | Allowing downcasing of derived names: deatnulasj.

The following flag diacritics are used by the grammar checker.

|                         Flag | Explanation
|                          --- | ---
 | @R.SpellRlx.ON@ | Flag used to tag spell-relax-analysed strings (and only those).
 | @D.SpellRlx.ON@ | Flag used to tag spell-relax-analysed strings (and only those).
 | @C.SpellRlx@ | Flag used to tag spell-relax-analysed strings (and only those).
 | @P.Pmatch.Loc@ | Used on multi-token analyses; tell hfst-tokenise/pmatch where in the form/analysis the token should be split.
 | @P.Pmatch.Backtrack@ | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)


# Lexicon Root
This is the beginning of everything. The **Root** lexicon is reserved in the
LexC language, and must be the first lexicon defined.

Here is the list of top-level lexica in the sma analyser


 * `NounRoot ;`
 * `Verb ;`
 * `Adjective ;`
 * `Pronoun ;`
 * `Adverb ;`
 * `Subjunction ;`
 * `Conjunction ;`
 * `Particle ;`
 * `Adposition ;`
 * `Punctuation ;`
 * `Symbols ;`
 * `Interjection ;`
 * `+Use/CircN: Numeral ;`
 * `Abbreviation ;`
 * `Acronym ;`
 * `ProperNoun ;`






# Lexicon ENDLEX
And this is the ENDLEX of everything:
```
 @D.CmpOnly.FALSE@@D.CmpPref.TRUE@@D.NeedNoun.ON@ ENDLEX2 ;
```
The `@D.CmpOnly.FALSE@` flag diacritic is ued to disallow words tagged
with +CmpNP/Only to end here.
The `@D.NeedNoun.ON@` flag diacritic is used to block illegal compounds.

* * *
<small>This (part of) documentation was generated from [../src/fst/root.lexc](http://github.com/giellalt/lang-sma/blob/main/../src/fst/root.lexc)</small>