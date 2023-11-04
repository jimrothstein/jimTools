#!/usr/bin/env Rscript



# PURPOSE:   find and upgrade  R Packages
# Rscript version of 202_, which should be deleted when this works
# USAGE:  ./202_
#
# TODO: (2023-11-03)
#   -   Confirm working Rscript
#
#
# -------------------------------------
#     200_   orginal R update, simplified
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
cat("begin")
library(data.table)
dt <- as.data.table(installed.packages())
head(dt)[1:3, 1:3]
dim(dt) # [1] 264  16




# REF: https://medium.com/analytics-vidhya/r-data-table-joins-48f00b46ce29
# Notation:
#   on=.(x,y)
#   on=.(x < 5, y> y)  non-equi join
#   on=.(...), z := ...   adds column (in reference, no copy)

### candidates
cand <- as.data.table(old.packages(checkBuilt = T))
dim(cand)

### Any candidate in lib1, then update these.
cat("begin lib1")
lib2 <- .libPaths()[[2]]
lib1 <- .libPaths()[[1]]
lib1
lib2
cand[LibPath == .libPaths()[[1]], ]
update.packages(
    libinst = lib1,
    ask = FALSE,
    oldPkgs = as.matrix(cand[LibPath == lib1, ]),
)


### Check lib2 for valid candidates:
# if cand is in lib1, not need to check if 2 (SEE TOY)
# but if cand in 2, only need to check if was every installed in 1
cand
cand[LibPath == lib2, ][!dt[LibPath == lib1, ], on = .(Package)]
x <- cand[LibPath == lib2, ][!dt[LibPath == lib1, ], on = .(Package)]
x
update.packages(
    instlib = lib1,
    ask = FALSE,
    oldPkgs = as.matrix(x)
)

cat("done")
#   LEGACY
# ------------------------------------------------------------------
#   17-JULY-2023
#   with version 4.3.1, directories have changed.  EXcept for WARNINGs about packages no# t updated because of permisisions.  This *should* work.
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
# {
#     begin <- Sys.time()
#     update.packages(
#         ask = F,
#         oldPkgs = old.packages(lib.loc = NULL),
# lib.loc = .libPaths()[[1]], # ~/R/x86_64-pc-linux-gnu-library/4.x/
#         lib.loc = NULL, # should search ALL paths
#         instlib = .libPaths()[[1]],
#         checkBuilt = T
#     )
#
#     end <- Sys.time()
#     diff <- end - begin
#     diff
#------------------------------------------------------------------
# }
#
# old.packages()
# old.packages(lib.loc = NULL)
# old.packages(lib.loc = NULL, checkBuilt = T)

# old.packages(lib.loc = .libPaths()[[1]], checkBuilt = T)
