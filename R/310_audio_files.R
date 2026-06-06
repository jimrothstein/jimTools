---version:0.002
---
  # for code/output
  thedir
= "~/code/jimTools/"
thefile = paste0(thedir, "R/audio_files.RDS")


# source of mp3 files
dir <- path.expand("~/mp3_downloads")

stopifnot("Directory not found" = dir.exists(dir))

pkgs <- c("tibble", "dplyr", "stringr")
new_pkgs <- pkgs[!pkgs %in% installed.packages()[, "Package"]]
if (length(new_pkgs)) {
  install.packages(new_pkgs)
}

files <- list.files(dir)
audio_files <- tibble::tibble(
  original = files
)

# object, path
saveRDS(audio_files, file = thefile)
rm(audio_files)

audio_files = readRDS(thefile)

# Try1: add try_one if not already present
if (!"try_one" %in% colnames(audio_files)) {
  audio_files = audio_files |>
    dplyr::mutate(try_one = original)

  saveRDS(audio_files, file = thefile)
}

# Try2: add try2 with numeric prefix removed
audio_files = readRDS(thefile)
audio_files = audio_files |>
  dplyr::mutate(try2 = stringr::str_remove(original, "^\\d{3,4}_"))

saveRDS(audio_files, file = thefile)

print(audio_files, n = nrow(audio_files))
