#  PURPOSE:   test create, remove of fake files USING tinytest::
#  TINYTEST::

file <- "tt_SANDBOX.R"

##
load_all()

library(tinytest)

{ ## create tmpdir and empty tempfile
the_dir  <- create_sandbox()
the_dir
path  <- the_dir
tinytest::expect_true(dir.exists(the_dir))
}

{ ## Add a file to sandbox
the_files = c("_NA_( 123")
add_files_sandbox(tempdir = the_dir, the_files=the_files)

## Check files, method 1
dir(the_dir)
}

{ ## check files in sandbox, method 2
  pattern  <- ""
  the_files  <- jimTools::read_file_names(path=the_dir, pattern=pattern)
  the_files

}

{ ## populate sandbox with random files
  #  if the_files = NULL, will populate with its own files
  populate_sandbox(tempdir = the_dir, the_files = NULL) 
  the_files  <- jimTools::read_file_names(path=the_dir, pattern=pattern)
  the_files

}


{ ## change prefix

}

{  ## clean up sandbox
remove_sandbox(the_dir)
dir(the_dir)
list.files(the_dir)
}

# =========   rename sandbox file names =======================


{ ## create tmpdir and empty tempfile
the_dir  <- create_sandbox()
the_dir
path  <- the_dir
}



{ ## populate sandbox with random files
  #  if the_files = NULL, will populate with its own files
  populate_sandbox(tempdir = the_dir, the_files = NULL) 
  pattern = NULL
  the_files  <- jimTools::read_file_names(path=the_dir, pattern=pattern)
  the_files
}

{ ## 1st show files
  pattern = "^[[:digit:]]{1,4}"
  replace  <- NULL 
  the_files  <- read_file_names(path = the_dir, pattern = pattern)
  the_files
}
{ ## remove prefix
  pattern = "^[[:digit:]]{1,4}"
  replace  <- "" 
  remove_prefix(the_files, pattern=pattern)
}

{ ## create new prefix
  x  <- create_new_prefix(the_files)
  x
}

{ ## ttdo   version .2
library(ttdo)
library(tinytest)
tinytest::using(ttdo)  ## use tinytest extension mechanism
     tt <- tinytest::expect_equal(1+1, 2)
tt
     if (isTRUE(tt)){
       print("w00p w00p!")
     } else {
       print("Oh no!")
     }

}
# LEGACY
lapply(fake_files, write_fake_file)

# check
xfun::read_utf8(fake_files[1])

fake_dir  <- dirname(fake_files[1])
fake_dir
list.files(fake_dir)

# ================


```



#### Change prefix for fake files
jimTools::get_files

TODO
See:  xfun:: code
#### create temp file, write content to it, modify it, read result
```{r}
library(xfun)
f = tempfile()
f

xfun::write_utf8("Hello World", f)


## modify content in a file
# x is content of file f; 
#
#
modify_file_content  <- function(file, from , to){
xfun::process_file(file, function(x) 
                   sub("World", "woRld", x))
}
xfun::read_utf8(f)  # see if it has been updated

file.remove(f)
```




## create tmpdir
{
  library(jimTools) 
  load_all()
  the_files  <- create_sandbox()
  the_dir  <- dirname(the_files[1])
}

## create some files
{ 
  f  <- c('_NA_-myname is ( 2004')
  the_dir  <- dirname(the_files[1])
  file.create(paste0(the_dir,"/",f))
}


## test files? (fix)
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


