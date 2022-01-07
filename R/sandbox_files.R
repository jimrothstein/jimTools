#' @title create_sandbox
#' @description  create a sandbox; fake dir.  
#' @return character[1] the tmp dir created.
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
populate_sandbox  <- function(the_dir = NULL, the_files = NULL) {
  ## check, dir exist?
  stopifnot(!is.null(the_dir))
  stopifnot(!is.null(the_files))
  if (! .is_valid_path(the_dir)) stop("error: the_dir is not valid ", class="directory")

  ##
  ## if the_files = NULL; then create tmp files
  ## TO DO:  now: use what user provider
##   FUTURE:   if user did not provide files, create fake ones.
  if (is.null(the_files)) {

  stop("error:  the_files are NULL",
        class="files")

  ## TODO  allow user to choose pattern | ext
  ## create fake files for sandbox
    pattern=paste0(1:5,"_")
    pattern

    fileext = ".mp3"

    the_files  <- tempfile(pattern ,tmpdir = the_dir, fileext) 
  } 
  file.create(paste0(the_dir, "/", the_files))
}
   


#' .is_valid_path
#' @description  Logical  Checks if path exists.  HELPER
#' @details  Note `.` prefix.  This or `keyword  internal` means not exported,
#' internal only AND will not be included in documentation.
#' @param the_dir Directory provided by user.
#'
  .is_valid_path  <- function(the_dir=NULL) { 
    # not working with vector, component-by-compoent
    is.character(the_dir) && 
      length(the_dir) !=0 && 
      nchar(the_dir) !=0 &&
      dir.exists(the_dir)
  }
#'  .is_sandbox
#'  @description
#'      Logical.  True if \code{the_dir} is sandbox.  Otherwise false.
#'  @param:
#'      the_dir.  String. Directory to check
#'  @export
    .is_sandbox  <- function(x =NULL) {
    ## TODO:   test for more than existence?
        stopifnot(!is.null(x))
        dir.exists(the_dir)

  ##parent.env(current_env())$the_dir)
}



#' @title title remove_sandbox(the_dir)
#' @description Removes (1) sandbox, all tmp directories and all files and (2)
  #' removes the_dir from enclosing environment (to be sure no accidents)

#' @param the_dir directory of files to be changed.
#' @export
remove_sandbox  <- function(the_dir = NULL) {
  ## need check that this is tmp directory.
  ## 0 = success
    y  <- unlink(the_dir, recursive=T, force=T)
    #rm(the_dir, envir=parent.frame(n=2))

    if  (y == 0) 
        print("Temp files and temp dir removed.")
}


    log_sandbox   <- function() {
    ## place holder
        ## 
         }

## LEGACY


#' fake function
#' @description Example of inherit.
#' @inheritParams create_sandbox
fake  <- function(){}

#' @title adds content to a sandbox file
#' @description Adds minimal content stub to sandbox file and writes to disk.
#' @param file the fake file that wil be written to disk.
#' @details  if directory does not exist = errror;  
#' @export
write_fake_file  <- function(file) {
  xfun::write_utf8(paste0("my name is ", as.character(file)), file)
}
