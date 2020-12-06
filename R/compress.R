#'  compress a dir
#' 
#'  @param dir directory (under projet root) to compress
#'  @return 
#'  @export

#'  
jr_compress_dir  <- function(dir) {
	x  <- lubridate::now()
  cat("Processing.... ",dir, "/n")
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

	tar( 	tarfile = here("compressed", out),
				files=here(dir),  
				compression = c("gzip"))
}

