file <- "/home/jim/code/jimTools/tests/testthat/test_change_file_names.R"

## setup
## create tmpdir and empty tempfile
##
{
  load_all()
  the_files  <- create_sandbox()

  ## write a bit of content
  lapply(the_files, write_fake_file)


  the_dir  <- dirname(the_files[1])
  list.files(the_dir)
}



## now change prefixes
## careful
# rename_files(OLD, NEW)
## test files in sandbox ONLY
  ## NOTE:  work with just basenames; final step add dir
  ## all files in directory

## 

  path  <- the_dir
  pattern = ""

  the_files  <- jimTools::get_files(path=path, pattern=pattern)
  the_files
{
  ##
  ## save in separate env
  save_old_names(the_files)

  ## And will need OLD when rename
  OLD  <- the_files

  pattern  <-   "^[[:digit:]]{1,6}_"
  pattern  <- ""

## char[] of filenames that meet the pattern and will changed
  x.0  <- list.files(path, pattern=pattern)
  x.0

## check
   length(OLD)  == length(x.0)

## remove the prefix in char[] of filenames 
  x.1  <- remove_prefix(x.0, pattern=pattern)
  x.1
  length(x.0) == length(x.1)


# =======================
## skip TO not renumber
# =======================
  n  <- length(the_files.old)
  n
  prefix  <- get_new_prefix(n=n, digits=4)
  prefix


  prefix  <- ""
  ## prefix + name
  x.2 <- get_proposed_name(the_files = x.1,  prefix=prefix)
  x.2
  length(x.2) == length(x.0)

## remove leading NA
  x.3  <- remove_prefix(x.2, pattern = "^NA")
  x.3             
  length(x.3) == length(x.0)
  
## remove leading '_' 
  x.4  <- remove_prefix(x.3, pattern = "^_")
  x.4             
  length(x.4) == length(x.0)
 


## WHEN DONE
## Last look 
  ##
  NEW  <- x.4 
  OLD
  NEW

  
  # do it
  rename_files(path= path, from=OLD, to=NEW)
}
path
OLD

NEW
list.files(path)

### remove sandbox
remove_sandbox(path)


#### patterns
```{r patterns}
#  Choose pattern, 
list.files("rmd", full.names= T, pattern="*.Rmd")
list.files("./rmd", pattern="*.Rmd")
list.files("./rmd", full.names = TRUE ,pattern="*.Rmd")
pattern  <-  `^[[:digit:]]{4,6}`
patterntern=  "^[0-9]*"
pattern  <-  `'^_'`
pattern  <- `'^_00056'`
pattern  <- "^_[[:digit:]]{5}"
pattern  <-  "^_[[:digit:]]{5,6}"
pattern  <-  "^[[:digit:]]{4,6}"
pattern  <-  "^_0[[:digit:]]{4,6}"
pattern  <- "^_NA"
pattern  <- "^NA"
pattern  <-  "^NA[[:digit:]]{4,6}"
pattern  <- "_NA_"
pattern  <- "^__"
pattern  <- "__+"    # + = 1 or more of SECOND _
pattern  <- "\\s+"    # 1 or more
pattern  <- "_._"   # any character between two '_'
pattern  <- "_.ogg"
pattern  <- "_\\."  # _ followed by literal .
pattern  <- "'"
pattern  <- "-"
pattern  <- ",_"
#  match 06_Apr_2018
pattern  <-  "[[:digit:]]{2}_[[:alpha:]]{3}_[[:digit:]]{4}"
pattern  <-  "([[:digit:]]{2})_([[:alpha:]]{3})_([[:digit:]]{4})"
# match 2018_04_06
pattern  <-  "([[:digit:]]{4})_([[:digit:]]{2})_([[:digit:]]{2})"
```



