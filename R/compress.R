#'  compress a dir
#' 
#'  @description compress_dir()  creates .tar.gz file
#'    if type is system, zipped file will be placed in toGoogle dir
#'    if type is project, zipped file will be placed in compressed folder in
#'    this package.
#'  @param type project, if dir is inside project; (ie relative dir)
#'              system, if the_dirs is list of complete diretory paths
#'  @param dir directory 
#'  @return 
#'  @export
#'
compress_dir  <- function(type = c("project", "system"), 
                                      dir =NULL)
{
  x  <- lubridate::now()
  cat("Processing.... ",dir, "\n")
	prefix  <- paste(
				 	lubridate::year(x),
			  	lubridate::month(x, label=TRUE, abbr=TRUE ),
					stringr::str_pad(lubridate::day(x), 
													width=2, side=c("left"), pad="0"),
					lubridate::hour(x),
					lubridate::minute(x), 
					#lubridate::second(x),
					sep="_")

	out_file  <- paste0(prefix , 
									"_ARCHIVE_",
                  basename(dir),
									".tar.gz"
			)
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

#'
#'
#'
#'
#' REMVEVE
jr_compress_dir  <- function(type = c("project", "system"), 
# ============================================================
                                      dir =NULL, 
                                      the_dirs = NULL) 
{
  if (is.null(dir) && is.null(the_dirs)) 
    stop("Please specify type, and one of `dir` or `the_dirs`")

  x  <- lubridate::now()
  cat("Processing.... ",dir, "\n")
	# format, lubridate  stringr
	prefix  <- paste(
				 	lubridate::year(x),
			  	lubridate::month(x, label=TRUE, abbr=TRUE ),
					stringr::str_pad(lubridate::day(x), 
													width=2, side=c("left"), pad="0"),
					lubridate::hour(x),
					lubridate::minute(x), 
					lubridate::second(x),
					sep="_")

	out  <- paste0(prefix , 
									"_ARCHIVE_",
									"compressed_files.tar.gz"
			)
  if (type == "project")
	  tar( 	tarfile = here("compressed", out),
				files=here(dir),  
				compression = c("gzip"))
  else
    cat("wip ....", "\n")

}

