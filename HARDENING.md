<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v7.0.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v7.0.0** was hardened automatically. 3 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow files and subaction/matrix/action.yml use mutable tag-based (not SHA-pinned) `uses:` references, making them vulnerable to supply-chain attacks if the referenced action is compromised or its tag is moved. Failing references include: `actions/checkout@v6`, `docker/setup-qemu-action@v4`, `docker/setup-buildx-action@v3`, `docker/metadata-action@v5`, `actions/github-script@v8` (ci-subaction.yml), `docker/bake-action@v6` (test.yml, update-dist.yml, validate.yml), `codecov/codecov-action@v5` (test.yml), `actions/create-github-app-token@v2` (update-dist.yml), `actions/publish-immutable-action@v0.0.4` (publish.yml), and `actions/github-script@v7` (subaction/matrix/action.yml). All should be pinned to full 40-character commit SHAs.

Locations:

- `.github/workflows/ci.yml:47`
- `.github/workflows/ci-subaction.yml:108`
- `.github/workflows/test.yml:20`
- `.github/workflows/update-dist.yml:13`
- `.github/workflows/validate.yml:18`
- `.github/workflows/publish.yml:14`
- `subaction/matrix/action.yml:28`

### missing-permissions (severity: medium)

Five workflow files have no top-level `permissions:` key and no job-level `permissions:` keys on any of their jobs. Without explicit permissions, workflows run with the default (potentially write) token permissions, violating the principle of least privilege. Affected files: ci.yml, ci-subaction.yml, test.yml, update-dist.yml, and validate.yml.

Locations:

- `.github/workflows/ci.yml:1`
- `.github/workflows/ci-subaction.yml:1`
- `.github/workflows/test.yml:1`
- `.github/workflows/update-dist.yml:1`
- `.github/workflows/validate.yml:1`

### script-injection (severity: high)

Sub-rule (a): Four `run:` blocks in ci.yml directly interpolate `${{ steps.bake.outcome }}` and `${{ steps.bake.conclusion }}` expressions inside shell command strings. Any `${{ ... }}` expression interpolated directly into a `run:` block is a script-injection risk because the value is substituted by the YAML template engine before the shell ever sees it, bypassing shell quoting. The affected pattern is: `if [ "${{ steps.bake.outcome }}" != "failure" ] || [ "${{ steps.bake.conclusion }}" != "success" ]`. These should be moved to `env:` variables and referenced as `"$STEP_OUTCOME"` in the shell script.

Locations:

- `.github/workflows/ci.yml:82`
- `.github/workflows/ci.yml:100`
- `.github/workflows/ci.yml:497`
- `.github/workflows/ci.yml:519`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions, script-injection

**Notes:**

Fixed all three findings across 7 files:

1. unpinned-uses: Pinned all mutable tag-based uses references to full 40-char SHAs in ci.yml, ci-subaction.yml, test.yml, update-dist.yml, validate.yml, publish.yml, and subaction/matrix/action.yml. All SHAs were resolved via lookup_action_sha.

2. missing-permissions: Added top-level `permissions: contents: read` to ci.yml, ci-subaction.yml, test.yml, and validate.yml. Added `permissions: contents: write` to update-dist.yml (needed for git push). publish.yml already had job-level permissions.

3. script-injection: Fixed all 4 locations in ci.yml (error-check, error-source, call-check, call-check-multi jobs) where `${{ steps.bake.outcome }}` and `${{ steps.bake.conclusion }}` were directly interpolated in run: shell strings. Moved them to env: blocks as BAKE_OUTCOME and BAKE_CONCLUSION, then referenced as plain shell variables in the run: scripts.

