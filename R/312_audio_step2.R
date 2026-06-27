# Step2: Reformat trailing dates (_YYYY_MM_DD or _YYYY-MM-DD) before extension to DDMMMYYYY

if (!"cleaned_name" %in% colnames(audio_files)) {
  src <- audio_files$step1
  pat <- "_(\\d{4})[_-](\\d{2})[_-](\\d{2})(\\.[a-zA-Z0-9]+)$"
  has_date <- stringr::str_detect(src, pat)

  cleaned_name <- src

  if (any(has_date)) {
    parts <- stringr::str_match(src, pat)
    date_obj <- as.Date(paste(parts[has_date, 2], parts[has_date, 3], parts[has_date, 4], sep = "-"))
    reformatted <- toupper(format(date_obj, "%d%b%Y"))
    prefix <- stringr::str_replace(src[has_date], pat, "")
    cleaned_name[has_date] <- paste0(prefix, "_", reformatted, parts[has_date, 5])
  }

  audio_files <- audio_files |>
    dplyr::mutate(cleaned_name = cleaned_name)

  changed <- sum(audio_files$original != audio_files$cleaned_name)
  cat("cleaned_name column added. Files changed:", changed, "of", nrow(audio_files), "\n")

  saveRDS(audio_files, paste0(RDS_dir, thefile))
}
