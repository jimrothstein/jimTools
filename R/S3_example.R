#' create_S3_object

#' @title create S3 object
#' @description Create two simple classes, `secret` and `top_secret`
#' @return S3 object of class
#' @export
create_S3_object <- function(s = NULL, class = NULL) {
  x <- structure(s, author = "jim", class = class)
}


#' 	get info about S3 object
#' 	@export
get_info <- function(x) {
  cat("class= ", class(x), "\n")
  cat("type= ", typeof(x), "\n")
  cat("unlisted attributes=", unlist(attributes(x)), "\n")
  cat(inherits(x, c("secret")), "\n")
  unclass(x)
}

#' 	@title generic function `reveal`
#' 	@description 	create generic, "reveal"
#' 	@export
reveal <- function(x) UseMethod("reveal")


#' 	user does NOT use these
#' 	@export
reveal.secret <- function(x) as.character(x)

#' 	user does NOT use these
#' 	@description	jr added this 17OCT `r 1+2`
#' 	@details  Example of inline r code in  .Rd
#' 	@export
reveal.top_secret <- function(x) cat("I can not tell you\n")

#' @title execuable chunk
#' @details Details
#' ```{r lorem}
#' 1+1
#' ```
#' @export
foo <- function() NULL

#' 	@title getNamespace("")
#' 	@description Add R chunk
#' 	```{r add}
#' 	ls(getNamespace("jimTools"))
#' 	```
#' 	@export
foo2 <- function() NULL


#' @title foo3
#' @description No errors, but no sign of it when document
#' ```{r}
#' cat("#' @export\n")
#' ```
#' @export
foo3 <- function() NULL
