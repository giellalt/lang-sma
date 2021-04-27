Her er eit oversyn over fst-ane som skal bli kompilert og eigenskapane deira.
Sjå også [eit tilsvarande oversyn for sme](../sme/KompilereFST.html)

|         FST            | obligatoriske                                           |  valgfrie
| --- | --- | --- 
|  analyser-dict-gt-norm  | Hom1, Hom2, v1, v2, v3, v4, v5, Use/NGminip            | IV, TV
|  analyser-gt-norm       |                        -                               | Hom1, Hom2,  IV, TV, v1, v2, v3, v4, v5,Use/NGminip    
|  analyser-oahpa-gt-norm | Hom1, Hom2                                             |  IV, TV, v1, v2, v3, v4, v5, Use/NGminip
|  generator-SH.restr-gt-norm | = analyser-oahpa-gt-norm,  men \\ Use/NG og Dial/-SH skal ikke med i kompileringa | -  
|  generator-L.restr-gt-norm  | = analyser-oahpa-gt-norm,  men \\ Use/NG og Dial/-L skal ikke med  i kompileringa | -  
|  generator-mt-gt-norm       |  -       | -
|  generator-mt-apertium-norm | = mt-gt, men med apertium-taggar | -

Dagens fst-ar i src:

* generator-dict-gt-desc.xfst
* generator-dict-gt-norm.xfst
* generator-gt-desc.xfst
* generator-gt-norm.xfst
* analyser-dict-gt-desc.xfst
* analyser-dict-gt-norm.xfst
* analyser-gt-desc.xfst
* analyser-gt-norm.xfst
* analyser-raw-gt-desc.xfst
