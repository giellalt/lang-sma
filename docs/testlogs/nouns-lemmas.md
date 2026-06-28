# Lemma-tests for *nouns* in ...`nouns.lexc`


## Lemma statistics
* 20230 lemmas
* 100.0 % success

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
