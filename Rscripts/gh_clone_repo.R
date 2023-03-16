#!/usr/bin/env Rscript


#     This is .R script
#
#
# PURPOSE:   clone repo
# USAGE:    ./gh_clone_repo.R   # at command line
# Works!
#


#
{
  begin <- Sys.time()
  pkg <- "lua_project"

  system2("gh",
    args = c(
      "repo clone",
      paste0("jimrothstein/", pkg),
      paste0("~/code/", pkg)
    )
  )
  end <- Sys.time()
  diff <- end - begin
  diff
}
