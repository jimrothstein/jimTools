#' @title compress a dir
#' 
#' @description compress_dir()  creates .tar.gz file
#'    if type is system, zipped file will be placed in toGoogle dir
#'    if type is project, zipped file will be placed in compressed folder in
#'    this package.
#' @param type project, if dir is inside R project; (ie relative dir), OR
#'              system, if the_dirs is list of complete diretory paths
#' @param dir directory 
#' @param prefix of file name
#' @param out_file  prefix plus this will be name of  compressed file.
#' @keywords backup compress
#' @return 
#' @export
#'
compress_dir  <- function(prefix = NULL, out_file = NULL,
                                      type = c("project", "system"),
                                      dir = NULL)

{
  # work done here
  if (type == "project")
	  tar( 	tarfile = here("compressed", out_file),
				files=here(dir),  
				compression = c("gzip"))
  else {
    output_dir = "~/Downloads/toGoogle"
    tar( tarfile = paste0(output_dir, "/", out_file),
        files = dir,
        compression = c("gzip")
        )
  }

}

#' @title get_prefix
#' 
#' @description  prepares date-based prefix for final compressed file. 
#' @keywords backup compress helper
#' @return 
#' @export
get_prefix  <- function() {
#  x  <- lubridate::today() # YYYY-MM-DD
  x  <- lubridate::now()
  cat("Preparing prefix ...", "\n")
	prefix  <- paste(
				 	lubridate::year(x),
			  	lubridate::month(x, label=TRUE, abbr=TRUE ),
					stringr::str_pad(lubridate::day(x), 
													width=2, side=c("left"), pad="0"),
					lubridate::hour(x),
					lubridate::minute(x), 
					#lubridate::second(x),
					sep="_")
}

#' @title get_compressed_file_name
#' 
#' @description Given a prefix and dir, returns name of compressed file. 
#'
#' @param prefix prefix name
#' @param dir directory 
#' @keywords backup compress helper
#' @return 
#' @export
#'
get_compressed_file_name  <- function(prefix = NULL, 
                                      dir = NULL)
{

  cat("Preparing file_name ...", "\n")
	out_file  <- paste0(prefix , 
									"_ARCHIVE_",
                  basename(dir),
									".tar.gz")

}

