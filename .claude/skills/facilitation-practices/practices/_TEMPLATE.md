---
slug: <kebab-case, must equal the filename without .md>
name: <Display Name>
type: structure              # structure (timed activity) | principle (a lens, no timing)
source: <liberating-structures | training-from-back-of-room | other-source-slug>
source_url: <link>
mediums: [in-person, miro, video]   # the subset this works well in
group_min: <int>            # required for type: structure; omit for type: principle
group_max: <int>            # required for type: structure; omit for type: principle
time_min: <int minutes>     # required for type: structure; omit for type: principle
time_max: <int minutes>     # required for type: structure; omit for type: principle
tags: [<freeform>, <e.g. diverge, debrief, charged-topic>]   # optional, aids recommendation
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
-->
