#' get_options returns tibble of options
#'
#'
#'
#' @export
get_options  <- function() {

	
t <- tibble::tibble(options = options())

z  <- tibble::tibble(option_name=names(t$options),
										values = t[[1]])

}
