# Step2: add Step2 with numeric prefix removed
audio_files = readRDS(thefile)
audio_files = audio_files |>
  dplyr::mutate(Step2 = stringr::str_remove(original, "^\\d{3,4}_"))

saveRDS(audio_files, file = thefile)

