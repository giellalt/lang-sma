#!/usr/bin/env python3

from collections import defaultdict
from pathlib import Path
from lxml import etree  # type: ignore


def is_pos(part):
    return any(part.startswith(pos) for pos in ["(S)", "(V)", "(A)", "(MWE)"])


def make_language_groups(parts):
    groups = defaultdict(list)
    for part in parts:
        if part.startswith("("):
            part = part.replace(",", "")
            if "," in part:
                raise SystemExit(part, part.replace(",", ""))
            if part in ["(sv)", "(nb)", "(lat)", "(eng)"]:
                group = part
            elif is_pos(part):
                group = "sma"
                groups[group].append(part)
            else:
                groups[group].append(part)
        else:
            groups[group].append(part.lower())

    return groups


def create_sma_groups(parts):
    groups = defaultdict(list)
    for part in parts:
        if is_pos(part):
            group = part.replace(",", "")
        else:
            groups[group].append(part.lower())

    return groups


def handle_line(line):
    for pos, dict_entry in make_dict_entries(
        make_language_groups(reversed(line.split()))
    ):
        orig = etree.SubElement(dict_entry, "orig")
        orig.text = line.strip()
        yield pos, dict_entry


def make_dict_entries(groups):
    for pos, lemmas in handle_sma(groups["sma"]):
        if "sma" in groups:
            del groups["sma"]

        for lemma in sorted(lemmas):
            this_pos = "Phrase" if " " in lemma else pos
            dict_entry = etree.Element("e")
            lemma_group = etree.SubElement(dict_entry, "lg")
            lemma_element = etree.SubElement(lemma_group, "l")
            lemma_element.text = lemma
            lemma_element.set("pos", this_pos)

            for group, parts in groups.items():
                text = " ".join(reversed(parts))
                for comma_part in text.split(","):
                    if comma_part.strip():
                        translation_group = etree.SubElement(dict_entry, "tg")
                        for remaining_lemma in [
                            this_lemma
                            for this_lemma in lemmas
                            if this_lemma != lemma_element.text
                        ]:
                            l_ref = etree.SubElement(translation_group, "l_ref")
                            l_ref_pos = "Phrase" if " " in remaining_lemma else pos
                            l_ref.text = f"{remaining_lemma.replace(' ', '_')}_{l_ref_pos.lower()}"
                        translation_group.set("lang", group[1:-1])
                        translation = etree.SubElement(translation_group, "t")
                        translation.set("pos", this_pos)
                        translation.text = comma_part.strip()
            yield this_pos, dict_entry


def handle_sma(parts):
    for group, parts in create_sma_groups(parts).items():
        text = " ".join(reversed(parts))
        yield get_real_pos(group), {
            comma_part.strip() for comma_part in text.split(",") if comma_part.strip()
        }


def get_real_pos(group):
    match group:
        case "(S)":
            return "N"
        case "(V)":
            return "V"
        case "(A)":
            return "A"
        case "(MWE)":
            return "Phrase"
        case _:
            raise SystemExit(f"unknown pos: {group}")


def main():
    dicts = {}
    for line in Path("MISSING_List_24.txt").read_text().splitlines():
        if line.startswith("•"):
            for pos, dict_entry in handle_line(line.replace("•", "").strip()):
                dicts.setdefault(pos, etree.Element("r")).append(dict_entry)

    for pos in dicts:
        Path(f"{pos}-smamul.xml").write_text(
            etree.tostring(dicts[pos], pretty_print=True, encoding="unicode")
        )


if __name__ == "__main__":
    main()
