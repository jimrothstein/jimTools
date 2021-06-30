#!/bin/usr/zsh
#
#
# ==============================
#  this is NOT an Rscript file
# ==============================
#
#  This way to MANUALLY write an expression for R, and run it, all from zsh CLI.
#  *  R seems to want --vanilla or --save etc.
#  *  Here is sh file, but do the same MANUALLY.
#
R --vanilla << EOF
x <- 5
print(x)
EOF
