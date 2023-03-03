#'	@export
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


#'	@export
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
   


#'	@export
  .is_valid_path  <- function(the_dir=NULL) { 
    # not working with vector, component-by-compoent
    is.character(the_dir) && 
      length(the_dir) !=0 && 
      nchar(the_dir) !=0 &&
      dir.exists(the_dir)
  }

#'	@export
    .is_sandbox  <- function(x =NULL) {
    ## TODO:   test for more than existence?
        stopifnot(!is.null(x))
        dir.exists(the_dir)

  ##parent.env(current_env())$the_dir)
}



#'	@export
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



