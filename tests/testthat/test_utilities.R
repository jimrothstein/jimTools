context("testthat.R")

#library(jimTools)

test_that("first test", {
						expect_equal("hello", "hello")
						#expect_equal(simple(),"hello from simple")
						expect_equal("hello", "hello")
})
# practice() returns 1
test_that("2nd test", {
             expect_equal(practice(),1)
 })
