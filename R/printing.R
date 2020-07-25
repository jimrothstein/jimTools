#' ren_github(file,dir)
#' render rmd to pdf
#'
#' @param file file name
#' @param dir  directory, use as here(file, dir)
#' 
#' 
#' @return 
#' @export
ren_pdf  <- function(file, dir) {
rmarkdown::render(
									here( dir, file), 
									output_dir="~/Downloads/print_and_delete") 
}




#' ====================================

#' ren_github(file, dir)
#' render rmd to .md github format
#'
#' @param file file name
#' @param dir  directory, use as here(file, dir)
#'
#' @return
#' @export
ren_github  <- function(file, dir) {
rmarkdown::render(
									here(dir, file),
									output_format="github_document",
									output_dir="~/Downloads/print_and_delete") 
}
