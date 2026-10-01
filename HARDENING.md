<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v7.0.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v7.0.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The composite action at subaction/matrix/action.yml references `actions/github-script@v7` using a mutable version tag (`@v7`) rather than a pinned 40-character commit SHA. This means the action could be silently updated to a different (potentially malicious) version without any change to this repository, creating a supply-chain risk.

Locations:

- `subaction/matrix/action.yml:29`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v7` to full commit SHA `f28e40c7f34bde8b3046d885e986cb6290c5673b` in `hardened/action/subaction/matrix/action.yml` (line 29). The original tag is preserved as a comment (`# v7`) for readability.

