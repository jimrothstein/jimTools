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

#' @title populate_sandbox
#' @export
#'
populate_sandbox  <- function(tempdir = tempdir, the_files = NULL) {
  ## check, dir exist?
  is_valid_path("/x")

  ##
  ## if the_files = NULL; then create tmp files
  ## Otherwise, use the_files user provided.
  if (is.null(the_files)) {
  ## TODO  allow user to choose pattern | ext
  ## create fake files for sandbox
    pattern=paste0(1:5,"_")
    pattern

    fileext = ".mp3"

    the_files  <- tempfile(pattern ,tmpdir = tempdir, fileext) 
  } 
  file.create(the_files)
}
   
  

#' is_valid_path
#' @description  Logical  Checks if path exists.  HELPER
#' @details  Note `.` prefix.  This or `keyword  internal` means not exported,
#' internal only AND will not be included in documentation.
#' @param tempdir Directory provided by user.
  .is_valid_path  <- function(tempdir) { 
    is.character(tempdir) && 
      length(tempdir) !=0 && 
      nchar(tempdir) !=0 &&
      file.exists(tempdir)
  }

#' @title adds content to a sandbox file
#' @description Adds minimal content stub to sandbox file and writes to disk.
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
