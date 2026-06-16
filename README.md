# LetPeopleWorkShop

*Let people work(shop).* The [LetPeopleWork](https://letpeople.work) facilitation toolkit.

**In one sentence:** it's a helper for designing and running great workshops — you describe the session
you want to run, and a set of AI assistants help you **design** the agenda, **prepare** the room (or
your Miro board / video call), and **learn** from how it went so your next workshop is better.

You don't need to be technical to use it. If you can install an app and type a sentence, you can use
this.

---

## What you need before you start

1. **Claude Code** — Anthropic's assistant that runs on your computer (or in the desktop app).
   If you don't have it yet, get it at [claude.com/claude-code](https://claude.com/claude-code) and
   sign in. That's the only thing you must install.
2. That's it. There's no separate app for this toolkit, no setup, no coding.

> **New to this?** Think of Claude Code as a chat window that can also read and write files in a folder
> on your computer. This toolkit teaches it how to be a workshop facilitator. You talk to it in plain
> English; it does the work and saves the results as documents you can open and edit.

---

## Step 1 — Install the toolkit (one time)

Open Claude Code, and type these two lines (one at a time):

```
/plugin marketplace add LetPeopleWork/LetPeopleWorkShop
/plugin install let-people-workshop@letpeoplework
```

- The **first** line tells Claude Code where to find the toolkit.
- The **second** line installs it.

That's the whole setup. The assistants are now available in any folder you work in.

---

## Step 2 — Design your first workshop

Just ask, in plain English. For example, type:

> **"Help me design a 90-minute retrospective for my team of 8, in person."**

The **designer** assistant will:
1. Create a short **brief** (a fill-in form) and ask you a few questions — your goal, the group, how
   long, in person or remote, anything sensitive.
2. Once it knows enough, write you a complete, time-checked **agenda** — which activities to run, in
   what order, how long each takes, and *why* — using proven facilitation methods.

You'll get a file you can read, edit, and bring into the room.

### Then, when the session is close

> **"Give me a prep pack for this workshop."**

The **executor** assistant turns the agenda into a checklist: what to print or buy, how to set up the
room — or, for online sessions, a step-by-step recipe for your Miro board and video call.

### And afterwards

> **"Let's debrief the workshop — here's how it went: …"** *(then just brain-dump what happened)*

The **feedback** assistant turns your notes into a tidy summary **and** saves the lessons — so the next
time you design a similar session, those lessons are automatically applied. That's the loop that makes
each workshop better than the last.

> **Want to see an example first?** Look in the `workshops/EXAMPLE-team-retro/` folder in this repo —
> it shows what a finished brief and agenda look like.

---

## Where do my workshops get saved?

In **your own folder**, not inside the toolkit. When you design a workshop, it's saved under
`workshops/<your-workshop-name>/` in whatever folder you're working in. Your sessions, notes, and
lessons are yours and stay with you.

---

## The three assistants at a glance

| Assistant | You use it… | What it does |
|---|---|---|
| **designer** | before the session | brief → a grounded, time-checked agenda (and applies your past lessons) |
| **executor** | just before running it | agenda → a prep pack (in-person materials, or a Miro + video recipe) |
| **feedback** | after the session | your notes → a clean summary + reusable lessons that feed the next design |

They work by reading and writing simple documents in your workshop folder — you can open and edit any
of them at any time.

---

## Want to add your own facilitation method?

The toolkit comes with a big library of facilitation structures (the full
[Liberating Structures](https://www.liberatingstructures.com/) set, plus
[Training from the BACK of the Room](https://bowperson.com/resources/index.html) and more). You can add
your own:

1. Copy the file `skills/facilitation-practices/practices/_TEMPLATE.md` to a new file named after your
   method (e.g. `world-cafe.md`).
2. Fill it in (the template tells you what goes where).

The assistants pick it up automatically — no coding. **Important:** if the method comes from a book or a
commercial program, follow the short **"four gates"** checklist in the template and in
[`NOTICE.md`](NOTICE.md) — it keeps everything properly credited and legally clean. (Write it in your
own words, don't copy their worksheets, credit the author, and don't imply they endorse it.)

---

## For developers

To hack on the toolkit locally, clone this repo and run `claude --plugin-dir .` — that loads the repo as
a plugin without installing it. Architecture, design decisions, and the product vision are in `docs/`
(start with `docs/product/vision.md` and `docs/product/architecture/brief.md`). Contributor and
maintenance notes are in [`CLAUDE.md`](CLAUDE.md).

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
