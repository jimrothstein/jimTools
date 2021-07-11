#' @title read_file_names
#'
#' @description 
#'  Returns character vector of files in path that match regex
#'  pattern.
#' @param path Path to directory.
#' @param pattern Use pattern (regex) to return subset of files.  If pattern is NULL, all files
#'  in path will be returned.
#' @return character vector of file names
#' @export
#'
read_file_names  <- function(path = NULL, pattern = NULL) {
  ## tests
  list.files(path, pattern)
}



#' rename_file_names
#' @description
#'   Renames all files that have changed file name.
#' @param Full path to directory where files are located.
#' @param from Original file names (still on disk).
#' @param to   Proposed new file names.
#' @export
rename_file_names  <- function(path=NULL, from=NULL, to=NULL) 
 {
    start_time <- Sys.time()

    from = paste0(path,"/", from)
    to  <- paste0(path, "/", to)
    file.rename( from = from, to = to)

    end_time <- Sys.time()
    print (end_time - start_time)
 }
