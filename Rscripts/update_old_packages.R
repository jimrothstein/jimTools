#!/usr/bin/env Rscript
#
#
# PURPOSE:   find and upgrade  old R packages
# USAGE:    ./update_old_packages.R  at COMMAND LIME
#
##     -   There is a problem with R trying to install in R_HOME, which only sudo has rights.
##     -   Installing to ~/R/x86_64-pc-linux-gnu-library/4.x/  works, but not sure how to specifiy
##     -   update.packages downloads and installs.   old.packages() only finds.

# ------------------------------------------------------------------
#   2023-06-05
#   THIS WORKS:   update.packages(oldPkgs=old.packages())
#   NOT THIS SCRIPT, confused !
#
#   This ONE LINE did work (asked if I wanted to use personal dir)
# ------------------------------------------------------------------
#   Also, can do everything through Rstuido.
# ------------------------------------------------------------------
#   But, this script did NOT work.  (permissions;  WARNING)
# ------------------------------------------------------------------
#
packageVersion(pkg = old.packages(lib.loc = "R_LIBS_USER"))
{
    begin <- Sys.time()
    update.packages(
        lib.loc = .libPaths()[[1]], # ~/R/x86_64-pc-linux-gnu-library/4.x/
        ask = F, # user can select WHICH pkgs
        oldPkgs = old.packages(),
        checkBuilt = T
    )

    end <- Sys.time()
    diff <- end - begin
    diff
    # ------------------------------------------------------------------
}


# Sys.getenv("R_LIBS_USER")
# update.packages(lib.loc=.libPaths()[[1]])
# update.packages(lib.loc=Sys.getenv("R_LIBS_USER"))
