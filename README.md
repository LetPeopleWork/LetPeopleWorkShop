# LetPeopleWorkShop

*Let people work(shop).* The [LetPeopleWork](https://letpeople.work) facilitation toolkit.

**In one sentence:** it's a helper for designing and running great workshops — you describe the session
you want to run, and a set of AI assistants help you **design** the agenda, **prepare** the room (or
your Miro board / video call), and **learn** from how it went so your next workshop is better.

---

## Pick your path

| | **Path A — "I just want to use it"** | **Path B — "I'm comfortable with a terminal"** |
|---|---|---|
| Who | Facilitators, coaches, managers — no technical background needed | Developers, or anyone happy on a command line |
| You use | The **Claude Code app** (point and type) | The **`claude` command** in your terminal (or an IDE extension) |
| Jump to | [**Path A** ↓](#path-a--i-just-want-to-use-it) | [**Path B** ↓](#path-b--im-comfortable-with-a-terminal) |

Both paths use the exact same toolkit and end up in the same place — they're just two ways in.

---

## Path A — "I just want to use it"

You don't need to be technical. If you can install an app and type a sentence, you can use this.

### What you need
**Claude Code** — Anthropic's assistant. Get the app at
[claude.com/claude-code](https://claude.com/claude-code) and sign in. That's the only thing to install.

> **New to this?** Think of Claude Code as a chat window that can also read and write files in a folder
> on your computer. This toolkit teaches it to be a workshop facilitator. You talk in plain English; it
> does the work and saves the results as documents you can open and edit.

### Step 1 — Install the toolkit (one time)
In Claude Code, type these two lines (one at a time):

```
/plugin marketplace add LetPeopleWork/LetPeopleWorkShop
/plugin install let-people-workshop@letpeoplework
```

- The **first** line tells Claude Code where to find the toolkit.
- The **second** line installs it.

That's the whole setup. The assistants are now available whenever you use Claude Code.

### Step 2 — Design your first workshop
Just ask, in plain English. For example, type:

> **"Help me design a 90-minute retrospective for my team of 8, in person."**

The **designer** assistant will create a short **brief** (a fill-in form), ask you a few questions
(goal, group, length, in-person or remote, anything sensitive), and then write you a complete,
time-checked **agenda** — which activities to run, in what order, how long each takes, and *why*.

### When the session is close
> **"Give me a prep pack for this workshop."**

The **executor** assistant turns the agenda into a checklist: what to print or buy and how to set up
the room — or, for online sessions, a step-by-step recipe for your Miro board and video call.

### Afterwards
> **"Let's debrief the workshop — here's how it went: …"** *(then brain-dump what happened)*

The **feedback** assistant turns your notes into a tidy summary **and** saves the lessons — so next time
you design a similar session, those lessons are applied automatically. That's the loop that makes each
workshop better than the last.

---

## Path B — "I'm comfortable with a terminal"

Everything above works from the `claude` CLI too — plus a couple of extra ways to run it.

### What you need
Claude Code installed as a command-line tool. The official installer is at
[claude.com/claude-code](https://claude.com/claude-code); a common route is npm:

```bash
npm install -g @anthropic-ai/claude-code   # check the official page for the current command
claude            # launches the interactive session
```

### Option 1 — Install the published plugin (recommended)
```bash
claude plugin marketplace add LetPeopleWork/LetPeopleWorkShop
claude plugin install let-people-workshop@letpeoplework
```
The same `/plugin …` slash commands from Path A also work *inside* an interactive `claude` session —
the `claude plugin …` form just lets you do it from the shell (handy for scripting or setup).

### Option 2 — Run it straight from a local clone (no install)
Great for trying it, hacking on it, or pinning a specific version:
```bash
git clone https://github.com/LetPeopleWork/LetPeopleWorkShop.git
cd LetPeopleWorkShop
claude --plugin-dir .      # loads this repo as a plugin for that session
```

### Option 3 — One-shot / headless (scripts, CI, automation)
Drive an assistant without an interactive session using print mode (`-p`):
```bash
claude --plugin-dir . -p "Use the designer to draft a 60-minute remote retro for a team of 6. \
Scaffold the brief, state any assumptions, and write the design."
```
Add `--permission-mode acceptEdits` if you want it to write files without prompting.

### Other ways in
- **IDE extensions** — Claude Code runs in **VS Code** and **JetBrains** IDEs; install the plugin once
  (Option 1) and the assistants are available there too.
- **Desktop / web app** — that's Path A.

### Try the included example
A sanitized sample lives in `workshops/EXAMPLE-team-retro/` — a finished brief + agenda you can read,
or point an assistant at to see the format.

---

## What both paths share

### Where do my workshops get saved?
In **your own folder**, not inside the toolkit. When you design a workshop it's saved under
`workshops/<your-workshop-name>/` in whatever folder you're working in. Your sessions, notes, and
lessons are yours and stay with you.

### The three assistants at a glance
| Assistant | You use it… | What it does |
|---|---|---|
| **designer** | before the session | brief → a grounded, time-checked agenda (and applies your past lessons) |
| **executor** | just before running it | agenda → a prep pack (in-person materials, or a Miro + video recipe) |
| **feedback** | after the session | your notes → a clean summary + reusable lessons that feed the next design |

They work by reading and writing simple documents in your workshop folder — you can open and edit any
of them at any time.

### Add your own facilitation method
The toolkit ships with a big library of facilitation structures (the full
[Liberating Structures](https://www.liberatingstructures.com/) set, plus
[Training from the BACK of the Room](https://bowperson.com/resources/index.html) and more). To add one:

1. Copy `skills/facilitation-practices/practices/_TEMPLATE.md` to a new file named after your method
   (e.g. `world-cafe.md`).
2. Fill it in (the template tells you what goes where).

The assistants pick it up automatically — no coding. **Important:** if the method comes from a book or a
commercial program, follow the short **"four gates"** checklist in the template and in
[`NOTICE.md`](NOTICE.md) — it keeps everything properly credited and legally clean. (Write it in your
own words, don't copy their worksheets, credit the author, and don't imply they endorse it.)

---

## For developers

The repo **is** the plugin — there's no build step. `claude --plugin-dir .` (Path B, Option 2) loads it
for a session. Architecture, design decisions, and the product vision are in `docs/` (start with
`docs/product/vision.md` and `docs/product/architecture/brief.md`). Contributor and maintenance notes
are in [`CLAUDE.md`](CLAUDE.md).

---

## Acknowledgments

LetPeopleWorkShop grew out of a first prototype built together with
**[Frank Barner](https://www.linkedin.com/in/frankbarner/)** — thank you, Frank, for the spark that
inspired this.

## Credits, sources & license

The facilitation **methods** this toolkit draws on remain the work of their authors and keep their own
terms. Our practice files are **original, attributed summaries — not reproductions**. Full per-source
attribution and rights are in [`NOTICE.md`](NOTICE.md). In short:

- **Liberating Structures** — Lipmanowicz & McCandless (2013); *Fieldbook* (2026) McCandless & White —
  licensed **CC BY-SA 4.0** — https://www.liberatingstructures.com/
- **Training from the BACK of the Room** — Sharon Bowman — *all rights reserved; we are not affiliated
  with or endorsed by Bowman/Bowperson* — https://bowperson.com/
- Plus Kaner, Acker/Kantor, Hohmann (Innovation Games®), Gamestorming, and Derby & Larsen — each
  credited in `NOTICE.md`.

**This repository is dual-licensed:**

- The **toolkit** (agents, templates, skill plumbing, docs) — **MIT License** ([`LICENSE`](LICENSE)).
- The **facilitation practice content** (`skills/facilitation-practices/practices/*.md`) —
  **CC BY-SA 4.0** ([`LICENSE-CONTENT`](LICENSE-CONTENT)). If you adapt the practice content, keep the
  attribution and share your version under the same license.

*Not legal advice — if you redistribute or build a commercial offering on this, check the source terms
for your use case.*
