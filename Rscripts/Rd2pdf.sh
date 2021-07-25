#!/usr/bin/zsh
#
#
# ==============================
#  this is NOT an Rscript file
# ==============================
#  file <- "Rscripts/Rd2pdf.R#"
#
#  *  PURPOSE:   Documents Functions in Package
#
R CMD Rd2pdf --title="Functions for Package TAGS::" ~/code/TAGS/man/*
