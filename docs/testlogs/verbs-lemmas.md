# Lemma-tests for *verbs* in ...`verbs.lexc`


**beertedh** failures:

* `beertedh+V+Inf` does not generate!
* `beertedh` has no analyses either

**beertesovvedh** failures:

* `beertesovvedh+V+Inf` does not generate!
* `beertesovvedh` has no analyses either

## Lemma statistics
* 10672 lemmas
* 99.96251874062968 % success

## Settings used

```json
{
    "adjectives": {
        "lemmatags": [
            "+A+Sg+Nom"
        ],
        "lexcfile": ".../adjectives.lexc"
    },
    "analyser": ".../analyser-gt-norm.hfstol",
    "generator": ".../generator-gt-norm.hfstol",
    "nouns": {
        "exclusions": [
            "(CmpN/Only|\\+Gen\\+|\\+Der\\+|\\+CmpN/Suff|\\+Use/MT)"
        ],
        "lemmatags": [
            "+N+Sg+Nom",
            "+N+Pl+Nom"
        ],
        "lexcfile": ".../nouns.lexc"
    },
    "propernouns": {
        "lemmatags": [
            "+N+Prop+Sg+Nom"
        ],
        "lexcfile": ".../propernouns.lexc"
    },
    "verbs": {
        "exclusions": [
            "(NEG|LEA|Use/Mt)"
        ],
        "lemmatags": [
            "+V+Inf"
        ],
        "lexcfile": ".../verbs.lexc"
    }
}
```
