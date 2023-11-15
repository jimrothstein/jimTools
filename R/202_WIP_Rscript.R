#!/usr/bin/env Rscript

# PURPOSE:   find and upgrade  R Packages
# Rscript version of 202_, which should be deleted when this works
# USAGE:  ./202_ (run at CLI, as Rscript)
#
# TODO:
# 2023-11-13
#   -   continue to verify workinga
#   -   now logging
# 2023-11-06
#   -   add quiet=   to updates
#   -   add logging? log4j
# TODO: (2023-11-03)
#   -   Confirm working Rscript
#
# -------------------------------------
#   NOTES:
# 200_   orginal R update, simplified
# 201_   misc commands to explore packages (clean up!)
# 202_   fancier R update (working, need to get to tip-top shape)
# 202_WIP   ... this Rscript
# -------------------------------------
#     TODO:
# -               prepare for Rscript
# -               add log4j code (for R)?
# https://github.com/johnmyleswhite/log4r
# ** DO NOT DELETE **
#
# PURPOSE:   Update R  packages, fancy way.   Candidate for SHINY as GUI?
#
# Outline:
#
#     -   Check R version, sessionInfo
#     -   Check current R library locations,
#     -   Review packages each library
#     -   Identify packages in more than ONE directory
#     -   (interactive only) update `old` packages (compiled with older R versions)
#     -   (interactive only) update any remaining packages
#     -   list Env variables
#
#

### currently installed pkgs , 266 (with dup)
library(log4r)
library(data.table)

logger <- logger()
info(logger, "Start ... ")


### candidates
info(logger, "Finding ... candidates")
dt <- as.data.table(installed.packages())
cand <- as.data.table(old.packages(checkBuilt = T))
### Any candidate in lib1, then update these.
lib2 <- .libPaths()[[2]]
lib1 <- .libPaths()[[1]]
x <- cand[LibPath == .libPaths()[[1]], ]
if (nrow(x) == 0) {
    info(logger, "Lib1 has no candidates")
} else {
    info(logger, "Updating ... lib1 candidates")
    update.packages(
        libinst = lib1,
        ask = FALSE,
        oldPkgs = as.matrix(cand[LibPath == lib1, ]),
        quiet = TRUE
    )
}
info(logger, "Done with lib1  ... ")

### Check lib2 for valid candidates:
# if cand is in lib1, not need to check if 2 (SEE TOY)
# but if cand in 2, only need to check if was every installed in 1
x <- cand[LibPath == lib2, ][!dt[LibPath == lib1, ], on = .(Package)]

if (nrow(x) == 0) {
    info(logger, "Lib2 has no update candidates ... ... ")
} else {
    info(logger, "Updating Lib2 candidates ... ... ")
    update.packages(
        instlib = lib1,
        ask = FALSE,
        oldPkgs = as.matrix(x),
        quiet = TRUE
    )
}
info(logger, "Lib1 and Lib2 are done ...")
