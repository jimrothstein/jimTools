#!/usr/bin/env Rscript
#
#  Why works?    Kernel sees shebang
#  /usr/bin/env  tells kernel where to find ($PATH) program <Rscript>
#
#  REF:  <https://stackoverflow.com/questions/21732524/how-to-know-what-script-header-to-use-and-why-it-matters>
#
#### check_before_push.R  ------------------------ 
PURPOSE:   Run several checks on pkg

library(devtools)
library(styler)


check <- function(file) {
  styler::style_file(file) # can also style_pkg()
  devtools::lint(".") #  lintr::lint_dir lintr::lint_package
  devtools::spell_check(pkg = ".")
}

file <- "~/code/jimTools/Rscripts/check_before_push.R"
check(file)
