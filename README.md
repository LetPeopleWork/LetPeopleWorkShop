# LetPeopleWorkShop

*Let people work(shop).* The [LetPeopleWork](https://letpeople.work) facilitation toolkit.

A markdown-native, Claude-Code-native toolkit for designing, running, and learning from workshops.
Bring a brief; grounded assistants help you **design** the session, **prep** the room (or Miro/video),
and **learn** from it afterwards — so the next one is better. The repository *is* the tool — there's no
app to install.

> **Status:** the full loop works end-to-end — **designer** (applies your past lessons), **executor**
> (in-person / digital prep packs), and **feedback** (debrief → tagged lessons), over a markdown
> workshop archive and an extensible practices library.

## What's here
```
.claude/                              THE TOOLKIT (reusable; this is the future plugin payload). PUBLIC.
  agents/designer.md                  The `designer` subagent.
  skills/facilitation-practices/      The practices library, as a Skill (list/explain/recommend/ground).
    practices/*.md                    Facilitation structures, one markdown file each.
templates/        brief.md + design.md formats to copy. PUBLIC.
workshops/        Your sessions: brief → design (→ feedback → lessons). PRIVATE (gitignored, except EXAMPLE-*).
lessons-learned/  Aggregated reusable lessons. PRIVATE (gitignored).
docs/             Product vision, jobs, journeys, feature specs. PUBLIC.
```

### Toolkit vs. content (built for a clean future plugin)
The whole reusable tool lives under **`.claude/`** — which already mirrors a Claude Code *plugin*
layout (`agents/`, `skills/`). Your *content* (`workshops/`, `lessons-learned/`) lives at the root and
is gitignored. So distribution can be **either**: fork this repo (works today), **or** later wrap
`.claude/` in a `.claude-plugin/plugin.json` and publish it to a marketplace — a lift, not a rewrite.

## Public toolkit vs. your private content
This repo is meant to be pushed **publicly** so other facilitators can use it — but **your real
workshop designs, feedback, and lessons never get committed.** The `.gitignore` excludes everything
under `workshops/` (except the sanitized `EXAMPLE-*`) and `lessons-learned/`. Fork it, and your
sessions stay yours.

## Quick start
1. Copy `templates/brief.md` to `workshops/<your-slug>/brief.md` and fill it in.
2. In Claude Code, run the **designer** agent on that brief.
3. Read the generated `workshops/<your-slug>/design.md` — a timed agenda where every structure cites a
   practice, reconciled to your time box. Edit freely; it's yours.
4. See `workshops/EXAMPLE-team-retro/` for a worked example.

## Add a facilitation practice
Copy `.claude/skills/facilitation-practices/practices/_TEMPLATE.md` to a new kebab-case file, fill it
in. The `facilitation-practices` skill and the `designer` pick it up automatically — no code change.
Seeded with [Liberating Structures](https://www.liberatingstructures.com/) and
[Training from the BACK of the Room](https://bowperson.com/resources/index.html); add more anytime.

## The agents
Three assistants, each a stateless transform over a workshop folder (they compose via files, never call
each other):
- **`designer`** — brief → grounded, time-reconciled agenda; applies the TBR 4Cs + Six Trumps lens and
  your past lessons.
- **`executor`** — design → prep pack (in-person materials/setup, or a Miro+video recipe).
- **`feedback`** — post-session brain-dump → structured `feedback.md` + reusable lessons tagged by
  practice + theme. Those lessons feed back into the next design (the loop).

See `docs/product/vision.md` for the full picture and `docs/product/architecture/brief.md` for the design.

## Credits & sources
The facilitation **methodologies** this toolkit draws on remain the work of their authors and keep their
own terms. The practice files here are **original, attributed summaries with links — not reproductions**:
- **Liberating Structures** — Henri Lipmanowicz & Keith McCandless, published under
  [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) — https://www.liberatingstructures.com/
- **Training from the BACK of the Room** — Sharon L. Bowman — https://bowperson.com/

If you adapt or redistribute, keep these attributions and respect the source licenses. Note that
Liberating Structures is **Non-Commercial ShareAlike** — that governs the LS *methods*, independent of
this repo's MIT license. Not legal advice; check the source terms for your use case.

## License
LetPeopleWorkShop — the *toolkit* (agents, skill, templates, structure) — is released under the
**MIT License** (see [`LICENSE`](LICENSE)). The underlying facilitation methodologies retain their own
rights as noted above.
