file <- "/home/jim/code/jimTools/tests/testthat/test_change_file_names.R"

## setup
{
  load_all()
  the_files  <- create_fake_files()
  the_files


  lapply(the_files, write_fake_file)

  # check
  xfun::read_utf8(the_files[1])

  the_dir  <- dirname(the_files[1])
  the_dir
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

  path  <- "~/mp3_files/"
  path  <- "./"

  pattern  <- NULL

  the_files  <- get_files(path=path, pattern=pattern)
  the_files

  save_old_names(the_files)
  OLD  <- the_files
  OLD


  pattern  <-   "^[[:digit:]]{1,2}"

  the_files  <- remove_prefix(the_files, pattern=pattern)
  the_files


  list.files(the_dir, pattern=pattern)
  list.files(the_dir)

  n  <- length(the_files)
  prefix  <- get_new_prefix(n=n, digits=5)
  prefix

  NEW  <- get_proposed_name(the_files = the_files, prefix=prefix)
  NEW

  # do it
  rename_files(path= path, from=OLD, to=NEW)
}

list.files(the_dir)
list.files(path)

