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
  if (!dir.exists(tempdir)) dir.create(tempdir)
  

  fileext = ".mp3"

  tempfile(pattern , tempdir, fileext) 
}



#' @title write_fake_file
#' @description Adds minimal content stub to fake file and writes to disk.
#' @param f the fake file that wil be written to disk.
#' @details  if directory does not exist = errror;  
#' @export
write_fake_file  <- function(f) {
  xfun::write_utf8(paste0("my name is ", as.character(f)), f)
}


#'  remove_sandbox(the_dir)
#' @description Removes sandbox, all tmp directories and all files.
#' @param path Path (directory) of files to be changed.
#' 
#' @export
remove_sandbox  <- function(the_dir) {
  ## need check that this is tmp directory.
  ## 0 = success
    y  <- unlink(the_dir, recursive=T, force=T)
    y

    if  (y == 0) print("Temp files and temp dir removed.")
}
