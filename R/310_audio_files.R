# for code/output
thedir = "~/code/jimTools/"
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

print(audio_files, n = nrow(audio_files))

# remove prefix
source("R/311_audio_step1.R")

# clean suffix
