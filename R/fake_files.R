#'  create_fake_files
#'  
#'  @description  create fake dir and fake file names.
#'
#'  @export
create_fake_files  <- function() {

  pattern=paste0(1:5,"_")
  pattern

  tempdir = tempdir()
  tempdir

  fileext = ".mp3"

  tempfile(pattern , tempdir, fileext) 
}



#' write_fake_file
#'
#' @export
#' @description write fake files to disk
write_fake_file  <- function(f) {
  xfun::write_utf8(paste0("my name is ", as.character(f)), f)
}


