
#' save_old_names
#' @description
#'  safely save copy of original files in separate environmentt
#' @param 
#'   the_files Unchanged character vector of file names as read from
#' drive.
#' @export
save_old_names  <- function(the_files = NULL) {
  e  <<- new.env()
  e$the_files  <- the_files
}



#' replace_pattern
#'
#' @description
#'   Given a character vector, find and replace all matching patterns.
#' @details
#'    This is stub.   It will replace numerous files (below) that remove
#'    prefix, generate new prefix and attach the new prefix.
#' @param the_files  character vector
#' @param pattern  Regex pattern to match
#' @param replace  Text to replace matched pattern.
#' @export
#'  
  replace_pattern  <- function(the_files, pattern, replace) {
  }
    
#'  remove_prefix
#'
#' @description Remove any existing prefix according to pattern
#'  May need multiple passes
#' @param the_files character vector of all possible file names to be changed.
#' @param pattern Select the files to change.
#' @export
remove_prefix  <- function(the_files = NULL, pattern = pattern) {
  sub(pattern=pattern, replace="", x=the_files)
}


#' create_new_prefix
#' @description propose new prefix, min of digits
#' @param the_files character_vector  
#' @param digits  sprintf will nice format prefix, padding zeroes to front if
#'  necessary.
#' @export
  create_new_prefix  <- function(the_files=NULL, digits=4) {
    n  <- length(the_files)
    format  <- paste0("%0",digits,"i_")
    the_prefixs  <- sprintf(format, 1:n)
  }


#' attach_new_prefix
#' @description attach proposed prefix.
#' @param the_files character vector of file names that will receive new prefix.
#' @param prefix Proposed new prefix.
#' @export
attach_new_prefix  <- function(the_files = NULL, prefix=NULL) {
  paste0(prefix, the_files)
}



