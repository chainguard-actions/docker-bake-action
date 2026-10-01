<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v6.9.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v6.9.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Both subaction files reference `actions/github-script@v7` using a mutable version tag instead of a pinned 40-character commit SHA. This means a compromised or altered version of the action could be silently substituted, enabling a supply-chain attack. Each reference should be pinned to a full SHA, e.g. `actions/github-script@60a0d83039c74a4aee543508d2ffcb1c3799cdea # v7`.

Locations:

- `subaction/list-targets/action.yml:27`
- `subaction/matrix/action.yml:29`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v7` to `actions/github-script@f28e40c7f34bde8b3046d885e986cb6290c5673b # v7` in both:
- hardened/action/subaction/list-targets/action.yml (line 27)
- hardened/action/subaction/matrix/action.yml (line 29)

The SHA was resolved via lookup_action_sha and the mutable tag is retained as a comment for readability.

