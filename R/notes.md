# 310_audio_files.R — Session Summary (27 Jul 2026)

**Goal:** Clean ~5,015 filenames in `~/mp3_downloads`. Apply rules to produce `step1` (clean filename).

## Design

- Single data frame `audio_files` with columns `original`, `step1`
- No `numbered`/`non_numbered` split
- No `step2` column yet
- Rules applied via `case_when` — single pass, each file hits exactly one rule
- Rules are listed explicitly in the code for clarity

## Rules (so far)

| # | Condition | Action |
|---|---|---|
| R1 | Starts with letter | `step1 = original` |
| R2 | Starts with `＂` (fullwidth quote) | `step1 = original` |
| R3 | Starts with `'` or `''` | `step1 = original` |
| R4 | Starts with `(` or `[` | `step1 = original` |
| R5 | Starts with `«` | `step1 = original` |
| R6 | Starts with `~` | `step1 = original` |
| R7 | Starts with space | `step1 = original` |
| R8 | Starts with digit | `step1 = original` |
| R9 | Starts with `♫`/`♪` | strip leading symbol (+ trailing space/underscore) |
| R10 | Everything else | `step1 = original` |

## Open Questions

1. **`“` (left double quotation mark, U+201C)** — 2 files: keep as-is or strip?
   - `“Make The World Go Away” - Lauren Mascitti (cover)🌹_17Oct2023.ogg`
   - `“Take Away These Tears” Sandy Wilde's 60s Heartache Anthem..._20Jul2025.ogg`

2. **Iteration** — After running, inspect `step1` column to find any remaining bad filenames, then add/modify rules.

## Prefix Patterns Found (49 non-letter-started files out of 5,015)

| Count | Prefix | Status |
|---|---|---|
| 4966 | (letter-started) | R1 — keep |
| 7 | `♫` | R9 — strip |
| 6 | `＂` | R2 — keep |
| 4 | `'` | R3 — keep |
| 4 | `(` | R4 — keep |
| 3 | ` ` (space) | R7 — keep |
| 3 | `[` | R4 — keep |
| 3 | `78` / `78 ` / `78_` / `78rpm` | R8 — keep |
| 3 | `60` / `60_` / `` 60` `` | R8 — keep |
| 2 | `''` | R3 — keep |
| 2 | `“` | Open question |
| 2 | `~ ` / `~_` | R6 — keep |
| 1 | `♫ ` | R9 — strip |
| 1 | `♫_` | R9 — strip |
| 1 | `♪_` | R9 — strip |
| 1 | `05. ` | R8 — keep |
| 1 | `1` (`1st RECORDING...`) | R8 — keep |
| 1 | `28._` | R8 — keep |
| 1 | `4_` | R8 — keep |
| 1 | `40` (`40s_Music...`) | R8 — keep |
| 1 | `45` (`45RPM...`) | R8 — keep |
| 1 | `«` | R5 — keep |
