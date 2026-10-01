<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v7.1.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v7.1.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The composite action step in subaction/matrix/action.yml references `actions/github-script@v8`, which is pinned to a mutable version tag (`@v8`) rather than an immutable 40-character commit SHA. This means the action could be silently updated or compromised without the consuming workflow noticing, enabling a supply-chain attack.

Locations:

- `subaction/matrix/action.yml:29`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v8` to the full commit SHA `actions/github-script@ed597411d8f924073f98dfc5c65a23a2325f34cd # v8` in `hardened/action/subaction/matrix/action.yml` (line 29). SHA was resolved via lookup_action_sha.

