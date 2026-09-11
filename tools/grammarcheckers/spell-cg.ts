import * as cg3 from "./.divvun-rt/cg3.ts";
import * as divvun from "./.divvun-rt/divvun.ts";
import * as hfst from "./.divvun-rt/hfst.ts";
import { Command, StringEntry } from "./.divvun-rt/mod.ts";

// A speller, not a grammar checker.
//
// The question is whether CG context can improve the speller's ranking. That
// cannot be asked of the grammar checker pipeline: its tokeniser-analyser is
// descriptive and recognises many misspellings outright as Err/..., so they are
// corrected normatively and never reach the speller at all.
//
// So: tokenise, put the Err-only cohorts back on the speller's footing, spell
// them, then disambiguate the CONTEXT while leaving the suggestions alone, and
// only then let spellchecker.cg3 filter them.
//
// The tuned speller config, from tools/spellcheckers/config.json. It is copied
// in rather than imported because divvun-runtime relocates a pipeline's source
// into a temporary directory before bundling it, where no relative import
// resolves. Regenerate after retuning the speller:
//
//     deno run --allow-read --allow-write sync-speller-config.ts
//
// snake_case: SpellerConfig deserializes kebab-case but carries serde aliases
// for these names, and the generated TypeScript bindings declare them this way.
// --- BEGIN GENERATED from tools/spellcheckers/config.json ---
const SPELLER_BASE = {
    n_best: 100,
    max_weight: 10000,
    beam: 14,
    reweight: {
        start_penalty: 3,
        mid_penalty: 1,
        end_penalty: 1,
    },
    node_pool_size: 128,
    recase: true,
};
// --- END GENERATED ---

// Where this harness departs from the tuned speller, and only there. The
// effective values are the same ones the hand-written copy this replaced set,
// so the A/B measures what it measured before.
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
        config: spellerConfig,
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
        config: spellerConfig,
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
