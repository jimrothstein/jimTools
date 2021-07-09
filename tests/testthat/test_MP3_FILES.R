file <- "tests/testthat/test_MP3_FILES.R"



## careful

load_all()
## 
  the_dir  <- "~/mp3_files"
  path  <- the_dir
  pattern = ""

  the_files  <- jimTools::get_files(path=path, pattern=pattern)
  the_files

## STOP
  ##
  ##

