#!/usr/bin/zsh
#
#
# ==============================
#  this is NOT an Rscript file
# ==============================
#  file <- "Rscripts/Rd2pdf.R#"
#
#  *  PURPOSE:   Documents Functions in R Package
#
#  *  USAGE:  cd to man/ directory
#             ./code/jimTools/Rscripts/Rd2pdf.sh --title="" <files>
#
#  *  HELP:   R CMD Rd2pdf -h
#
#
#   Does prior Rd2pdf file exist?
has_old()   {
    test -e "Rd2.pdf"
}

# default:  NOT sure if wants files or dir. 
the_files='~/code/TAGS/man/'

if has_old
then
    echo "Please remove old .pdf file"
    exit 1
fi


#
# R CMD Rd2pdf --title="Functions for Package TAGS::" ~/git/TAGS/man/* 
R CMD Rd2pdf --title="Functions for Package TAGS::" ${the_files} 
