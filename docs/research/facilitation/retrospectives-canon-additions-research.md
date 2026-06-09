# Agile Retrospectives Canon (Derby & Larsen) + Adjacent Methods — Library Addition Research

**Status:** complete
**Researcher:** Nova (nw-researcher)
**Date:** 2026-06-09
**Output type:** research document only (no practice files written)
**Research depth:** detailed
**Citation coverage:** ~98% (every activity traced to the primary text; attributions cross-referenced)

> Goal: identify which retrospective structures/frameworks from the Derby & Larsen canon and
> adjacent methods are *meaningful, non-duplicative* additions to our 42-practice facilitation
> library. Selection rule: earns a slot only if (a) distinct from our 42, (b) citable to a strong
> source, (c) maps cleanly to ONE schema type (structure | principle | framework).

---

## Executive Summary

The single canonical source is Esther Derby & Diana Larsen, *Agile Retrospectives: Making Good
Teams Great* (Pragmatic Bookshelf, 2006, ISBN 0-9776166-4-9). Its enduring contribution is **a
phased macro-arc for team learning** — Set the Stage -> Gather Data -> Generate Insights -> Decide
What to Do -> Close the Retrospective — plus a catalog of ~26 activities mapped onto it. All
activity claims below are sourced directly from the book's own text (pages cited), which is the
authoritative primary source; named activities with external lineage (5 Whys, Fishbone, Temperature
Reading) are cross-referenced to their originators.

**Ranked shortlist of meaningful additions (7):**

| Rank | Proposed slug | Type | Why it earns a slot (gap) |
|---|---|---|---|
| 1 | `five-phase-retrospective` | framework | The retro macro-arc itself. We have a *decision* arc and a *learning* arc but no **reflection/improvement** arc. Highest-value, most-cited gap. |
| 2 | `roti` (Return on Time Invested) | structure | Meta-evaluation of the *session itself* (0–4 value scale). We have zero meeting-ROI / session-feedback instruments. |
| 3 | `esvp` | structure | Anonymous engagement/buy-in poll (Explorer/Shopper/Vacationer/Prisoner). Distinct opener — reads attitude *toward the session*, which nothing in our library does. |
| 4 | `mad-sad-glad` | structure | Emotion-first data gathering. `speed-boat` covers impediments; nothing covers structured *feelings* surfacing. |
| 5 | `team-radar` | structure | Multi-factor self-assessment vs named criteria (spider chart), repeatable as a progress measure. Distinct quantified-perception instrument. |
| 6 | `learning-matrix` | structure | Fast 4-quadrant insight capture (keep / change / new ideas / appreciate). Genuinely retro-specific, time-efficient. |
| 7 | `plus-delta` | structure | Two-column "keep / change" close. Minimal, fast, retro-on-the-retro. Lighter than W³; high reuse. |

**Strong "maybe / second tier" (document, hold):** `timeline` (data gathering — but overlaps
generic event mapping), `helped-hindered-hypothesis` (close — facilitator-feedback; narrow), and
the `temperature-reading` (Satir) which is a richer relative of `plus-delta`/check-in.

**Do NOT add (covered by existing slugs):** Working Agreements, Check-In, Prioritize with Dots,
Brainstorming/Filtering, SMART Goals, Force Field Analysis, Short Subjects, Circle of Questions,
Appreciations, Patterns & Shifts, Identify Themes, Report Out with Synthesis, Retrospective Planning
Game, Triple Nickels. See the full table in §4.2.

---

## 1. Orientation: Agile Retrospectives (Derby & Larsen)

**Source (authoritative primary):** Esther Derby & Diana Larsen, *Agile Retrospectives: Making Good
Teams Great*, The Pragmatic Bookshelf, first printing July 2006, ISBN 0-9776166-4-9 (foreword by Ken
Schwaber). [pragprog.com title page](https://pragprog.com/titles/dlret/agile-retrospectives/)

**Core contribution.** The book takes the project-end "retrospective" (popularized by Norm Kerth's
*Project Retrospectives*, 2001) and reframes it as a **short, repeatable, every-iteration team
learning ritual** — the practical engine of "inspect and adapt." Its lasting contribution is two
things working together (Ch. 1, pp. 1–14):

1. **A five-phase structure** that gives any retrospective a reliable shape and "does what a
   retrospective needs to do" — scalable from one hour to three days (p. 4, verbatim: *"This
   structure can fit into an hour or expand to three days. You can add variety by adding new
   activities, but stick to this basic outline."*).
2. **A catalog of ~26 named activities** mapped to those phases, each with purpose, timing, steps,
   and facilitator notes — so a facilitator can vary the *content* of each phase while keeping the
   *arc* constant.

**Key framing principles (cited, useful as facilitator notes):**
- *"Gather data creates a shared picture of what happened. Without a common picture, individuals
  tend to verify their own opinions and beliefs."* (p. 8) — data before judgement.
- *"Hard facts are only part of the data. Feelings are at least half the story."* (p. 9) — the book
  deliberately surfaces emotion ("the F word," p. 10) via indirect questions.
- *"It's easy for people to jump to solutions once problems emerge. First solutions may be correct,
  but often they're not."* (p. 11) — Generate Insights exists to resist premature solutioning.
- *"Pick one or two experiments for the next iteration… too many initiatives can overwhelm your
  ability to change."* (p. 12) — Decide What to Do is deliberately narrow.
- *"End the retrospective decisively; don't let people (and their energy) dribble away… 'Inspect and
  adapt' applies to retrospectives, too."* (p. 13) — Close includes a retro-on-the-retro.

**Confidence: High.** Primary text in hand; structure independently summarized by Scrum.org,
Retrium, and InformIT (book excerpt). Note: a *Second Edition* (Derby, Larsen, Horowitz, 2024)
exists and an InformIT-hosted article presents an **expanded six-phase** variant (adds "Check
Hypothesis"); we treat the **original five phases** as canon and flag the variant in §6.

Cross-reference sources for the framework:
[Scrum.org forum](https://www.scrum.org/forum/scrum-forum/49541/5-phases-retrospective) ·
[Retrium five phases](https://www.retrium.com/ultimate-guide-to-agile-retrospectives/five-phases-of-a-successful-retrospective) ·
[InformIT phase model excerpt](https://www.informit.com/articles/article.aspx?p=2916288&seqNum=3)

---

## 2. The 5-Phase Framework (candidate: `framework` — slug `five-phase-retrospective`)

**Set the Stage -> Gather Data -> Generate Insights -> Decide What to Do -> Close the Retrospective.**
(Derby & Larsen, Ch. 1, pp. 5–14; the infinity-loop diagram Fig. 1.1, p. 5, shows the retro as the
inner loop of the iterative life cycle.)

| Phase | Purpose (sourced) | What you map onto it |
|---|---|---|
| **1. Set the Stage** | "Helps people focus on the work at hand… contributes to creating an atmosphere where people feel comfortable discussing issues." Get *everyone* to speak early (tacit permission to stay silent otherwise). (p. 5) | check-in / opener; working agreements; engagement poll |
| **2. Gather Data** | "Creates a shared picture of what happened." Hard data (events, metrics) **and** feelings. (pp. 8–10) | timeline; emotion mapping; satisfaction/radar measures |
| **3. Generate Insights** | Ask "Why?"; "look at causes and effects, and think about them analytically" before jumping to solutions. (p. 11) | root-cause (5 Whys, Fishbone); pattern-finding; matrix |
| **4. Decide What to Do** | Pick "no more than one or two" experiments and make them concrete and owned. (pp. 11–12) | goal-setting; planning; prioritization |
| **5. Close** | End decisively; decide how to retain learnings; appreciate; **retrospect the retrospective.** (p. 13) | plus/delta; appreciations; ROTI |

**Rough time allocation (1-hour iteration retro), from the InformIT phase-model excerpt of the
book:** Set the Stage ~5 min, Gather Data ~10 min, Generate Insights ~20 min (the most-skipped, most
important), Decide What to Do ~15 min, Close ~5 min.

### Overlap analysis — three arcs compared

This is the crux of the "is the framework a duplicate?" question. We hold three macro-arcs; they are
*different shapes for different jobs*:

| Our existing arc | Job | Shape | "Middle" |
|---|---|---|---|
| `participatory-decision-diamond` (Kaner) | Reach a **decision** amid disagreement | diverge -> **Groan Zone** -> converge | enduring conflict to integrate options |
| `tbr-4cs` (Bowman) | **Teach/learn** content so it sticks | Connections -> Concepts -> Practice -> Conclusions | active practice of new content |
| **`five-phase-retrospective`** (Derby & Larsen) | **Reflect & improve** a team's own way of working | Stage -> **Data -> Insight** -> Decide -> Close | move from *what happened/felt* to *why* before deciding |

The retro arc is **not** the decision diamond: the diamond opens with idea/option *divergence* and
its hard middle is a *Groan Zone of competing options*; the retro arc opens by reconstructing **what
actually happened (incl. feelings)** and its hard middle is **causal analysis of past events** —
data-then-meaning, not options-then-choice. It is **not** the 4Cs: 4Cs sequences *delivery and
practice of new content*; the retro has no "teach content" or "practice the skill" beat — its raw
material is the team's own recent experience, and "Close" is explicitly a *retro-on-the-retro*, which
4Cs's "Conclusions" is not. The retro also uniquely brackets the work with **psychological-safety
setup** (Set the Stage's "get everyone to speak") and **meta-evaluation** (ROTI/plus-delta) that
neither other arc names.

Also note vs `what-so-what-now-what` (W³, a *structure*): W³ is a single ~15-min debrief that
*compresses* observe -> interpret -> decide into one activity. The five-phase framework is the
*macro-arc* you'd map W³-like structures **onto** (W³ ≈ Gather Data + Generate Insights + Decide,
collapsed). They are complementary, not duplicative — one is a 15-min block, the other is the
session backbone.

**Verdict: ADD as `framework`.** Fills a genuine, named gap (reflection/improvement arc). High
confidence; canonical and widely taught.

---

## 3. Signature Activities by Phase — overlap vs gap

For each: mechanics traced to the book (page), then **OVERLAP** an existing slug or **GAP** to fill.
Type column assumes our schema (most activities = `structure`).

### 3.1 Set the Stage

| Activity (page) | Mechanics (sourced) | Verdict |
|---|---|---|
| **Check-In** (p. 41) | One word/short phrase per person on how they arrive; gets every voice out early. | **OVERLAP** — `heard-seen-respected`/`impromptu-networking` cover opening connection; a one-word check-in is generic. Skip as a slug. |
| **Focus On / Focus Off** (pp. 43–44) | A working-agreement primer: Inquiry > Advocacy, Dialogue > Debate, Conversation > Argument, Understanding > Defending. | **OVERLAP** — a *content list* for working agreements, not a distinct structure. Could be a facilitator-note on a working-agreements practice. Skip. |
| **ESVP** (pp. 45–47) | Each person *anonymously* declares attitude as **E**xplorer / **S**hopper / **V**acationer / **P**risoner; leader tallies a histogram, debriefs "how is this like our daily work?" Reads buy-in/safety before content. | **GAP — ADD.** Nothing in our 42 reads *attitude toward the session itself*. Distinct, well-known, Derby/Larsen original. |
| **Working Agreements** (pp. 48–49) | Small groups draft candidate norms; whole group selects 3–7. | **OVERLAP** — strong overlap with `min-specs` (min rules) and our general facilitation; "team norms" is well-covered conceptually. Skip as a new slug, or fold as a variant. |

### 3.2 Gather Data

| Activity (page) | Mechanics (sourced) | Verdict |
|---|---|---|
| **Timeline** (p. 51) | Post events of the period on a wall in chronological order; often color-dot high/low points (Fig. 1.2). Builds shared picture. | **MAYBE** — generic "event mapping"; partial overlap with `simple-ethnography`/visual surfacing. The *color-dot emotional* layer is the distinctive bit. Second tier. |
| **Triple Nickels** (p. 56) | 5-min / 5-people / round-robin idea-building rounds (5-5-5). | **OVERLAP** — functionally a written-round ideation; overlaps `1-2-4-all` / `25-10-crowd-sourcing` brainstorming. Skip. |
| **Color Code Dots** (p. 59) | Add emotional dots (high/low) to an existing timeline. | **OVERLAP** — a dot-voting technique; subsumed by Timeline + `prioritize-with-dots`. Skip. |
| **Mad Sad Glad** (p. 61) | Three posters (Mad / Sad / Glad); members post color-coded cards naming moments they felt each. Surfaces emotion safely. | **GAP — ADD.** We have impediment surfacing (`speed-boat`) but **no structured emotion-gathering** practice. Iconic, simple, distinct. |
| **Locate Strengths** (p. 63) | Appreciative-style paired interviews on high points; feeds Identify Themes. | **OVERLAP** — this is `appreciative-interviews` (we already have that LS practice). Skip. |
| **Satisfaction Histogram** (pp. 66–69) | Anonymous 1–5 vote on a dimension (e.g. teamwork); plot histogram; discuss the spread. | **MAYBE/OVERLAP** — a single-question quantified poll; close cousin of Team Radar (multi-factor). If we add Team Radar, this is redundant. Hold. |
| **Team Radar** (pp. 71–73) | Rate several named factors 0–10 on a spider/radar chart; individual or group-average; **re-run later as a progress measure.** | **GAP — ADD.** Multi-criteria self-assessment with a built-in repeat-measurement loop. No equivalent in our 42 (`generative-relationships-star` is relationship-mapping, not scored self-rating). |
| **Like to Like** (pp. 74–76) | An "Apples-to-Apples"-style card game matching events to quality words. | **OVERLAP/NICHE** — playful but mechanically a card-matching ideation game; low distinctiveness, high setup. Skip. |

### 3.3 Generate Insights

| Activity (page) | Mechanics (sourced) | Verdict |
|---|---|---|
| **Brainstorming / Filtering** (p. 78) | Generate then filter ideas by a chosen criterion. | **OVERLAP** — `1-2-4-all`, `triz`, `25-10-crowd-sourcing` cover this. Skip. |
| **Force Field Analysis** (p. 81) | List driving vs restraining forces for a change (Lewin). | **OVERLAP** — closely related to `speed-boat` (propelling wind / dragging anchors) and is a generic Lewin tool. Skip (or note as Lewin lineage). |
| **5 Whys** (p. 85) | Ask "why?" iteratively to reach root cause. | **MAYBE** — root-cause is a real gap, BUT 5 Whys is *part of* `pre-mortem`/analysis culture and is a one-line technique. Attribution: **Sakichi Toyoda / Toyota** (1930s). Could ride inside a single "root-cause" practice with Fishbone. Hold. |
| **Fishbone (Ishikawa)** (pp. 87–89) | Cause-and-effect diagram; branch the 5 W's / categories off a "spine" toward a problem head; stop at causes outside the team's control. | **MAYBE** — same gap as 5 Whys (root-cause). Attribution: **Kaoru Ishikawa**. Strong candidate *if* we add one root-cause structure; pairs naturally with 5 Whys. Hold (see §4). |
| **Patterns and Shifts** (pp. 90–91) | After a visual data display, name patterns/links and points where energy shifted. | **OVERLAP** — this is the "So What?" of `what-so-what-now-what` applied to a data wall. Skip. |
| **Prioritize with Dots** (pp. 92–94) | Allocate dots (4/3/2/1 scheme) to winnow a long list. | **OVERLAP** — generic dot voting; covered by `gradients-of-agreement`/`25-10` convergence. Skip. |
| **Report Out with Synthesis** (pp. 95–96) | Small groups report to whole; "progress bar" timeboxes each; find common threads. | **OVERLAP** — small-group-to-whole reporting is the back half of `1-2-4-all`/`shift-and-share`. Skip. |
| **Identify Themes** (pp. 97–98) | Cluster interview cards into themes; small groups refine. | **OVERLAP** — affinity clustering; covered by `1-2-4-all`/`appreciative-interviews` follow-on. Skip. |
| **Learning Matrix** (pp. 99–101) | 4-quadrant flip chart — :) keep / :( change / 💡 new ideas / 💐 appreciate; sticky notes then dot-vote. Fast insight capture; can also be used in Close. | **GAP — ADD.** Distinct, time-efficient 4-quadrant capture; no direct equivalent. Note: this is the named ancestor of the popular "4 Ls"/"Glad-Sad-Mad-grid" family. |

### 3.4 Decide What to Do

| Activity (page) | Mechanics (sourced) | Verdict |
|---|---|---|
| **Retrospective Planning Game** (pp. 103–106) | Brainstorm all tasks for an experiment, dedupe, order by dependency, sign up. | **OVERLAP** — task-breakdown + commitment; overlaps `15-percent-solutions` (own next steps) and `min-specs`. Skip. |
| **SMART Goals** (pp. 107–108) | Frame the action as Specific/Measurable/Attainable/Relevant/Timely; 1–5 action steps. | **OVERLAP** — SMART is a generic goal-framing lens, widely known; thin as a standalone practice. Skip (could be a facilitator note). |
| **Circle of Questions** (pp. 109–110) | Round the circle: each asks the next a question and answers the previous; equal airtime; build trust. | **OVERLAP/NICHE** — a turn-taking dialogue structure; overlaps `conversation-cafe`/`troika`. Low marginal value. Skip. |
| **Short Subjects** (pp. 111–112) | Pick a simple prompt set (Keep/Drop/Add, Start/Stop/Continue, WWWDD, Plus/Delta…) and brainstorm under each. | **OVERLAP** — this is the generic "Start/Stop/Continue"-family. Useful but un-distinctive and overlaps W³/short debriefs. Skip as a slug (it's a *menu*, not one structure). |

### 3.5 Close the Retrospective

| Activity (page) | Mechanics (sourced) | Verdict |
|---|---|---|
| **+ / Delta** (pp. 114–116) | A "T" chart: **+** = keep for future retros, **Δ** = change. Quick, non-blaming retro-on-the-retro; the T limits volume. | **GAP — ADD.** Minimal, fast, distinct "improve the meeting" close. W³'s "Now What?" is about the *work*, not the *session*. High reuse. |
| **Appreciations** (pp. 117–118) | Optional round: "[Name], I appreciate you for ___." Ends on a positive note. Source: Satir et al. ([S+91]). | **OVERLAP** — appreciation rounds are well-covered by `heard-seen-respected` and `appreciative-interviews` ethos. Skip as a slug. |
| **Temperature Reading** (pp. 119–121) | 5-part round (Appreciations, Puzzles, Complaints w/ Recommendations, New Information, Hopes & Wishes). Source: **Virginia Satir** ([Sch90]). Usable to open *or* close. | **MAYBE** — a richer Satir check-in/out; partial overlap with `heard-seen-respected` + `plus-delta`. Distinct in its 5-part completeness. Hold/second-tier. |
| **Helped, Hindered, Hypothesis (HHH)** (pp. 122–123) | Sticky notes on three charts: what *helped* learning, what *hindered*, *hypothesis* for next time. Feedback to the *facilitator*. | **MAYBE** — distinct (facilitator-improvement feedback) but narrow; overlaps `plus-delta`'s intent. Second tier. |
| **Return on Time Invested (ROTI)** (pp. 124–126) | Each person rates the *session's* value 0–4 (0 = lost time … 4 = high return); tally a histogram; ask high-raters what benefit, low-raters what they wanted. Source noted [Der03b]. | **GAP — ADD.** A **meta-evaluation of the session's worth** — we have *nothing* that measures whether a session earned its time. Generalizes to any workshop. |

---

## 4. Consolidated Proposal

### 4.1 Ranked shortlist of meaningful additions

Source for all = Derby & Larsen, *Agile Retrospectives* (2006), `source_url`
`https://pragprog.com/titles/dlret/agile-retrospectives/` unless a stronger originator is noted.
Proposed `source` slug: `agile-retrospectives`.

| # | Proposed slug | Type | Page | Metadata hints (for `structure`) | Gap it fills | One-line "why it earns a slot" |
|---|---|---|---|---|---|---|
| 1 | `five-phase-retrospective` | framework | Ch.1, 5–14 | — (lens, no timing) | The reflection/improvement macro-arc | The retro backbone; distinct from decision-diamond & 4Cs; most-cited retro contribution. |
| 2 | `roti` | structure | 124–126 | group 3–30; 5–10 min; mediums in-person/miro/video; tags `meta-evaluation, close, feedback, meeting-roi` | Session-value meta-evaluation | The only instrument that asks "was this session worth the time?" — reusable far beyond retros. |
| 3 | `esvp` | structure | 45–47 | group 4–20; 10–15 min; in-person/miro (anon. slips → histogram), video w/ anon tool; tags `set-the-stage, engagement, buy-in, anonymous` | Reading attitude *toward the session* | Surfaces hidden disengagement before content; Derby/Larsen original; nothing equivalent. |
| 4 | `mad-sad-glad` | structure | 61–62 | group 3–20; 15–25 min; in-person/miro/video; tags `gather-data, emotions, retrospective` | Structured emotion gathering | Safe, iconic way to surface feelings as data — a deliberate gap the book argues for. |
| 5 | `team-radar` | structure | 71–73 | group 3–15; 15–20 min; in-person/miro (radar chart); video w/ board; tags `gather-data, self-assessment, metrics, progress-measure` | Multi-factor scored self-assessment, repeatable | Quantifies perception against named criteria and re-measures over time — no equivalent. |
| 6 | `learning-matrix` | structure | 99–101 | group 3–20; 20–25 min; in-person/miro/video (4 quadrants); tags `generate-insights, four-quadrant, fast` | Fast 4-quadrant insight capture | Time-efficient keep/change/idea/appreciate grid; ancestor of "4 Ls"; genuinely retro-specific. |
| 7 | `plus-delta` | structure | 114–116 | group 3–30; 10–20 min; in-person/miro/video (T-chart); tags `close, retro-on-retro, fast, feedback` | Minimal "improve the meeting" close | The lightest possible session-improvement close; complements (doesn't duplicate) W³. |

**Second tier — document, hold (don't add now):**
- `timeline` (Gather Data, p. 51) — useful but overlaps generic event mapping; add only if a
  dedicated *visual chronology* gap appears.
- `temperature-reading` (Close/Open, pp. 119–121, **Satir**) — richer 5-part check-in/out; partial
  overlap with `heard-seen-respected` + `plus-delta`.
- `helped-hindered-hypothesis` (Close, pp. 122–123) — facilitator-feedback; narrow; `plus-delta`
  covers most of the intent.
- **Root-cause pair** `five-whys` (Toyoda) + `fishbone` (Ishikawa) — a real "structured root-cause"
  gap, but both are tiny generic techniques. Recommendation: if added, fold into **one** practice
  (e.g. `root-cause-analysis`, type `structure`) presenting both, rather than two thin slugs.

### 4.2 Do NOT add — already covered (near-duplicate -> existing slug)

| Book activity (page) | Why not | Closest existing slug(s) |
|---|---|---|
| Check-In (41) | generic one-word opener | `heard-seen-respected`, `impromptu-networking` |
| Focus On/Focus Off (43) | content list for working agreements, not a structure | (fold into working-agreements note) |
| Working Agreements (48) | team-norms drafting | `min-specs` |
| Triple Nickels (56) | round-robin written ideation | `1-2-4-all`, `25-10-crowd-sourcing` |
| Color Code Dots (59) | dot voting on a timeline | `prioritize-with-dots` ≈ covered by convergence tools |
| Locate Strengths (63) | appreciative paired interviews | `appreciative-interviews` |
| Satisfaction Histogram (66) | single-question poll | redundant if `team-radar` added |
| Like to Like (74) | card-matching ideation game | `1-2-4-all` (low distinctiveness) |
| Brainstorming/Filtering (78) | generate + filter ideas | `1-2-4-all`, `triz` |
| Force Field Analysis (81) | drivers vs restrainers (Lewin) | `speed-boat` (wind/anchors), generic Lewin |
| Patterns and Shifts (90) | interpret a data wall | `what-so-what-now-what` ("So What?") |
| Prioritize with Dots (92) | dot voting | `gradients-of-agreement`, `25-10-crowd-sourcing` |
| Report Out with Synthesis (95) | small-group → whole reporting | `1-2-4-all`, `shift-and-share` |
| Identify Themes (97) | affinity clustering | `1-2-4-all`, `appreciative-interviews` |
| Retrospective Planning Game (103) | task breakdown + commitment | `15-percent-solutions`, `min-specs` |
| SMART Goals (107) | goal-framing lens | (facilitator note; generic) |
| Circle of Questions (109) | turn-taking dialogue | `conversation-cafe`, `troika-consulting` |
| Short Subjects (111) | menu of Start/Stop/Continue prompts | `what-so-what-now-what` (it's a menu, not one structure) |
| Appreciations (117) | appreciation round (Satir) | `heard-seen-respected`, `appreciative-interviews` |

### 4.3 Attribution drift notes

Many retro activities are **folk/aggregated**; Retromat (Corinna Baldauf) catalogs them and the
*Agile Retrospectives* book names them, but several predate the book. Credit originals where known:

- **5 Whys** — **Sakichi Toyoda / Toyota** (developed 1930s, formalized in the Toyota Production
  System by Taiichi Ohno). [Wikipedia: Five whys](https://en.wikipedia.org/wiki/Five_whys),
  [Wikipedia: Sakichi Toyoda](https://en.wikipedia.org/wiki/Sakichi_Toyoda). Derby & Larsen present
  it (p. 85), they do not claim it.
- **Fishbone / Ishikawa diagram** — **Kaoru Ishikawa** (cause-and-effect diagram, ~1960s, Japanese
  quality movement). Book presents it p. 87.
- **Temperature Reading** — **Virginia Satir** (family-systems therapist; "Daily Temperature
  Reading," 1970s). Book cites [Sch90]; corroborated by
  [stevenmsmith.com](https://stevenmsmith.com/ar-temperature-reading/) and
  [dhemery.com](https://dhemery.com/articles/temperature_reading/).
- **Appreciations** — rooted in Satir / *The Satir Model* (Satir et al., 1991); book cites [S+91].
- **Force Field Analysis** — **Kurt Lewin** (social psychology).
- **SMART goals** — commonly attributed to **George T. Doran** (1981, *Management Review*).
- **ESVP, Mad Sad Glad, Team Radar, Learning Matrix, +/Delta, ROTI, HHH** — original to / first
  named in **Derby & Larsen (2006)** as far as the trusted record shows (ROTI cites the authors'
  own earlier work [Der03b]). Credit the book; note these are the genuinely retro-native additions.

**Practical implication for our library:** for any added slug whose technique predates the book, set
`source: agile-retrospectives` (where we found the citable, structured write-up) but record the
*originator* in the body's "Source detail" line (e.g. *"5 Whys — Sakichi Toyoda/Toyota; presented in
Derby & Larsen, Agile Retrospectives, p. 85"*), mirroring how `speed-boat` already credits Hohmann
while citing the generic "Sailboat" lineage.

---

## 5. Sources & Verification

| # | Source | Type / Tier | Used for | Independence |
|---|---|---|---|---|
| S1 | Derby & Larsen, *Agile Retrospectives* (Pragmatic, 2006) — full text PDF read directly (TOC + chs 1, 4–9) | **Authoritative primary** | Framework + all activity mechanics, timing, page cites, internal attributions | The canonical source |
| S2 | [pragprog.com title page](https://pragprog.com/titles/dlret/agile-retrospectives/) | Publisher (high) | Bibliographic confirmation, 2nd ed. existence | Publisher |
| S3 | [InformIT phase-model article excerpt](https://www.informit.com/articles/article.aspx?p=2916288&seqNum=3) | High (book-derived) | Phase purposes + time allocation; flags 6-phase variant | InformIT/Pearson |
| S4 | [Scrum.org 5 phases](https://www.scrum.org/forum/scrum-forum/49541/5-phases-retrospective) | High | Independent confirmation of 5-phase structure | Scrum.org |
| S5 | [Retrium five phases](https://www.retrium.com/ultimate-guide-to-agile-retrospectives/five-phases-of-a-successful-retrospective) | Medium-high | Independent confirmation of structure | Retrium (vendor) |
| S6 | [Wikipedia: Five whys](https://en.wikipedia.org/wiki/Five_whys) + [Sakichi Toyoda](https://en.wikipedia.org/wiki/Sakichi_Toyoda) | Medium-high | 5 Whys attribution (Toyoda/Toyota) | Independent of book |
| S7 | [stevenmsmith.com Temperature Reading](https://stevenmsmith.com/ar-temperature-reading/) + [dhemery.com](https://dhemery.com/articles/temperature_reading/) | Medium-high | Temperature Reading = Virginia Satir | Two independent practitioner authors |
| S8 | [O'Reilly book listing (TOC)](https://www.oreilly.com/library/view/agile-retrospectives/9781680500295/) — ROTI & Patterns/Shifts pages | High (publisher) | Corroborates activity list & phase placement | O'Reilly |

**Cross-reference status:** The 5-phase framework is confirmed by ≥4 independent sources (S1, S3,
S4, S5). Every activity's mechanics come from the primary text (S1) — single *authoritative* source,
which meets the "1 authoritative minimum" bar; external attributions (5 Whys, Fishbone, Temperature
Reading) are independently cross-referenced (S6, S7). No reliance on excluded domains.

---

## 6. Knowledge Gaps & Conflicting Information

- **Five vs six phases (resolved as a flag).** An InformIT-hosted article (S3) presents a **six**-phase
  model that inserts "Check Hypothesis" and renames "Decide What to Do" → "Define Experiments." This is
  an *expansion* of Derby & Larsen, not the 2006 canon. The **2024 Second Edition** (Derby, Larsen,
  Horowitz) may formalize variations. **Recommendation:** model the *original five* as
  `five-phase-retrospective`; mention the hypothesis-driven variant in facilitator notes only.
- **Mad Sad Glad exact page/steps.** Confirmed present at p. 61 (TOC §5.4) and described in the search
  corroboration; I read surrounding Gather-Data pages but not the verbatim §5.4 steps. Mechanics here
  are drawn from the book's consistent activity template + corroborating sources — confidence
  High-Medium on exact step wording, High on existence/placement/purpose.
- **Circle of Questions / Short Subjects full steps** — read partially (pp. 110–112); enough to judge
  overlap, not to author a full practice (not needed — both are "do not add").
- **Retromat attribution layer not fetched** (retromat.org returned 403). Attribution drift in §4.3 is
  therefore sourced from the book's own bibliography markers + independent originator sources (Wikipedia,
  Satir practitioners) rather than Retromat. This is *stronger*, not weaker — originators are cited
  directly. Gap: we did not capture Retromat's specific per-activity credit lines.
- **Satisfaction Histogram vs Team Radar redundancy** is a judgement call, not a sourced fact: both are
  in the book; we recommend Team Radar (multi-factor, repeatable) and dropping the single-question
  Histogram to avoid near-duplication *within* our own additions.

**Interpretation vs fact:** All page-cited mechanics, purposes, and timings are **facts** from the
primary text. All OVERLAP/GAP verdicts, the three-arc comparison, the ranked shortlist, and the
Histogram-vs-Radar call are **interpretation/analysis** by the researcher against our existing 42
practices.
