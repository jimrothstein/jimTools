#!/usr/bin/env Rscript
#
#
# PURPOSE:   find and upgrade  old R packages
# USAGE:    ./update_old_packages.R  at COMMAND LIME
# 
# PROBLEMS?   Debug in ~/code/BASE/0088
#
#
##     -   There is a problem with R trying to install in R_HOME, which only sudo has rights.
##     -   Installing to ~/R/x86_64-pc-linux-gnu-library/4.x/  works, but not sure how to specifiy
##     -   update.packages downloads and installs.   old.packages() only finds.

# ------------------------------------------------------------------
#   17-JULY-2023 
#   with version 4.3.1, directories have changed.  EXcept for WARNINGs about packages not updated because of permisisions.  This *should* work.
#
#
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
# packageVersion(pkg = old.packages(lib.loc = "R_LIBS_USER"))
{
    begin <- Sys.time()
    update.packages(
        ask = F,
        oldPkgs = old.packages(lib.loc=NULL),
#        lib.loc = .libPaths()[[1]], # ~/R/x86_64-pc-linux-gnu-library/4.x/
        lib.loc = NULL,   # should search ALL paths
        instlib = .libPaths()[[1]], 
        checkBuilt = T
    )

    end <- Sys.time()
    diff <- end - begin
    diff
    # ------------------------------------------------------------------
}

old.packages()
old.packages(lib.loc = NULL)
old.packages(lib.loc = NULL, checkBuilt=T)
######
old.packages(lib.loc = .libPaths()[[1]], checkBuilt=T)


