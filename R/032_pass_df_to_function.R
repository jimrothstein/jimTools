# 032_pass_df_to_function.R
#' @title Pass df and variable to function

#' @param df data.frame
#' @param var column in data.frame, .data variable
#' @export
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
