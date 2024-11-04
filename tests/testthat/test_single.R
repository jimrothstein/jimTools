context("test_single.R")
library(testthat)
library(jimTools)

# ==================
# 		To Run:
# 		devtools::test()
# ==================
#
#
# deprecated

# expect_equal means numerical equality
test_that(
  "test 1",
  expect_equal("1", "1")
)

# fails
test_that(
  "test 2",
  expect_equal("2", 2)
)


# GIVEN named list of strings, flatten list into single string
# format_single_string  <- function(l) {
#   map2_chr(names(l), l, ~ paste0(.x ,": ",pluck(.y), "\t\t")  )
# }

# test_that("format_single_string()", {
#             l  <- list(one="a", two="b", three="c")
#             format_single_string(l)
#             expect_equal(format_single_string(l),
# '"one: a\t\t"   "two: b\t\t"   "three: c\t\t')
#             expect_equal(3,3)
# })
