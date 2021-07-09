#' @title jim_str() show str() information
#'
#' @description friendly version of str()
#'
#' @param X  object
#' @param max.level number of levels
#' @param vec.len number of  elements to show at each level
#' 
#' @return 
#' @keywords internal
#' @export
jim_str  <- function(X=NULL, max.level =1 , vec.len =1 ){
    if (is.null(X) ) print("help:   X, max.level, vec.len")
    cat("For help, jim_str() \n")
    str(X, max.level, vec.len)
   }




