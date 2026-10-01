<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v7.1.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v7.1.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The composite action step uses `actions/github-script@v8`, which is a mutable tag reference rather than a pinned 40-character commit SHA. If the tag is moved (e.g., by a supply-chain compromise), the action will silently execute different code. Pin to a full SHA, e.g. `actions/github-script@60a0d83039c74a4aee543508d2ffcb1c3799cdea # v7` or the equivalent v8 SHA.

Locations:

- `subaction/matrix/action.yml:27`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v8` to its full commit SHA `ed597411d8f924073f98dfc5c65a23a2325f34cd` in `hardened/action/subaction/matrix/action.yml` (line 27). The original tag is preserved as a comment: `# v8`.

