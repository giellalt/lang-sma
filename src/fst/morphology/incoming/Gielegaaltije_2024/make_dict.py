#!/usr/bin/env python3
"""Convert a list of words to a dictionary XML file.

Instructions:

1. run python3 -m venv venv
2. source venv/bin/activate
3. pip install lxml
4. python make_dict.py

This will create files like S-smamul.xml, V-smamul.xml, A-smamul.xml, and Phrase-smamul.xml.

To create missing files, run:
./make_missing.sh

This will create files like S-missing.txt, V-missing.txt, A-missing.txt, and Phrase-missing.txt.
"""

from pathlib import Path
from lxml import etree  # type: ignore
import re


def is_pos(part):
    return any(part.startswith(pos) for pos in ["S", "V", "A", "MWE"])


def make_dict_entries(groups):
    pos = get_real_pos(groups.get("pos"))
    del groups["pos"]

    sma_result = handle_sma(groups.get("sma"))
    del groups["sma"]

    for result_type, lemmas in sma_result.items():
        for lemma in sorted(lemmas):
            this_pos = "Phrase" if " " in lemma else pos
            dict_entry = etree.Element("e")
            lemma_group = etree.SubElement(dict_entry, "lg")
            lemma_element = etree.SubElement(lemma_group, "l")
            lemma_element.text = lemma
            lemma_element.set("pos", this_pos)
            if result_type != "sma_text":
                lemma_element.set("xxx", result_type)

            for language, parts in groups.items():
                for comma_part in parts:
                    if comma_part.strip():
                        meaning_group = etree.SubElement(dict_entry, "mg")
                        translation_group = etree.SubElement(meaning_group, "tg")
                        translation = etree.SubElement(translation_group, "t")
                        text = comma_part.strip()
                        translation.text = text
                        translation.set("pos", "Phrase" if " " in text else pos)
                        for remaining_lemma in [
                            this_lemma for this_lemma in lemmas if this_lemma != lemma
                        ]:
                            l_ref = etree.SubElement(translation_group, "l_ref")
                            l_ref_pos = "Phrase" if " " in remaining_lemma else pos
                            l_ref.text = f"{remaining_lemma.replace(' ', '_')}_{l_ref_pos.lower()}"
                        translation_group.set(
                            "{http://www.w3.org/XML/1998/namespace}lang",
                            get_real_language(language),
                        )
            yield this_pos, dict_entry


def handle_sma(sma_text: str):
    type_patterns = r"(.*?)\((attr|pred|transitiv|passiv)\)"
    types = re.findall(type_patterns, sma_text)

    if not types:
        return {
            "sma_text": [
                part.strip() for part in sma_text.lower().split(",") if part.strip()
            ]
        }

    return {
        sma_type: [part.strip() for part in text.lower().split(",") if part.strip()]
        for text, sma_type in types
    }


def get_real_pos(original_pos):
    match original_pos:
        case "S":
            return "N"
        case "V":
            return "V"
        case "A":
            return "A"
        case "MWE":
            return "Phrase"
        case _:
            raise SystemExit(f"unknown pos: {original_pos}")


def get_real_language(original_lang_code):
    match original_lang_code:
        case "nb":
            return "nob"
        case "sv":
            return "swe"
        case "lat":
            return "lat"
        case "eng":
            return "eng"
        case _:
            raise SystemExit(f"unknown language: {original_lang_code}")


def extract_language_parts(line: str):
    # Regex capturing "front part" (pos) "then possibly other lang codes"
    pattern = r"^(.*?)\((S|V|A|MWE)\)\s*(.*)$"
    match = re.match(pattern, line)
    if not match:
        return {}
    sma_part, pos_code, rest = match.groups()
    result = {"pos": pos_code, "sma": sma_part}

    # Find language parts like "(nb)", "(sv)", "(lat)", "(eng)"
    lang_pattern = r"(.*?)\((nb|sv|lat|eng)\)"
    translations = re.findall(lang_pattern, rest)
    for text, lang_code in translations:
        result[lang_code] = text.lower().split(",")

    return result


def main():
    dicts = {}
    lines = (
        line.replace("•", "").strip()
        for line in Path("MISSING_List_24.txt").read_text().splitlines()
        if line.startswith("•")
    )
    for line in lines:
        result = extract_language_parts(line)
        for pos, dict_entry in make_dict_entries(result):
            dicts.setdefault(pos, etree.Element("r")).append(dict_entry)

    for pos in dicts:
        Path(f"{pos}-smamul.xml").write_text(
            etree.tostring(dicts[pos], pretty_print=True, encoding="unicode")
        )


if __name__ == "__main__":
    main()
