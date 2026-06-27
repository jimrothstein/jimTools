# Step2: Strip trailing dates (_YYYY_MM_DD or _YYYY-MM-DD) before extension

if (!"cleaned_name" %in% colnames(audio_files)) {
  audio_files <- audio_files |>
    dplyr::mutate(
      cleaned_name = stringr::str_replace(
        original,
        "_\\d{4}[_-]\\d{2}[_-]\\d{2}(\\.[a-zA-Z0-9]+)$",
        "\\1"
      )
    )

  changed <- sum(audio_files$original != audio_files$cleaned_name)
  cat("cleaned_name column added. Files changed:", changed, "of", nrow(audio_files), "\n")

  saveRDS(audio_files, paste0(RDS_dir, thefile))
}
