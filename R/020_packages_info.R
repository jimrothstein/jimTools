## PURPOSE:    Collect code related to package information.

## ~/code/try_things_here/rmd/

# INCLUDE:
#   *  00001_explore ...
#   *  085_system_tools  (related to pkgs)
#
# SEE ALSO:
#   *  Rscripts for working code to update packages.
#
#
# BASE TOOLS used here:
#   *  tools::dependsOnPkgs
#   *  utils::installed.packages
#

{ ## setup

  load_all()
}

{ ## ALL this from JennyBC, spartan (prune ...)

  # 01-explore-libraries....R
  # see /rstd.io/forgot  (sends to github page)

  #' Which libraries does R search for packages?

  library(tidyverse)

  ## how many installed packages?
  t <- as_tibble(installed.packages())
  t
  s <- t %>%
    select(Package, LibPath, Version, Priority) %>%
    mutate(lib = if_else(stringr::str_starts(
      LibPath,
      "/home/jim/R/x86"
    ),
    "jim Lib",
    "other Lib"
    )) %>%
    select(-LibPath)
  s
  print(s, n = 400)

  # tabulate (count) pkgs for each R version
  table(t$Built)

  #' Exploring the packages

  ##   * tabulate by LibPath, Priority, or both

  # 2 library paths!   mine and /usr/lib/R/library
  table(t$LibPath)

  # so why do I have 351 packages!
  table(t$Priority) # base=14  recommended=19


  ##   * what proportion need compilation?
  ## no=191 yes=151
  table(t$NeedsCompilation)



  #' Reflections

  ##   * how does the result of .libPaths() relate to the result of .Library?


  #' Going further

  ## if you have time to do more ...

  ## is every package in .Library either base or recommended?
  ## study package naming style (all lower case, contains '.', etc
  ## use `fields` argument to installed.packages() to get more info and use it!
  head(installed.packages(fields = c("Package", "Depends"), n = 15))
  ## END of JennyBC
}
# =================End JennyBC =================================
