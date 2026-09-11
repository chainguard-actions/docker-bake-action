<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v6.9.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v6.9.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Both subaction files reference `actions/github-script@v7`, which is a mutable tag reference rather than a pinned 40-character commit SHA. This exposes the action to supply-chain attacks if the tag is moved to point to a different (potentially malicious) commit. Each should be pinned to a full SHA, e.g. `actions/github-script@60a0d83039c74a4aee543508d2ffcb1c3799cdea # v7`.

Locations:

- `subaction/list-targets/action.yml:26`
- `subaction/matrix/action.yml:28`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v7` to its full commit SHA `f28e40c7f34bde8b3046d885e986cb6290c5673b` in both `subaction/list-targets/action.yml` (line 26) and `subaction/matrix/action.yml` (line 28). The mutable tag reference is preserved as a comment for readability.

