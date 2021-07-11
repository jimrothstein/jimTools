
###  Change file names, add/remove prefix, use `base R`
{
Main idea is this:
  * Set dir, 
  * Choose pattern to match files
  * old = original file names
  * new = proposed file names, with changes (using gsub)
  * prepend the dir
  * file.rename(old, new)

#### base:: comands
file.rename()
file.create()
basename()
dirname()
list.dirs()
dir()
}


{ ## working, sub
  # sub(x = "_NA", pattern = "_NA", replacement = "NA")
# list of strings, pattern, replacement when matches
l  <- list(
           c("_NA_jim", "^_NA", "_"),
           c("NA_jim", "NA", ""),
           c("_.ogg", "_.ogg$", ".ogg"),
           c("jim_.ogg", "_.ogg$", ".ogg"),
           c("___","__+", "_"   ),  # + = 1 or more of SECOND _
           c("_____","__+", "_"   )  # + = 1 or more of SECOND _
           )

f  <- function(e) {
sub(x = e[[1]],
    pattern = e[[2]],
    replacement = e[[3]])

}

lapply(l, f)
}

{ ## VERSION .2   DT
##
library(rdatatable)
  create_dt  <- function () {
    DT = data.table(
      before = "_NA",
      regex = "_NA",
      replace = "NA"
    )
    return(DT)
}

dt  <- create_dt()
dt
}

{ ## try sub - nope NOT vectorized
  sub(x = "_NA", pattern = "_NA", replacement = "NA")
x  <- c("_NA", "NA")
pattern  <- c( "^_NA", "^NA" )
replacement <- c("_", "_")
sub(x = x,
    pattern = pattern,
    replacement = replacement)



}






## available patterns
{
#  Choose pattern, 
list.files("rmd", full.names= T, pattern="*.Rmd")
list.files("./rmd", pattern="*.Rmd")
list.files("./rmd", full.names = TRUE ,pattern="*.Rmd")
pat  <-  "^[:digit:]{4,6}"
pat  <-  `^[[:digit:]]{4,6}`
pattern=  "^[0-9]*"
pat  <-  `'^_'`
pat  <- `'^_00056'`
pat  <- "^_[[:digit:]]{5}"
pat  <-  "^_[[:digit:]]{5,6}"
pat  <-  "^[[:digit:]]{4,6}"
pat  <-  "^_0[[:digit:]]{4,6}"
pat  <- "^_NA"
pat  <- "^NA"
pat  <-  "^NA[[:digit:]]{4,6}"
pat  <- "_NA_"
pat  <- "^__"
pat  <- "__+"    # + = 1 or more of SECOND _
pat  <- "\\s+"    # 1 or more
pat  <- "_._"   # any character between two '_'
pat  <- "_.ogg"
pat  <- "_\\."  # _ followed by literal .
pat  <- "'"
pat  <- "-"
pat  <- ",_"
#  match 06_Apr_2018
pat  <-  "[[:digit:]]{2}_[[:alpha:]]{3}_[[:digit:]]{4}"
pat  <-  "([[:digit:]]{2})_([[:alpha:]]{3})_([[:digit:]]{4})"
# match 2018_04_06
pat  <-  "([[:digit:]]{4})_([[:digit:]]{2})_([[:digit:]]{2})"
}


   
## sprintf has some nice features!
{
sprintf("hello %s", "jim")

sprintf("hello %s", 23)

sprintf("hello %04s", 23)         # min of 4
sprintf("hello %04f", 23)         # 23.000000

sprintf("hello %04i", 23)         # int, min of 4 digits
}


