file <- "/home/jim/code/jimTools/tests/testthat/test_change_file_names.R"

## setup
{
  load_all()
  the_files  <- create_fake_files()


  lapply(the_files, write_fake_file)

  # check
  #xfun::read_utf8(the_files[1])

  the_dir  <- dirname(the_files[1])
  #the_dir
  list.files(the_dir)
}





## now change prefixes
## careful
# rename_files(OLD, NEW)
#
#
#
{
  path  <- the_dir
  path
  path  <- "~/mp3_files"

  pattern  <- NULL

  ## all files in directory
  the_files  <- get_files(path=path, pattern=pattern)
  the_files

  ## save in separate env
  save_old_names(the_files)

  ## And will need OLD when rename
  OLD  <- the_files
  OLD

  pattern  <-   "^[[:digit:]]{1,6}_"

## char[] of filenames that meet the pattern
  the_files  <- list.files(path, pattern=pattern)

## remove the prefix in char[] of filenames 
  the_files  <- remove_prefix(the_files, pattern=pattern)
  the_files


  n  <- length(the_files)
  prefix  <- get_new_prefix(n=n, digits=3)

  NEW  <- get_proposed_name(the_files = the_files, prefix=prefix)
  NEW

## Last look 
  OLD

  # do it
  rename_files(path= path, from=OLD, to=NEW)
}
OLD

NEW
list.files(the_dir)
list.files(path)

### remove sandbox
remove_sandbox(path)
