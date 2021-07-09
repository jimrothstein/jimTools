#' @title reate_sandbox
#' @description  create a sandbox; fake dir,  numbered fake file names.
#' @return character vector of full path fake file names.
#' @export
create_sandbox <- function() {

  ## check if already exists
  #
  ## if new sandbox
    tempdir = tempdir()
    tempdir
    if (!dir.exists(tempdir)) dir.create(tempdir)

  ## TODO  allow user to choose pattern | ext
  ## create fake files for sandbox
    pattern=paste0(1:5,"_")
    pattern

    fileext = ".mp3"

    tempfile(pattern , tempdir, fileext) 

  ## TODO
  ## use touch to put fake files on disk
}



#' @title adds content to fake file
#' @description Adds minimal content stub to fake file and writes to disk.
#' @param file the fake file that wil be written to disk.
#' @details  if directory does not exist = errror;  
#' @export
write_fake_file  <- function(file) {
  xfun::write_utf8(paste0("my name is ", as.character(file)), file)
}


#' @title title remove_sandbox(the_dir)
#' @description Removes sandbox, all tmp directories and all files.
#' @param path Path (directory) of files to be changed.
#' @export
remove_sandbox  <- function(the_dir) {
  ## need check that this is tmp directory.
  ## 0 = success
    y  <- unlink(the_dir, recursive=T, force=T)
    if  (y == 0) print("Temp files and temp dir removed.")
}
