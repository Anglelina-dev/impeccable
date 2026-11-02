# Anglelina-dev fork notes

This fork tracks [pbakaus/impeccable](https://github.com/pbakaus/impeccable) and applies a few **approved, still-unmerged** upstream bug fixes so they are usable before main lands them.

## Bugs reviewed (upstream)

| Issue | Severity | Status on this fork | Upstream |
|---|---|---|---|
| [#988](https://github.com/pbakaus/impeccable/issues/988) Static scan mixes mutually exclusive `@media` values → false `low-contrast` | P2, approved | **Fixed** | [PR #1079](https://github.com/pbakaus/impeccable/pull/1079) |
| [#846](https://github.com/pbakaus/impeccable/issues/846) Checkout/worktree mtimes falsely mark `DESIGN.md` sidecar stale | P3, approved | **Fixed** | [PR #1195](https://github.com/pbakaus/impeccable/pull/1195) |
| [#950](https://github.com/pbakaus/impeccable/issues/950) `inert` content under overlays still scored (occlusion / nested cards) | P2, approved | **Fixed** | [PR #1160](https://github.com/pbakaus/impeccable/pull/1160) |
| [#964](https://github.com/pbakaus/impeccable/issues/964) Image-only `background` shorthand keeps stale `background-color` | P3 | Open (needs hover-pass design) | Related: #806 |
| [#1264](https://github.com/pbakaus/impeccable/issues/1264) `critique` score never converges across rounds | needs triage | Not ported | [PR #1272](https://github.com/pbakaus/impeccable/pull/1272) |
| [#1273](https://github.com/pbakaus/impeccable/issues/1273) Comp-led build: header crops shift; `--force` finish blocked | needs triage | Not ported | — |
| [#1190](https://github.com/pbakaus/impeccable/issues/1190) Global install writes Codex/Grok hooks into the project | needs triage | Partial upstream fix (#1208 closed) | — |
| [#1175](https://github.com/pbakaus/impeccable/issues/1175) Engine binary copied into every harness skill dir | needs triage | Not ported | — |

## What we verified locally

Reproduced #988 on published `impeccable@4.8.0`:

```bash
npx impeccable@4.8.0 detect dark_tokens.html --json
# → low-contrast 1.1:1 — text #eef0f4 on #ffffff
```

After the media-environment fix on this branch, the same fixture returns no findings under the default static environment (`screen`, light scheme, 1280×800).

Focused tests run green:

- `cargo test -p impeccable-html --test media_environment`
- `cargo test -p impeccable-context --test design_sidecar`
- `cargo test -p impeccable-browser --test inert_under_overlay`

## Attribution

Ported with credit to the upstream PR authors (`mager`, `openwong2kim`) and maintainer policy decisions on the linked issues. Prefer merging upstream when those PRs land, then rebase this fork.

## Branch

Working branch: `cursor/fix-static-media-988-f428` (name kept for the first fix; also carries #846 and #950).
