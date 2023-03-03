#!/usr/bin/env Rscript
#
#
# PURPOSE:   install  old R packages
# USAGE:    ./update_old_packages.R  at COMMAND LIME
# Works!
#


# old.packages() finds packages with later version
# OR, if built with earlier version of R
#,
{
  begin  <- Sys.time()
  update.packages(
                 ask = F,
                oldPkgs = old.packages(),
                checkBuilt=T)

  end  <- Sys.time()
  diff  <- end - begin
  diff
}


# Sys.getenv("R_LIBS_USER")
# update.packages(lib.loc=.libPaths()[[1]])
# update.packages(lib.loc=Sys.getenv("R_LIBS_USER"))
