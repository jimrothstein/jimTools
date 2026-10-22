# GOAL: list all audio files, produce cleaned tibble with date-reformatted filenames

## Always be terse
- Never do more than asked.
- Do not guess. (Ask user when not certain)
- Never proceed without user giving permission.
- Never run R code without the user's permission.

## Directories
- Source: `~/mp3_downloads`
- R scripts: `~/code/jimTools/R`
- Output (*.RDS): `~/code/jimTools/data/output/`

## Tools
- Use R with tidyverse (tibble, dplyr, stringr).
- Never use bash/zsh script files.
- `install.packages()` must specify `repos = "https://cran.r-project.org"`.

## Pipeline (3-step, orchestrated by 310)

### 310_audio_files.R (orchestrator)
1. Sets output filename to `{DDMMMYYYY}_audio_files.RDS` (e.g. `27JUN2026_audio_files.RDS`)
2. Lists all files from `~/mp3_downloads` into a tibble with column `original`
3. Sources `311_audio_step1.R`, then `312_audio_step2.R`
4. Final `saveRDS(audio_files, paste0(RDS_dir, thefile))` — guarantees save regardless of step scripts

### 311_audio_step1.R
- Adds column `step1` = copy of `original` (if not already present)
- Saves conditionally after adding

### 312_audio_step2.R
- Adds column `cleaned_name` (if not already present)
- Detects trailing dates in filenames matching `_YYYY_MM_DD` or `_YYYY-MM-DD` before extension
- Reformats to `_DDMMMYYYY` (e.g. `song_2024_01_15.mp3` → `song_15JAN2024.mp3`)
- Files without trailing dates are left unchanged
- Files with no extension are left unchanged
- Reports count of changed files to console
- Saves conditionally after adding

## Output
- RDS file containing a tibble with 3 columns:
  - `original` — raw filename as listed
  - `step1` — copy of original (placeholder for further cleaning)
  - `cleaned_name` — filename with trailing dates reformatted to DDMMMYYYY

##  
data/output/ddMMMYYYY_mp3

## Directory validation
- `stopifnot("Directory not found" = dir.exists(dir))` checks source directory exists

## Edge cases handled
- 40 files with no extension are left unmodified
- Step scripts save conditionally (skip if column already exists)
- Final orchestrator always saves, so partial runs still produce output

## When to STOP
When you read any of these words on a single line, in capital letters, you stop reading and processing.
Do nothing until user instructs you.

- "STOP"
- "END"
- "WAIT FOR USER"

STOP
