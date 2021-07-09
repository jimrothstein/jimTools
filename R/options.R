#' get_options returns tibble of options
#'
#'
#'
#' @keywords internal
#' @export
get_options  <- function() {

	
t <- tibble::tibble(options = options())

z  <- tibble::tibble(option_name=names(t$options),
										values = t[[1]])

}
