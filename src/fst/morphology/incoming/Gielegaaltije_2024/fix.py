#!/usr/bin/env python3

from collections import defaultdict
from pathlib import Path
from lxml import etree


def create_groups(parts):
    groups = defaultdict(list)
    for part in parts:
        if part.startswith("("):
            part = part.replace(",", "")
            if "," in part:
                raise SystemExit(part, part.replace(",", ""))
            if part in ["(sv)", "(nb)", "(lat)", "(eng)"]:
                group = part
            else:
                group = "sma"
                groups[group].append(part)
        else:
            groups[group].append(part.lower())

    return groups


def create_sma_groups(parts):
    groups = defaultdict(list)
    for part in parts:
        if part.startswith("("):
            part = part.replace(",", "")
            if "," in part:
                raise SystemExit(part, part.replace(",", ""))
            group = part
        else:
            groups[group].append(part.lower())

    return groups


def handle_line(line):
    groups = create_groups(reversed(line.split()))
    handle_groups(groups)


def handle_groups(groups):
    dict_entry = etree.Element("e")
    handle_sma(groups["sma"])
    del groups["sma"]
    for group, parts in groups.items():
        print(group, " ".join(reversed(parts)))
    print()


def handle_sma(parts):
    lemma_groups = []
    print(" ".join(reversed(parts)))
    groups = create_sma_groups(parts)
    for group, parts in groups.items():
        lemma_group = etree.Element("lg")
        lemma_group.text = " ".join(reversed(parts))
        match group:
            case "(S)":
                lemma_group.set("pos", "N")
            case "(V)":
                lemma_group.set("pos", "V")
            case "(Adj)":
                lemma_group.set("pos", "A")
            case "(attr)":
                lemma_group.set("pos", "A")
            case "(MWH)":
                lemma_group.set("pos", "Phrase")
            case _:
                raise SystemExit(f"unknown pos: {group}")
        print(group, " ".join(reversed(parts)))
    print()
    return lemma_groups


for nr, line in enumerate(
    Path("MISSING_List_24.txt").read_text().splitlines(), start=1
):
    if line.startswith("•"):
        try:
            handle_line(line.replace("•", "").strip())
        except UnboundLocalError:
            raise SystemExit(f"UnboundLocalError {nr}: {line}")
