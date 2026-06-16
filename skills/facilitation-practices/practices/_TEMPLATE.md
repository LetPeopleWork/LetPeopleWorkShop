---
slug: <kebab-case, must equal the filename without .md>
name: <Display Name>
type: structure              # structure (timed agenda row) | principle (a lens, no timing) | framework (a macro-arc)
source: <liberating-structures | training-from-back-of-room | other-source-slug>
source_url: <link>
mediums: [in-person, miro, video]   # the subset this works well in
group_min: <int>            # required for type: structure; omit for type: principle
group_max: <int>            # required for type: structure; omit for type: principle
time_min: <int minutes>     # required for type: structure; omit for type: principle
time_max: <int minutes>     # required for type: structure; omit for type: principle
tags: [<freeform>, <e.g. diverge, debrief, charged-topic>]   # optional, aids recommendation
rights_status: <cc-by-sa | original-method-attributed | trademarked>   # optional; default original-method-attributed. See NOTICE.md
trademark: <e.g. "Innovation Games®">     # optional; only if the source name is a trademark
attribution: <one-line credit, e.g. "Liberating Structures, CC BY-SA 4.0">   # optional; NOTICE.md holds the full record
---

# <Practice Name>

- **Purpose:** <what it achieves in one or two sentences>
- **When to use:** <the situation that calls for it>
- **Group config:** <pairs / small groups / 1-2-4-All / whole group / etc.>
- **Timing:** <typical duration> (<how to trim / expand>)
- **Medium fit:**
  - In-person: <notes>
  - Miro: <notes>
  - Video: <notes>
- **Steps:**
  1. <step>
  2. <step>
- **Facilitator notes:** <the non-obvious bit — what makes it work, what to avoid, how it handles
  hard dynamics>

<!--
To add a practice: copy this file, rename to kebab-case (e.g. min-specs.md), fill it in.
The `designer` agent and `facilitation-practices` skill pick it up automatically — no code change.
- Frontmatter is the machine-readable INDEX (used to recommend/filter by medium, size, time).
- The prose body is the DETAIL the designer leans on — keep `Medium fit` and `Facilitator notes` rich.
- `slug` MUST equal the filename without `.md`; that's how designs cite the practice.

THE FOUR GATES (keep the dual-license valid — see NOTICE.md). Every new practice must pass all four:
  1. Original expression only — your own words and this schema, never copied/close-paraphrased text.
  2. No protected instruments — don't reproduce a source's worksheet, diagram, assessment, or exact
     question sequence. Describe the PROCESS. If it can't be described without copying the instrument,
     it does not go in.
  3. Attribute the originator — fill `source` + `source_url` and a credit line in the body.
  4. Disclaim affiliation + acknowledge trademark — add a row to NOTICE.md; set `trademark`/`attribution`
     above if relevant. The standing disclaimer in NOTICE.md covers endorsement.
-->
