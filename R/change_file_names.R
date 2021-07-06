#'   @title get_files
#'   @param path Path to directory.
#'   @param pattern Use pattern (regex) to return subset of files.  If pattern is NULL, all files
#'  in path will be returned.
#' @export
get_files  <- function(path = NULL, pattern = NULL) {
  ## tests
  list.files(path, pattern)
}


#'  @title save_old_names
#'  @description
#'  safely save copy of original files in separate environmentt
#' @export
save_old_names  <- function(the_files = NULL) {
  e  <<- new.env()
  e$the_files  <- the_files
}


#'  remove_prefix
#'  @description Remove any existing prefix according to pattern
#'  May need multiple passes
#'  @param the_files character vector of all possible file names to be changed.
#'  @param pattern Select the files to change.
#' @export
remove_prefix  <- function(the_files = NULL, pattern = pattern) {
  sub(pattern=pattern, replace="", x=the_files)
}


#'  get_new_prefix
#'  @description propose new prefix, min of digits
#'  @param n length
#'  @param digits  sprintf will nice format prefix, padding zeroes to front if
#'  necessary.
#' @export
  get_new_prefix  <- function(n=NULL, digits=4) {
    format  <- paste0("%0",digits,"i_")
    the_prefixs  <- sprintf(format, 1:n)
  }


#' get_proposed_name
#' @description attach proposed prefix.
#' @param the_files File names that will receive new prefix.
#' @param prefix Proposed new prefix.
#' @export
get_proposed_name  <- function(the_files = NULL, prefix=NULL) {
  paste0(prefix, the_files)
}

#' rename_files
#' @param Full path to directory where files are located.
#' @param from Original file names (still on disk).
#' @param to   Proposed new file names.
#' @export
rename_files  <- function(path=NULL, from=NULL, to=NULL) 
 {
    start_time <- Sys.time()

    from = paste0(path,"/", from)
    to  <- paste0(path, "/", to)
    file.rename( from = from, to = to)

    end_time <- Sys.time()
    print (end_time - start_time)
 }

