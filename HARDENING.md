<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v6.9.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v6.9.0** was hardened automatically. 1 finding(s) were identified and resolved across 2 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Both subaction files reference `actions/github-script@v7`, which is a mutable version tag rather than a pinned 40-character SHA commit hash. This means the action could silently change if the tag is moved, enabling supply-chain attacks. Both occurrences should be replaced with a full SHA pin, e.g. `actions/github-script@60a0d83039c74a4aee543508d2ffcb1c3799cdea # v7`.

Locations:

- `subaction/list-targets/action.yml:27`
- `subaction/matrix/action.yml:29`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Replaced `actions/github-script@v7` with the pinned SHA `actions/github-script@f28e40c7f34bde8b3046d885e986cb6290c5673b # v7` in both:
- hardened/action/subaction/list-targets/action.yml (line 27)
- hardened/action/subaction/matrix/action.yml (line 29)

The SHA was resolved using lookup_action_sha for the v7 tag.

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions, script-injection

**Notes:**

Fixed all three findings across 5 workflow files:

1. unpinned-uses: Pinned all 8 distinct action references to full 40-char SHAs with tag comments preserved: actions/checkout@v5, docker/setup-qemu-action@v3, docker/setup-buildx-action@v3, docker/metadata-action@v5, actions/github-script@v7, docker/bake-action@v6, codecov/codecov-action@v5, actions/publish-immutable-action@v0.0.4.

2. missing-permissions: Added top-level `permissions: {}` to ci.yml, ci-subaction.yml, test.yml, and validate.yml. publish.yml already had appropriate job-level permissions.

3. script-injection: In all three Check steps (error-check, call-check, call-check-multi jobs in ci.yml), moved `${{ steps.bake.outcome }}` and `${{ steps.bake.conclusion }}` out of run: shell strings into env: blocks as BAKE_OUTCOME and BAKE_CONCLUSION, then referenced those env vars in the shell scripts.

