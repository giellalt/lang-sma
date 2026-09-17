import * as cg3 from "./.divvun-rt/cg3.ts";
import * as divvun from "./.divvun-rt/divvun.ts";
import * as hfst from "./.divvun-rt/hfst.ts";
import { Command, StringEntry } from "./.divvun-rt/mod.ts";
import type { SpellerConfig } from "./.divvun-rt/divvun.ts";
import spellerBase from "../spellcheckers/config.json" with { type: "json" };

// The tuned speller config, imported live from tools/spellcheckers/config.json.
// Kept in the wire format the runtime deserializes: an override must use the
// same spelling as the key it replaces, or the spread keeps both and the
// runtime rejects the pair as a duplicate field.
const SPELLER_BASE = spellerBase;

// Where this harness departs from the tuned speller, and only there. The
// effective values are the same ones the hand-written copy this replaced set,
// so the A/B measures what it measured before.
//
// Deliberately not annotated with SpellerConfig: the bindings are regenerated
// by whichever divvun-runtime built the bundle, and annotating makes this
// literal fail on any builder whose bindings predate a field named here.
const spellerConfig = {
    ...SPELLER_BASE,
    // Matches the grammar checker pipeline's beam, so the A/B compares CG
    // filtering rather than search width. Pre-existing value, wider than the
    // tuned base - needs evaluation.
    beam: 19.0,
};

// Baseline: speller output with no CG filtering at all, for the A/B.
export function spellOnly_dev(entry: StringEntry): Command {
    let x = hfst.tokenize("tokenize", entry, { model_path: "@./tokeniser-gramcheck-gt-desc.pmhfst" });
    x = divvun.blanktag("whitespace", x, { model_path: "@./analyser-gt-whitespace.hfst" });
    x = cg3.vislcg3("err-to-unknown", x, { model_path: "@./err-to-unknown.bin" });
    x = divvun.cgspell("speller", x, {
        acc_model_path: "@./acceptor.default.hfst",
        err_model_path: "@./errmodel.default.hfst",
        config: spellerConfig as unknown as SpellerConfig,
    });
    x = cg3.vislcg3("spell-emit", x, { model_path: "@./spell-emit.bin" });
    return divvun.suggest("suggestions", x, { model_path: "@./generator-gramcheck-gt-norm.hfstol" });
}

// The same, with the context disambiguated and spellchecker.cg3 applied.
export function spellCg_dev(entry: StringEntry): Command {
    let x = hfst.tokenize("tokenize", entry, { model_path: "@./tokeniser-gramcheck-gt-desc.pmhfst" });
    x = divvun.blanktag("whitespace", x, { model_path: "@./analyser-gt-whitespace.hfst" });
    x = cg3.vislcg3("err-to-unknown", x, { model_path: "@./err-to-unknown.bin" });
    x = divvun.cgspell("speller", x, {
        acc_model_path: "@./acceptor.default.hfst",
        err_model_path: "@./errmodel.default.hfst",
        config: spellerConfig as unknown as SpellerConfig,
    });
    x = cg3.vislcg3("postspell-valency", x, { model_path: "@./valency-postspell.bin" });
    // grc-disambiguator PROTECTs <spelled>, so this disambiguates the context
    // around the suggestions without deleting the suggestions themselves.
    // Measured on sme, the de-PROTECTed variant cut candidate lists from 22 to
    // 3.4 and took the gold with them in 348 of 600 rows: CG assumes a cohort's
    // readings are competing analyses of one word, whereas speller suggestions
    // are competing words, so SELECT deletes vocabulary rather than choosing.
    x = cg3.vislcg3("grc-disamb", x, { model_path: "@./grc-disambiguator.bin" });
    x = cg3.vislcg3("spell-sugg-filtering", x, { model_path: "@./spellchecker.bin" });
    x = cg3.vislcg3("spell-emit", x, { model_path: "@./spell-emit.bin" });
    return divvun.suggest("suggestions", x, { model_path: "@./generator-gramcheck-gt-norm.hfstol" });
}
