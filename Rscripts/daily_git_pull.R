#!/usr/bin/env Rscript
#
#  Why works?    Kernel sees shebang
#  /usr/bin/env  tells kernel where to find ($PATH) program <Rscript>
#
#  REF:  <https://stackoverflow.com/questions/21732524/how-to-know-what-script-header-to-use-and-why-it-matters>
#
#
# !/opt/R/4.3.1/bin/Rscript
# !/opt/R/${R_VERSION}/bin/Rscript
# 	TODO
# 	  - add_commit_push  clean up if statements
# 	  - more tinytest::

# 		USAGE:		./daily_git_push_Lenovo.R


library(tinytest)

# 	FIRST, all the code repos
# 	---------------------
#

#     "/home/jim/code/youtube_api",
x <- c(
  "/home/jim/bin",
  "/home/jim/code/code_publish",
  "/home/jim/code/code_racket",
  "/home/jim/code/docs",
  "/home/jim/code/jimTools",
  #   "/home/jim/code/lmlcr",
  "/home/jim/code/lua_project",
  "/home/jim/code/make_project",
  #  "/home/jim/code/plugins", # my lua plugins
  "/home/jim/code/nvim_project",
  "/home/jim/code/SHINY",
  "/home/jim/code/TAGS",
  "/home/jim/code/health_labs",
  "/home/jim/code/make_project",
  "/home/jim/code/mp3/",
  "/home/jim/dotfiles",
  "/home/jim/.config/nvim/", ## for lazyvim config
  "/home/jim/code/try_things_here",
  "/home/jim/code/quarto_experiments/",
  "/home/jim/code/zsh_project"
)

# 	---------------------
add_commit_pull <- function(dir = NULL) {
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
  # system2("git", args = c("add", "."))

  ## works
  # system2("git", args = c(paste0("commit -m ", "wip", " >>", " ~/git_log.log")))
  cat("---------------------------------\n\n")
  cat("PULLING ............................................", dir, "\n")
  system2("git", args = c("pull", "-v"))
  cat("pulled ....", dir, "\n")
  setwd(old)
  if (FALSE) {
    system2("git", args = c("status"))
    getwd()
  }
  TRUE
}

invisible(vapply(x, add_commit_pull, FUN.VALUE = FALSE))

if (FALSE) {
  vapply(x, add_commit_push, FUN.VALUE = FALSE)
  expect_false(add_commit_push(dir = ""))
  expect_error(add_commit_push(dir = NULL))
  expect_error(add_commit_push())
  expect_true(add_commit_push(dir = dir))
  expect_true(add_commit_push(dir = x[[1]]))
  print("stop")
}
