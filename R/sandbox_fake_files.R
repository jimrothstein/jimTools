#' @title reate_sandbox
#' @description  create a sandbox; fake dir,  numbered fake file names.
#' @return character vector of full path fake file names.
#' @export
create_sandbox <- function() {

  ## check if already exists
  #
  ## tempdir() only returns a name 
    tempdir = tempdir()
    tempdir

    ## create the directory if one does not exist
    if (!dir.exists(tempdir)) dir.create(tempdir)

    ## return tempdir name
    return(tempdir)
}

#' @title add_files_sandbox
#'
#' @export
#'
add_files_sandbox  <- function(tempdir = tempdir, the_files = NULL) {
  ## check, dir exist?
  ##
  ##
  ## if the_files = NULL; then create tmp files
  ## Otherwise, use the_files user provided.
  if (is.null(the_files)) {
  ## TODO  allow user to choose pattern | ext
  ## create fake files for sandbox
    pattern=paste0(1:5,"_")
    pattern

    fileext = ".mp3"

    the_files  <- tempfile(pattern , tempdir, fileext) 
  } 
  file.create(paste0(tempdir, "/", the_files))
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
