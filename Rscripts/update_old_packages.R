#!/usr/bin/env Rscript
#
# TODO   
#   1JUNE2023
#   -    more testing, not convinced this works with  matrix, boot, and others that refused to update easily (permisisons)
#   -   move Rscripts to dotfiles??
#
# PURPOSE:   find and upgrade  old R packages
# USAGE:    ./update_old_packages.R  at COMMAND LIME
#
##     -   There is a problem with R trying to install in R_HOME, which only sudo has rights.
##     -   Installing to ~/R/x86_64-pc-linux-gnu-library/4.x/  works, but not sure how to specifiy
##     -   update.packages downloads and installs.   old.packages() only finds.

# ,
{
    begin <- Sys.time()
    update.packages(
        lib.loc = .libPaths()[[1]]   # ~/R/x86_64-pc-linux-gnu-library/4.x/
        ask = F,
        oldPkgs = old.packages(),
        checkBuilt = T
    )

    end <- Sys.time()
    diff <- end - begin
    diff
}


# Sys.getenv("R_LIBS_USER")
# update.packages(lib.loc=.libPaths()[[1]])
# update.packages(lib.loc=Sys.getenv("R_LIBS_USER"))
