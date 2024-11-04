#' 	@export
jim_str <- function(X = NULL, max.level = 1, vec.len = 1) {
  if (is.null(X)) print("help:   X, max.level, vec.len")
  cat("For help, jim_str() \n")
  str(X, max.level, vec.len)
}
