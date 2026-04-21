#!/usr/bin/env python3
from copy import deepcopy
import os
from pathlib import Path
from lxml import etree  # type: ignore


def main():
    dict_smamul = Path(os.getenv("GTLANGS")) / "dict-sma-mul" / "src"
    for path in Path(".").glob("*.xml"):
        this_name = path.name
        orig_path = dict_smamul / this_name
        orig_tree = etree.parse(orig_path)
        orig_root = orig_tree.getroot()
        orig_lemmas = {orig_lemma.text for orig_lemma in orig_tree.iter("l")}
        this_tree = etree.parse(path)
        for entry in this_tree.iter("e"):
            lemma_element = entry.find("lg/l")
            lemma = lemma_element.text
            if lemma not in orig_lemmas:
                orig_root.append(deepcopy(entry))
                entry.getparent().remove(entry)
            else:
                print(f"Skipping {lemma} in {this_name}")
        path.write_text(
            etree.tostring(this_tree, encoding="unicode", pretty_print=True)
        )
        orig_path.write_text(
            etree.tostring(orig_tree, encoding="unicode", pretty_print=True)
        )


if __name__ == "__main__":
    main()
