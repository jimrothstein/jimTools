#'  @title create_fake_files
#'  
#'  @description  create fake dir,  numbered fake file names.
#'
#'  @return character vector of file names.
#'  @export
create_fake_files  <- function() {

  pattern=paste0(1:5,"_")
  pattern

  tempdir = tempdir()
  tempdir

  fileext = ".mp3"

  tempfile(pattern , tempdir, fileext) 
}



#' @title write_fake_file
#' @description Adds minimal content stub to fake file and writes to disk.
#' @param f the fake file that wil be written to disk.
#' @export
write_fake_file  <- function(f) {
  xfun::write_utf8(paste0("my name is ", as.character(f)), f)
}


