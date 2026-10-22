file <- "/home/jim/code/jimTools/tests/testthat/test_change_file_names.R"


## PURPOSE:   Trial run:  use Sandbox create files, change names, write to
## drive.
##
## setup
## create tmpdir and empty tempfile
{
  load_all()
  library(tinytest)
  the_dir <- create_sandbox()
  the_dir

  # expect empty
  # tinytest::expect_
  tinytest::expect_silent(list.files(the_dir), info = "files created")
  print(tinytest::expect_silent(list.files(the_dir)))
}

{
  ##  populate sandbox with files

  tinytest::expect_silent(the_files <- populate_sandbox(the_dir))
  the_files

  # for testing, give only basename
  the_files <- basename(the_files)
  the_files

  # save original names
  OLD <- the_files

  # we aleady have the_dir, when record the dirname when rename files
  the_dir
}


{ ## remove prefix

  the_dir <- "~/mp3_files"
  the_files <- list.files(the_dir)
  the_files



  # first do nothing
  remove_prefix(the_files, pattern = "")


  # now remove prefix
  the_pattern <- "^[[:digit:]]{1,6}_"
  the_files <- remove_prefix(the_files, pattern = the_pattern)
  the_files
}

{ ## prepare new index
  the_prefix <- create_new_prefix(the_files, digits = 4)
  the_prefix
}

{ ## attach new index
  the_files <- attach_new_prefix(the_files, prefix = the_prefix)
  the_files
}




{ ##  rename:  OLD to NEW


  OLD
  NEW <- the_files
  NEW

  jimTools::rename_file_names(path = the_dir, from = OLD, to = NEW)
  # check what is the disk
  list.files(the_dir)
}

## remove sandbox
remove_sandbox(the_dir)
