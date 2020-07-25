library(testthat)
library(jimTools)

# deprecated
## context("....")



test_check("jimTools")

test_that("first test", {
						expect_equal("hello", "hello")
						expect_equal(simple(),"hello from simple")
						expect_equal("hello", "hello")
})

# GIVEN named list of strings, flatten list into single string
# format_single_string  <- function(l) {
#   map2_chr(names(l), l, ~ paste0(.x ,": ",pluck(.y), "\t\t")  )
# }

test_that("format_single_string()", {
						l  <- list(one="a", two="b", three="c")
						format_single_string(l)
						expect_equal(format_single_string(l), 
'"one: a\t\t"   "two: b\t\t"   "three: c\t\t')
						expect_equal(3,3)
})
