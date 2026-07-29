# Run styler, line, spell on a file

# TODO:  Run only single file.

library(devtools)
library(styler)

file <- "~/code/jimTools/R/25_styler_lint_spell.R"

check <- function(file) {
  styler::style_file(file) # can also style_pkg()

  # wants to lint package
  devtools::lint(file) #  lintr::lint_dir lintr::lint_package

  devtools::spell_check(pkg = ".")
}

check(file)
