#!/usr/bin/env Rscript

# daily_git_push.R
#
# 	TODO
# 	  - add_commit_push  clean up if statements
#         - ~/git_log.log  ADD dates, more info
# 	  - more tinytest::


# PURPOSE:  update all github repos (SEE list: all_repos.R)
# USAGE:

#library(tinytest)

# 	FIRST, all the code repos
# 	---------------------
#

source("~/code/jimTools/Rscripts/all_repos.R")
# 	---------------------
# Each dir, this function does actual git work.
add_commit_push <- function(dir = NULL) {
  if (is.null(dir) || is.na(dir) || nchar(dir) == 0) {
    return(FALSE)
  }

  # stop if any args NOT TRUE
  if (!dir.exists(dir)) {
    return(FALSE)
  }
  # stop if evaluates to F
  stopifnot(!is.null(dir) && !is.na(dir) &&
    !(nchar(dir) == 0) && dir.exists(dir))
  old <- setwd(dir)
  system2("git", args = c("add", "."))

  ## works
  system2("git", args = c(paste0("commit -m ", "wip", " >>", " ~/git_log.log")))
  system2("git", args = c("push", "--quiet"))
  cat("---------------------------------\n")
  cat("pushed ....", dir, "\n")
  cat("---------------------------------\n")
  setwd(old)
  if (FALSE) {
    system2("git", args = c("status"))
    getwd()
  }
  TRUE
}
system2("echo", args = c(
  paste0("today = ", as.character(Sys.Date())),
  " >> ", "~/git_log.log"
))
invisible(vapply(x, add_commit_push, FUN.VALUE = FALSE))

if (FALSE) {
  vapply(x, add_commit_push, FUN.VALUE = FALSE)
  expect_false(add_commit_push(dir = ""))
  expect_error(add_commit_push(dir = NULL))
  expect_error(add_commit_push())
  expect_true(add_commit_push(dir = dir))
  expect_true(add_commit_push(dir = x[[1]]))
}
print("stop")
