# for data output
RDS_dir <- "~/code/jimTools/data/output/"
date_stamp <- toupper(format(Sys.Date(), "%d%b%Y"))

# original source of mp3 files
dir <- path.expand("~/mp3_downloads")

stopifnot("Directory not found" = dir.exists(dir))

pkgs <- c("tibble", "dplyr", "stringr")
new_pkgs <- pkgs[!pkgs %in% installed.packages()[, "Package"]]
if (length(new_pkgs)) {
  install.packages(new_pkgs, repos = "https://cran.r-project.org")
}

files <- list.files(dir)

audio_files <- tibble::tibble(original = files) |>
  dplyr::mutate(step1 = original)

# --- Rules for original -> step1 ---
# Apply sequentially. Each rule operates on step1 from the previous step.
#
# Rule 1: Remove leading non-alphanumeric characters (but preserve "(" and "[")
#   "_song.mp3"    -> "song.mp3"
#   "?song.mp3"    -> "song.mp3"
#   ".-_song.mp3"  -> "song.mp3"
#   "(HQ)_song.mp3" -> "(HQ)_song.mp3"
#   "[HQ]_song.mp3" -> "[HQ]_song.mp3"
#
# Rule 2: Remove leading digit prefix (4-6 digits followed by "_")
#   "1234_song.mp3"  -> "_song.mp3"
#   "12345_song.mp3" -> "_song.mp3"
#   "123456_song.mp3" -> "_song.mp3"
#   "4_song.mp3"     -> NOT changed (only 1 digit)
#   "40s_song.mp3"   -> NOT changed (has trailing "s")
#   "[HQ]_song.mp3"  -> NOT changed (not a digit prefix)
#
# Rule 3: Remove leading "NA" prefix (with optional trailing underscore)
#   "NA_song.mp3" -> "song.mp3"
#   "NAsong.mp3"  -> "song.mp3"

audio_files <- audio_files |>
  dplyr::mutate(step1 = stringr::str_remove(step1, "^[^[:alnum:](\\[]+"))

audio_files <- audio_files |>
  dplyr::mutate(step1 = stringr::str_remove(step1, "^[0-9]{4,6}_"))

audio_files <- audio_files |>
  dplyr::mutate(step1 = stringr::str_remove(step1, "^NA_?"))

dplyr::glimpse(audio_files)

saveRDS(audio_files, paste0(RDS_dir, date_stamp, "_audio_files", ".RDS"))
