<!-- markdownlint-disable -->

# Hardening Report: docker--bake-action/v7.2.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **docker--bake-action/v7.2.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### script-injection (severity: high)

Sub-rule (a): Four `run:` blocks in .github/workflows/ci.yml directly interpolate `${{ steps.bake.outcome }}` and `${{ steps.bake.conclusion }}` expressions inside shell command strings. Per the check rules, ANY `${{ ... }}` expression directly inside a `run:` block is a script injection risk, including `steps.*` context values. The offending pattern appears in the `error-check`, `error-source`, `call-check`, and `call-check-multi` jobs:

```
if [ "${{ steps.bake.outcome }}" != "failure" ] || [ "${{ steps.bake.conclusion }}" != "success" ]; then
```

These values should be moved to an `env:` block and the shell variable should be double-quoted in the `run:` script.

Locations:

- `.github/workflows/ci.yml:122`
- `.github/workflows/ci.yml:142`
- `.github/workflows/ci.yml:622`
- `.github/workflows/ci.yml:648`

## Iteration Notes

### Iteration 1

**Fixes applied:** script-injection

**Notes:**

Fixed all four script injection instances in .github/workflows/ci.yml. In the `error-check`, `error-source`, `call-check`, and `call-check-multi` jobs, moved `${{ steps.bake.outcome }}` and `${{ steps.bake.conclusion }}` expressions from inline `run:` shell strings into `env:` blocks as `BAKE_OUTCOME` and `BAKE_CONCLUSION`. The shell scripts now reference these as double-quoted environment variables (`"$BAKE_OUTCOME"` and `"$BAKE_CONCLUSION"`), eliminating the script injection risk.

