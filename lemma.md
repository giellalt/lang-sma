# Prinsipp for lemmatisering av sørsamisk

## -land vs. -laante

Det er variasjon mellom *Bergsland, Bergslaante, Småland, Smålaante* i sørsamisk tekst. Her er politikken for leksikonet 

1. Forma i leksikon er *Bergslaante:Bergs^ LAANTE-sur ;*
1. Lemma er *Bergslaante, Smålaante*
1. Forma *-land* i **Nom Sg** blir merka **+Use/NG**
1. Former på *-land* i oblike former blir merka **+Err/Orth**

## Lemma som ikkje skal inn i stavekontrollen - +Err/Lex

Bakgrunnen for dette er ord i leksikon som ikkje er skal inn i stavekontrollen, men som likevel skal bli generert. Døme på slike ord er *cubanske, juni*.

Desse blir merka med *+Err/Lex* i leksikon. Dei kjem med i genereringsfilene, men ikkje i den normative fila.

## Leksikalsk homonymi: identifisere riktig lemma

Lemmaene er homonyme, men det er samantisk forskjell og forskjellige bøyningsparadigmer. I nordsamisk skiller vi de fleste med G3- og Actor-tagger, fordi det er systematikk for store grupper av lemmaer. Når det er snakk om enkelttilfeller, gir vi disse arbitrære taggar `+Hom1, +Hom2, …` (nummerert oppover ad lib).
Taggane blir lagt inn i leksikon før POS, men burde flyttast til etter POS 
i kompileringa.

* Eksempler:
    - govledh+Hom1  - kl. IV å høre
    - govledh+Hom2  - kl. V å høres

## Varianter under samme lemma: sortere bøyningsformer til riktig grunnform - v1, v2 osv

Ortografiske varianter av samme lemma, dvs. grunnform og ihvertfall deler av bøyingsparadigmet, bør i fst sorteres under samme lemma. Men vi legger til en tag for å kunne sortere bøyningsparadigmene til riktig grunnform.

Vi brukar taggane `+v1, +v2, …` (nummerert oppover ad lib) for å skille mellom
de ulike paradigmene.

* Eksempler:
    - rektore+v1:rektore
    - rektore+v2:rektovre

Hvis grunnformen er den samme, men det er to mulige bøyningsparadigmer, bruker vi ikke denne merkinga.
