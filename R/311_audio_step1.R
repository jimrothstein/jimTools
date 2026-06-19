# Step1: add Step 1 if not already present
if (!"Step1" %in% colnames(audio_files)) {
  audio_files = audio_files |>
    dplyr::mutate(step1 = original)

  saveRDS(audio_files, file = thefile)
}

p