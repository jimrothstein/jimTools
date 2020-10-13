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
									output_format="pdf_document",
									output_dir="~/Downloads/print_and_delete") 
}




#' ====================================

#' @title
#' ren_github(file, dir)
#'
#' @description
#'  render rmd to .md github format
#' 
#' @details
#'  No details.
#'
#' @seealso
#'  many places for more info.
#' @param file file name
#' @param dir  directory, use as here(file, dir)
#'
#' @return
#' @examples
#'  ren_github(x=here("rmd", "001_compress.Rmd"))
#'  ren_github(x=here("rmd", "001_compress.Rmd"), 
#'    output_dir = "./md")
#'  ren_github(x=here("rmd", "001_compress.Rmd"), 
#'    output_dir = "~/Downloads/print_and_delete")
#'  sum(1:10)
#'  \dontrun{
#'    sum("a")
#'    }
#' @export
ren_github  <- function(x=NULL, output_dir= "./md") {
rmarkdown::render(x,
									output_format="github_document",
                  output_dir=output_dir
                 ) 
}


