# Release documentation

## Automated release

The `brew formula update` workflow can be triggered via `workflow_dispatch` or `repository_dispatch`:

- **`tag_version`** (required): The version to release (e.g. `2.0.1` or `v2.0.1`).
- **`tag_prefix`** (optional): Prefix for the release tag in wasmCloud/wasmCloud. Leave empty for `v*` tags, set to `wash` for `wash-v*` tags.

The workflow downloads release artifacts, generates the formula, and opens a PR.

## Bottling and publishing

1. Wait for tests to pass on the PR.
2. Add the `pr-pull` label to the PR. This triggers the publish workflow which bottles, pushes commits, and closes the PR.
