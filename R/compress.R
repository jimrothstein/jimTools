#'  compress a dir
#' 
#'  @param dir directory (under projet root) to compress
#'  @return 
#'  @export

#'  
jr_compress_dir  <- function(dir) {
out  <- paste0( lubridate::now(), 
								"_archive_",
								"compressed_files.tar.gz"
		)

	tar( tarfile =
			here("compressed", out),
			files=here(dir),  
			compression = c("gzip"))
}

