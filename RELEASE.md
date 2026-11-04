# Release documentation

## Automated release

A stable wasmCloud release sends a `brew-formula-update` `repository_dispatch` here, which starts the `brew formula update` workflow. It can also be run with `workflow_dispatch`:

- **`tag_version`** (required): The version to release (e.g. `2.0.1` or `v2.0.1`).
- **`tag_prefix`** (optional): Prefix for the release tag in wasmCloud/wasmCloud. Leave empty for `v*` tags, set to `wash` for `wash-v*` tags.

The workflow downloads the release binaries, generates `Formula/wash.rb`, and opens a PR with an octo-sts token (`.github/chainguard/formula-update.sts.yaml`). It queues auto-merge on that PR and closes any open formula PR for an older version. A version at or below the formula's current one is skipped.

The PR merges itself once the required `brew test-bot` checks pass. If a check fails, the PR stays open and the formula stays where it was.

## Repository settings this relies on

- **Allow auto-merge** is on.
- A ruleset on `main` requires the `test-bot (ubuntu-24.04)` and `test-bot (macos-15)` status checks, with no required approvals. Without required checks, auto-merge merges at once; with a required approval, it waits for a person.
