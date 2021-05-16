
#'  @title get_RMD_files
#'
#'  @description  Given a path and pattern, return char vector of file names.
#'  Ignores files that begin with '_'
#'  @param path  Directory to query. 
#'  @param pattern regex pattern to match files 
#'  @return 
#'  @export
   get_RMD_files  <- function (path = ".", pattern = NULL, recursive = FALSE) {
     files  <- list.files(path  =  path, pattern = pattern, recursive = recursive)
     # exclude files begin with _
     files  <- files[!grepl('^_', basename(files)) | 
                     !grepl('^_index[.]', basename(files)) ]
   }
