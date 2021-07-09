
###  Change file names, add/remove prefix, use `base R`
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

```{r setup, include=FALSE		}
knitr::opts_chunk$set(echo = TRUE,  
											comment="      ##",  
											error=TRUE, 
											collapse=TRUE) 
library(jimTools) 
```
## create tmpdir
{
  load_all()
## create tmpdir and empty tempfile
  the_files  <- create_sandbox()


  the_dir  <- dirname(the_files[1])

}

## create some files
{ 
  f  <- c('_NA_-myname is ( 2004')
  the_dir  <- dirname(the_files[1])
  file.create(paste0(the_dir,"/",f))
}

{

  path  <- the_dir
  pattern  <- NULL
  the_files  <- jimTools::get_files(path=path, pattern=pattern)
  the_files

## test patterns
{
  path  <- the_dir
  pattern  <- c("^_NA",
                "_NA_")
  x.0  <- list.files(path, pattern=pattern)
  x.0

screen  <- function(pattern = pattern) {
    list.files(path = path, pattern = pattern)
  }
screen(pattern = pattern)

## each screen uses same path, but with different path
lapply(pattern, screen)

}

#### patterns
```{r patterns}
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
```


  a   
#### sprintf has some nice features!
```{r sprint, include = F}
sprintf("hello %s", "jim")

sprintf("hello %s", 23)

sprintf("hello %04s", 23)         # min of 4
sprintf("hello %04f", 23)         # 23.000000

sprintf("hello %04i", 23)         # int, min of 4 digits

```
{ ##  create DT
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

{ ## try sub
  sub(x = "_NA", pattern = "_NA", replacement = "NA")
}



