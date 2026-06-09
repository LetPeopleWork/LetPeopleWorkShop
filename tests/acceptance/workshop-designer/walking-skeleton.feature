# Walking skeleton acceptance — the one end-to-end path that must work.
# This repo is a Claude-Code-native toolkit (no automated test runner yet), so this scenario is an
# EXECUTABLE SPECIFICATION verified manually by running the `designer` agent. DISTILL will add more.

@walking_skeleton @driving_port
Feature: Brief becomes a grounded, runnable design
  As a facilitator
  I want to turn a workshop brief into a timed agenda grounded in proven practices
  So that I walk in with a runnable design instead of a blank page

  Scenario: Designer turns a brief into a grounded, time-reconciled design
    Given a brief.md with a goal, audience, group size, duration, medium, and sensitivities
    And a practices/ library of facilitation structures
    When I run the `designer` agent on the brief
    Then a design.md is written next to the brief
    And every structure in the agenda cites a practice file that exists in practices/
    And the agenda total is reconciled against the brief's time box with trim/expand variants
    And the design honors the brief's sensitivities (e.g. does not lead with the convener's solution)
    And a missing brief field is asked about or stated as an explicit assumption — never silently invented

  # Manual verification of record (walking skeleton):
  #   - workshops/EXAMPLE-team-retro/{brief,design}.md  (committed, sanitized)
  #   - workshops/cross-team-collab-s1/{brief,design}.md (private, gitignored) — real session, rated runnable by the facilitator
