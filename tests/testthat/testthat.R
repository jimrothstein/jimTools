library(testthat)
library(jimTools)

test_check("jimTools")

context("context = testing ...")
test_that("first test", {
						expect_equal(simple(),"hello from simple")
})

