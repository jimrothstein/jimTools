#
get_file_counts <- function(dir_path) {
  if (!fs::dir_exists(dir_path)) {
    stop("Directory does not exist.")
  }

  files <- fs::dir_ls(dir_path, recurse = FALSE, type = "file")
  exts <- fs::path_ext(files)
  exts <- stringr::str_to_lower(exts)
  exts <- base::ifelse(exts == "", "no_extension", exts)

  counts_table <- base::table(exts)
  counts_df <- base::as.data.frame(counts_table)

  tibble::as_tibble(counts_df) |>
    stats::setNames(c("File_Type", "Count"))
}
