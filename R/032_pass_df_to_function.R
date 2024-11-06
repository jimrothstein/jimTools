# nolint start
# 032_pass_df_to_function.R
#' @title Pass df and variable to function

#' @param df data.frame
#' @param var column in data.frame, .data variable
#' @export


mtcars[[hp]] # fails
mtcars[["hp"]] # works

s <- function(df = NULL, col = NULL) {
  x1 <- substitute(col) # symbol
  x2 <- deparse(substitute(col)) # character
  list(x1, x2)
}

res <- s(mtcars, hp)
X <- "hp"
res <- s(mtcars, X)
sapply(res, is.symbol)
sapply(res, is.character)

identical(mtcars[[res[[1]]]], mtcars[[res[[2]]]])

## do not want to quote?  use this
t <- function(df = NULL, col = NULL) {
  df[[substitute(col)]]
}
t(mtcars, hp)


filter <- function(df = NULL, col = NULL) {
  # df <- deparse(substitute(df))
  #  browser()
  a <- deparse(substitute(col))
  b <- eval(deparse(substitute(col)))
  list(a, , b)
  #  df[[col]]
}
z <- mtcars
y <- "hp"
filter(z, y)
filter(z, hp)

f1 <- function(df = NULL, var = NULL) {
  stopifnot(!is.null(df))
  return(list(var, names(df)))
  # return(var)
}
f1(mtcars, "hp")
f1(mtcars, hp)
testthat::expect_no_error(
  f1(mtcars, var = "hp")
)

testthat::expect_error(
  f1(mtcars, var = hp)
)

f1(mtcars, hp)
f1(mtcars, "hp")

f2 <- function(df = NULL, var = NULL) {
  stopifnot(!is.null(df))
  # count(df, .data[[var]]),
  # return(df)
  return(var)
  dplyr::summarize(df,
    n = n(),
    min = base::min(df, {{ var }})
  )

  # dplyr::count(df, {{ var }})
}
f(mtcars, "hp")
f(mtcars, hp)
f(mtcars, var = "hp")

args("mean")
args(mean)

formals(mean)

x <- call("mean", "mtcars")
x[[1]]
length(x)
# nolint end