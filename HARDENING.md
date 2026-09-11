<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v7.1.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v7.1.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The composite action step in subaction/matrix/action.yml uses `actions/github-script@v8`, which is a mutable version tag rather than a pinned 40-character commit SHA. This means the action could be silently updated to a different (potentially malicious) version without any change to this repository, creating a supply-chain risk.

Locations:

- `subaction/matrix/action.yml:29`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v8` to `actions/github-script@ed597411d8f924073f98dfc5c65a23a2325f34cd # v8` in `hardened/action/subaction/matrix/action.yml` (line 29). The mutable version tag was replaced with the resolved full 40-character commit SHA to eliminate the supply-chain risk.

