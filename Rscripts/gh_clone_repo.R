#!/usr/bin/env Rscript


#     This is .R script
#
#
# PURPOSE:   clone repo
# USAGE:    ./gh_clone_repo.R   # at command line
# Works!
#

## gh repo clone bbarker505/tidyverse-Aggregate-Mar2023
#
{
  begin <- Sys.time()
  pkg <- "docs"
  pkg <- "code_publish"
  pkg <- "SHINY"
  pkg <- "try_things_here"
  pkg <- "lua_project"

  user <- "jimrothstein/"

  system2("gh",
    args = c(
      "repo clone",
      paste0(user, pkg),
      paste0("~/code/", pkg)
    )
  )
  end <- Sys.time()
  diff <- end - begin
  diff
}
