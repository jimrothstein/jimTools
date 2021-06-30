

# #'  @title get_RMD_files
#'
#'  @description  Given a path and pattern, return char vector of file names.
#'  Ignores files that begin with '_'
#'  @param path  Directory to query. 
#'  @param pattern regex pattern to match files 
#'  @return full file name (with directory)
#'  @export
   get_RMD_files  <- function (path = ".", pattern = NULL, recursive = FALSE) {
     #
     #rmd_pattern  <- '[.][Rr](md|markdown)$'
     # md_pattern  <- '[.][Rr]?(md|markdown)$'
     #
     files  <- list.files(path  =  path, pattern = pattern, recursive = recursive)
     # exclude files begin with _
     files  <- files[!grepl('^_', basename(files)) | 
                     !grepl('^_index[.]', basename(files)) ]
     files  <- paste0(path,"/", files)
   }


   # MOVE TO TEST
   # dir = "."
   #    dir = "~/code/try_things_here/rmd"
   #     x  <- get_RMD_files(path=dir)
   # x

