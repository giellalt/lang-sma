


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
The **PRED_S** lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>s FINAL1 ; 
```

 # LEXICON PRED_0
The **PRED_0** lexicon is used for adjectives Predicatives.
```
  +Sg+Nom: FINAL1 ; 
```

 # LEXICON PRED_H
The **PRED_H!!≈** lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>h FINAL1 ; 
```


denne skal også ut ! - --> intersatn om dette er en norsk suffiks egentlig?
 # LEXICON PRED_NE_ODD
The **PRED_NE_ODD!!≈** lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>ne FINAL1     ; 
          :n     ODDCASEOBL ; 
          :n     ODDCOMP    ; 
```

 # LEXICON PRED_N    -  GENITIV
The **PRED_N!!≈** lexicon is used for adjectives Predicatives.
```
  +Sg+Nom:%>n FINAL1 ; 

```











 # LEXICON e_E_EVEN
The **e_E_EVEN!!≈** lexicon is used for adjectives on `–e` and `–e`  In attributes and predicatives.With EVEN-NOCOMP.
```
       :e ATTR_0      ; 
       :e PRED_0      ; 
  +Sg:  NIEJTESGOBL ; 
  +Pl:  NIEJTE_PL   ; 
       NIEJTEREST  ; 
       :e EVENCOMP    ; 
```

 # LEXICON e_E_EVENNOCOMP1
The **e_E_EVENNOCOMP1!!≈** lexicon is used for adjectives on `–e` and `–e` stem. In attributes and predicatives.With EVEN-NOCOMP.

```
       :e ATTR_0      ; 
       :e PRED_0      ; 
  +Sg:  NIEJTESGOBL ; 
  ! +Sg:  NIEJTESGOBL ; 
  +Pl:  NIEJTE_PL   ; 
       NIEJTEREST  ; 
```


 # LEXICON a_A_EVEN1
The **a_A_EVEN1!!≈** lexicon is used for adjectives on `–a` and `–a`  In attributes and predicatives.With EVEN-COMP.
```
       :a ATTR_0     ; 
  +Sg:  MAANASGNOM ; 
       MAANAOBL   ; 
       :a EVENCOMP   ; 
```

 # LEXICON as_AS_EVEN1 ! Disse har opprinnelig vært as_a_EVEN_adjektiv
The **as_AS_EVEN1!!≈** lexicon is used for adjectives on `–as` and `–as`  In attributes and predicatives.With EVEN-COMP.
```
               :a  ATTR_S   ; 
      +Sg+Nom:as FINAL1   ; 
   +Cmp/SgNom:as R        ; 
```


 # LEXICON ie_IE_EVEN1
The **ie_IE_EVEN1!!≈** lexicon is used for adjectives on `–ie` and `–ie`  In attributes and predicatives.With EVEN-COMP.
```
    :ie ATTR_0     ; 
     N_IE_FORMS ; 
    :ie EVENCOMP   ; 
```


 # LEXICON ie_IE_EVENNOCOMP
The **ie_IE_EVENNOCOMP!!≈** lexicon is used for adjectives on `–ie` and `–ie`  In attributes and predicatives. With EVEN-COMP.
```
    :ie ATTR_0     ; 
     N_IE_FORMS ; 
```

The **a_A_EVEN1_NOCOMP** lexicon is used for adjectives on `–ie` and `–ie`  In attributes and predicatives. With EVEN-COMP.
```
       :a ATTR_0     ; 
```

 # LEXICON es_ES_EVEN
The **es_ES_EVEN!!≈** lexicon is used for adjectives on `–es` and `–es`  In attributes and predicatives. With EVEN-COMP.
```
            :e      ATTR_S       ; 
            :e      PRED_S       ; 
            :e      EVENCOMP     ; 
```





The **es_ES_EVENNOCOMP1** lexicon is used for adjectives on `–es` and `–es`  In attributes and predicatives. With EVEN-NOCOMP.

```
  :e  ATTR_S     ; 
  :e  PRED_S     ; 
  :es ODDCASEOBL ; 
```


The **ies_IES_EVEN1** lexicon is used for adjectives on `–ies` and `–ies`  In attributes and predicatives. With EVEN-COMP.
```
      ies_IES_EVENNOCOMP1 ; 
  :ie EVENCOMP            ; 
```


The **ies_IES_EVENNOCOMP1** lexicon is used for adjectives on `–ies` and `–ies`  In attributes and predicatives. With EVEN-NOCOMP.
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












































































 * **LEXICON s_H_EVENNOCOMP   **






























 :ijl e_E_EVEN ;




* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/adjectives.lexc](http://github.com/giellalt/lang-sma/blob/main/../src/fst/affixes/adjectives.lexc)</small>