file <- "/home/jim/code/jimTools/tests/testthat/test_change_file_names.R"

## setup
{
  load_all()
## create tmpdir and empty tempfile
  the_files  <- create_sandbox()

  ## write a bit of content
  lapply(the_files, write_fake_file)


  the_dir  <- dirname(the_files[1])
  list.files(the_dir)
}





## now change prefixes
## careful
# rename_files(OLD, NEW)
#
#
#
load_all()
{
  path  <- the_dir
  path
#  path  <- "~/mp3_files"

  pattern  <- NULL

  ## NOTE:  work with just basenames; final step add dir
  ## all files in directory
  the_files  <- jimTools::get_files(path=path, pattern=pattern)
  the_files

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





