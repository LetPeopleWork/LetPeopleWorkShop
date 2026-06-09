# SPIKE Findings — workshop-designer

> **Promoted on 2026-06-09** into the walking skeleton (commit `feat(workshop-designer): walking skeleton`). Probe dir deleted.

## Assumption tested
A *thin* curated library of Liberating Structures + Training-from-the-BACK-of-the-Room practices,
fed to a designer, can ground a complete, time-reconciled, **runnable** workshop design from a real
brief — for a politically sensitive session — without leaking the convener's pre-baked solution.

## Probe setup
- Real brief: cross-team-collaboration Session 1 (4-5 POs, spicy power dynamics, 90-120 min in-person).
- Hand-authored candidate library: 6 practice files (`impromptu-networking`, `1-2-4-all`, `triz`,
  `what-so-what-now-what`, `wicked-questions`, `tbr-concrete-practice`).
- Produced one `design.md`: framed agenda (~110 min), per-structure rationale, time reconciliation
  (90/110/120 variants), facilitator notes targeting the power dynamics, grounding check.
- Location: `/tmp/spike_workshop-designer/` (throwaway until promotion).
- No performance budget (mechanism + value probe, not timing).

## Verdict: WORKS (mechanism) — value verdict pending facilitator judgment
- **Grounding works:** every structure in the agenda maps to a practice file; the "grounding check"
  is mechanically enforceable (5/5 cited).
- **Format works:** the brief → design shape produced a runnable artifact — timed table, purpose per
  block, time-box reconciliation with explicit trim/expand variants, and design stance.
- **The hard part (neutrality under a charged topic) is expressible:** the design encoded
  lead-with-problems, silent-write-first to protect dissent, depersonalize-via-TRIZ, convener-as-peer,
  and no-premature-commitment — all traceable to specific practices. This is the real value signal:
  the library didn't just list activities, it shaped a *politically aware* sequence.

## Candidate practice-file shape (validated)
`name · source(+link) · purpose · when-to-use · group config · timing(+trim) · medium fit (in-person/Miro/video) · steps · facilitator notes`
→ Worked well. The **medium fit** and **facilitator notes** fields did the heavy lifting; keep them mandatory.

## Candidate design.md shape (validated)
`goal · design stance (why) · agenda table (time/block/structure+citation/purpose) · time reconciliation (trim & expand) · facilitator notes · grounding check · reuse rating footer`

## Edge cases / design implications for DESIGN
1. **Grounding must be enforceable, not aspirational.** Every agenda structure cites a `practices/*`
   file; the designer should refuse (or flag) a structure with no backing file. → AC1 stands.
2. **Time reconciliation needs both directions** (trim to floor, expand to ceiling) — a single total
   isn't enough; facilitators flex live. Designer should always emit a 90/110/120-style band.
3. **Alternative structures matter.** The design offered TRIZ *or* Wicked Questions keyed to room mood.
   `design.md` should support a "swap if…" note, not a single rigid path.
4. **Brief sensitivities are first-class input.** The political constraints drove the whole design.
   The brief template must capture "sensitivities / constraints" prominently, not as an afterthought.
5. **Convener-vs-facilitator neutrality** is a recurring concern for this user's work → consider a
   reusable "facilitator stance" checklist practice later.
6. **Public/private split (D6):** `design.md` lands in a gitignored `workshops/<slug>/`; `practices/`
   and templates are committed. Walking skeleton must establish this directory split + `.gitignore`.

## Open question for the facilitator (promotion gate)
Is the produced `design.md` something you'd actually walk in and run (as-is / minor edits)? That answer
is the real WORKS/DOESN'T verdict for *value* — see promotion gate.
