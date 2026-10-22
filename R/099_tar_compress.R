#'  compress_dir
#'  @param prefex string to prefix output file name.
#'  @param type Either `project` (ie R) or `system`
#'  @example
#' 	@export
compress_dir <- function(prefix = NULL,
                         out_file = NULL,
                         type = c("project", "system"),
                         dir = NULL) {
  if (type == "project") {
    tar(
      tarfile = here("compressed", out_file),
      files = here(dir),
      # extra_flags = "-X rmd/exclude_files.txt"   to exclude
      compression = c("gzip")
    )
  } else {
    output_dir <- "~/Downloads/toGoogle"
    tar(
      tarfile = paste0(output_dir, "/", out_file),
      files = dir,
      compression = c("gzip")
    )
  }
}


#' 	@export
get_prefix <- function() {
  #  x  <- lubridate::today() # YYYY-MM-DD
  x <- lubridate::now()
  cat("Preparing prefix ...", "\n")
  prefix <- paste(
    lubridate::year(x),
    lubridate::month(x, label = TRUE, abbr = TRUE),
    stringr::str_pad(lubridate::day(x),
      width = 2, side = c("left"), pad = "0"
    ),
    lubridate::hour(x),
    lubridate::minute(x),
    # lubridate::second(x),
    sep = "_"
  )
}

#' 	@export
get_compressed_file_name <- function(prefix = NULL,
                                     dir = NULL) {
  cat("Preparing file_name ...", "\n")
  out_file <- paste0(
    prefix,
    "_ARCHIVE_",
    basename(dir),
    ".tar.gz"
  )
}
