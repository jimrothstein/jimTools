# This is R file,  not Rscript

# daily_git_push.R
#
# PURPOSE:  update all github repos (SEE list: all_repos.R)
# USAGE:

# FIRST, get all repos managed by git
# 	---------------------
get_dirs <- function(base_dir) {
  dirs <- list.dirs(base_dir, full.names = TRUE, recursive = FALSE)
  git_dirs <- dirs[dir.exists(file.path(dirs, ".git"))]

  # DIR, to exclude
  git_dirs = git_dirs[git_dirs != "/home/jim/code/throwaway"]
}

system2("rm", args = c("~/git_log.log"))

system2(
  "echo",
  args = c(
    paste0("Start: today = ", as.character(Sys.Date()), "----------"),
    " >> ",
    "~/git_log.log"
  )
)

# one dir at a time
add_commit_push <- function(dir = NULL) {
  # stop if evaluates to F
  stopifnot(
    !is.na(dir) && dir.exists(dir)
  )
  old <- setwd(dir)
  message(paste("Processing:", dir))
  system2("echo", args = c(paste0("Processing: ", dir, "--------", " >>", " ~/git_log.log")))

  system2("git", args = c("add", "."))
  system2("git", args = c(paste0("commit -m ", "wip", " >>", " ~/git_log.log")))

  #  ====
  #    ❌ ERROR: Push to feature-branch failed!"


  tryCatch(
    {
      system2("git", args = c("push", "--quiet"))
      return(TRUE)
    },
    error = function(e) {
      cat("Error in git push for directory:", dir, "\n")
      cat("Error message:", e$message, "\n", "-----------------------------\n")
      return(FALSE)
    }
  )
}


git_dirs = get_dirs("/home/jim/code")

result = vapply(git_dirs, add_commit_push, FUN.VALUE = TRUE)

if (FALSE) {
  vapply(x, add_commit_push, FUN.VALUE = FALSE)
  expect_false(add_commit_push(dir = ""))
  expect_error(add_commit_push(dir = NULL))
  expect_error(add_commit_push())
  expect_true(add_commit_push(dir = dir))
  expect_true(add_commit_push(dir = x[[1]]))
}
print("stop")
