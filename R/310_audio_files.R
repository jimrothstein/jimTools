# for data output
RDS_dir <- "~/code/jimTools/data/output/"
theDate <- toupper(format(Sys.Date(), "%d%b%Y"))
thefile <- paste0(theDate, "_audio_files", ".RDS")

# original source of mp3 files
dir <- path.expand("~/mp3_downloads")


stopifnot("Directory not found" = dir.exists(dir))

pkgs <- c("tibble", "dplyr", "stringr")
new_pkgs <- pkgs[!pkgs %in% installed.packages()[, "Package"]]
if (length(new_pkgs)) {
  install.packages(new_pkgs, repos = "https://cran.r-project.org")
}

files <- list.files(dir)

audio_files <- tibble::tibble(
  original = files
)

print(audio_files, n = nrow(audio_files))

# remove prefix -----
source("R/311_audio_step1.R")
source("R/312_audio_step2.R")

saveRDS(audio_files, paste0(RDS_dir, thefile))

