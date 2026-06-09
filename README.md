# LetPeopleWorkShop

*Let people work(shop).* The [LetPeopleWork](https://letpeople.work) facilitation toolkit.

A markdown-native, Claude-Code-native toolkit for designing, running, and learning from workshops.
Bring a brief; grounded assistants help you **design** the session, **prep** the room (or Miro/video),
and **learn** from it afterwards — so the next one is better. The repo *is* a Claude Code **plugin** —
install it and the agents work in any workspace; there's no app to run.

> **Status:** the full loop works end-to-end — **designer** (applies your past lessons), **executor**
> (in-person / digital prep packs), and **feedback** (debrief → tagged lessons), over a markdown
> workshop archive and an extensible practices library.

## What's here
```
.claude-plugin/plugin.json        Plugin manifest — the repo IS the plugin.
.claude-plugin/marketplace.json   Lets you add it as a marketplace directly.
agents/                           designer · executor · feedback subagents.
skills/facilitation-practices/    The practices library as a Skill (list/explain/recommend/ground).
  practices/*.md                  Facilitation structures, one markdown file each.
templates/                        brief · design · setup · feedback · lesson formats.
docs/                             Product vision, jobs, journeys, architecture, ADRs.
workshops/EXAMPLE-*/              A sanitized sample (your real sessions live in YOUR workspace).
```

## Install
```
# Add the LetPeopleWork marketplace, then install:
/plugin marketplace add LetPeopleWork/LetPeopleWorkShop
/plugin install let-people-workshop@letpeoplework
```
To hack on it locally, clone and run `claude --plugin-dir .`. (A community-marketplace install —
`/plugin marketplace add anthropics/claude-plugins-community` — lands once the plugin is approved.)

## Your content stays yours
The plugin carries the *toolkit*; your **workshops, designs, feedback, and lessons live in your own
workspace**, never in this repo. (This repo's `.gitignore` also guards against committing real sessions
during development — only the sanitized `workshops/EXAMPLE-*` is tracked.)

## Quick start (using it)
With the plugin installed, in your own workspace:
1. Ask the **designer** to start a workshop — it scaffolds `workshops/<slug>/brief.md` from the template.
2. Fill the brief; the designer writes a grounded, time-reconciled `workshops/<slug>/design.md`.
3. Ask the **executor** for a prep pack; run the session; then **feedback** to debrief → tagged lessons.
See `workshops/EXAMPLE-team-retro/` in this repo for what a brief + design look like.

## Add a facilitation practice
Copy `skills/facilitation-practices/practices/_TEMPLATE.md` to a new kebab-case file, fill it
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

## Acknowledgments
LetPeopleWorkShop grew out of a first prototype built together with
**[Frank Barner](https://www.linkedin.com/in/frankbarner/)** — thank you, Frank, for the spark that
inspired this.

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
