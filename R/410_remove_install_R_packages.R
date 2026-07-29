# Remove all installed R packages,  with EXCEPTIONS

# CAUTION:  Will need to add back a number of R packages.
# MAY NEED to re-run:
# sudo apt install -y r-cran-rcpp r-cran-httr2 r-cran-promises r-cran-later
# KEEP positron closed !

# tidyverse
# Packages you want to keep
keep <- c(
  "tidyverse",
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr",
  "purrr",
  "tibble",
  "stringr",
  "forcats",
  "lubridate",
  "broom",
  "tidyselect",
  "vctrs",
  "pillar",
  "rlang",
  "cli",
  "glue",
  "magrittr",
  "ellipsis",
  "R6",
  "withr",
  "scales",
  "gtable",
  "isoband",
  "farver",
  "labeling",
  "colorspace",
  "utf8",
  "pkgconfig",
  "generics",
  "pak",
  "devtools"
  
)

# Only operate on your personal library
user_lib <- normalizePath(.libPaths()[1])

ip <- as.data.frame(installed.packages(lib.loc = user_lib))

# keep these
ip <- ip[!(ip$Priority %in% c("base", "recommended")), ]

# Start with everything not on the keep list
to_remove <- setdiff(rownames(ip), keep)

# Remove packages only if they are not needed by anything you keep
needed_by_keep <- unique(unlist(
  tools::package_dependencies(
    packages = keep,
    db = installed.packages(lib.loc = user_lib),
    recursive = TRUE
  )
))

to_remove <- setdiff(to_remove, needed_by_keep)

# Uninstall
for (p in to_remove) {
  remove.packages(p, lib = user_lib)
}
