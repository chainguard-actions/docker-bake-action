<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v6.10.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v6.10.0** was hardened automatically. 1 finding(s) were identified and resolved across 2 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Both subaction files reference `actions/github-script@v7`, which is a mutable tag reference rather than a pinned 40-character commit SHA. This means the action could silently pull in changed or malicious code if the tag is moved. Each should be pinned to a full SHA, e.g. `actions/github-script@60a0d83039c74a4aee543508d2ffcb1c3799cdea # v7`.

Locations:

- `subaction/list-targets/action.yml:27`
- `subaction/matrix/action.yml:27`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned `actions/github-script@v7` to `actions/github-script@f28e40c7f34bde8b3046d885e986cb6290c5673b # v7` in both subaction/list-targets/action.yml (line 27) and subaction/matrix/action.yml (line 27). The full commit SHA was resolved via git ls-remote.

### Iteration 2

**Fixes applied:** unpinned-uses, script-injection, missing-permissions

**Notes:**

Fixed all three findings across 5 workflow files:

1. unpinned-uses: Pinned all action refs to full 40-char SHAs with tag comments in ci.yml, ci-subaction.yml, publish.yml, test.yml, and validate.yml. Actions pinned: actions/checkout@df4cb1c, docker/setup-qemu-action@c7c53464, docker/setup-buildx-action@8d2750c6, docker/metadata-action@c299e40c, actions/github-script@ed597411, actions/publish-immutable-action@4bc8754f, docker/bake-action@5be5f02f, codecov/codecov-action@0fb71748.

2. script-injection: Fixed 3 occurrences in ci.yml (error-check, call-check, call-check-multi jobs) where ${{ steps.bake.outcome }} and ${{ steps.bake.conclusion }} were directly interpolated in run: shell strings. Moved them to env: blocks as BAKE_OUTCOME and BAKE_CONCLUSION, referenced as plain shell variables.

3. missing-permissions: Added top-level 'permissions: contents: read' to ci.yml, ci-subaction.yml, test.yml, and validate.yml. publish.yml already had job-level permissions.

