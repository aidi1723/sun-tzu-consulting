# Project Closeout

Date: 2026-07-04

## Repository Status

- Repository: `sun-tzu-consulting`
- Default branch: `main`
- Release tag: `v1.0`
- Release commit: `b5b58c7` (`Prepare Sun Tzu consulting skill release`)
- GitHub Release: https://github.com/aidi1723/sun-tzu-consulting/releases/tag/v1.0
- License: MIT

## Completed Work

- Published the L1 macro-strategy consulting skill based on Sun Tzu's Five Factors and Seven Calculations.
- Fixed the L1 to L2 handoff contract so it matches `thirty-six-strategies` fields:
  `context_type`, `dilemma_or_input`, `my_resources_and_position`, `opponent_profile`.
- Added `scripts/validate.rb` for deterministic local validation.
- Added MIT license and release documentation.
- Preserved the remote privacy-scan workflow and added contract validation for the handoff JSON example.

## Verification Evidence

Run from this repository:

```bash
ruby scripts/validate.rb
bash scripts/privacy-scan.sh
git status --short --branch
```

Expected:

- `ruby scripts/validate.rb` prints `Validation passed`.
- `bash scripts/privacy-scan.sh` exits with status `0` and no findings.
- `git status --short --branch` reports `main...origin/main` with no file changes.

For cross-repository validation from the parent directory that contains both
skill repositories, use the Ruby validation snippet from `DEVELOPMENT.md` when a
full frontmatter, YAML, JSON schema, and Markdown fence check is needed across
both skills.

## Maintenance Rules

- Do not move `v1.0` for maintenance-only commits.
- Keep L1 handoff examples parseable JSON and compatible with the current L2 schema.
- Run `ruby scripts/validate.rb` before every commit.
- Run `bash scripts/privacy-scan.sh` before publishing or creating a release.
- If `thirty-six-strategies` changes its input schema, update `references/workflow-handoff.md`,
  `references/schema.md`, and this repository's validator in the same change.

## Remaining Optional Work

- Add more industry-specific examples in `references/examples.md` when real usage reveals gaps.
- Add a future `v1.1` release only after behavior, schema, or reference content changes materially.
