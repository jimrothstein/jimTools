#!/usr/bin/env Rscript
# 	file <- "daily_git_push_Lenovo.R"
# 	TODO
# 	  - add_commit_push  clean up if statements
# 	  - more tinytest::

# 		USAGE:		./daily_git_push_Lenovo.R


library(tinytest)

# 	FIRST, all the code repos
# 	---------------------
#

#     "/home/jim/code/youtube_api",
# # "/home/jim/code/code_racket",
#     "/home/jim/code/mp3/",
x <- c(
    "/home/jim/bin",
    "/home/jim/code/jimTools",
    "/home/jim/code/zsh_project",
    "/home/jim/code/lua_project",
    "/home/jim/code/code_publish",
    "/home/jim/code/docs",
    "/home/jim/code/try_things_here",
    "/home/jim/code/nvim_project",
    "/home/jim/code/SHINY",
    "/home/jim/code/health_labs",
    "/home/jim/code/mp3/",
    "/home/jim/dotfiles",
    "/home/jim/.config/nvim/", ## for lazyvim config
    "/home/jim/code/quarto_experiments/"
)

# 	---------------------
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
    system2("git", args = c(paste0("commit -m ", "wip", " >>", " git_log.log")))
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

invisible(vapply(x, add_commit_push, FUN.VALUE = FALSE))

if (FALSE) {
    vapply(x, add_commit_push, FUN.VALUE = FALSE)
    expect_false(add_commit_push(dir = ""))
    expect_error(add_commit_push(dir = NULL))
    expect_error(add_commit_push())
    expect_true(add_commit_push(dir = dir))
    expect_true(add_commit_push(dir = x[[1]]))
    print("stop")
}
