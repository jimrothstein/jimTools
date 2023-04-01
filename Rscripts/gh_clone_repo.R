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
  pkg <- "lua_project"
  pkg <- "docs"
  pkg <- "tidyverse-Aggregate-Mar2023"
  pkg <- "code_publish"
  pkg <- "SHINY"
  pkg <- "hello-quarto"
  pkg <- "try_things_here"


  user <- "bbarker505/"
  user <- "mine-cetinkaya-rundel/"
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
