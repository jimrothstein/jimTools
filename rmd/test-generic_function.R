test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

## test the_files matches what we  expect
l  <- list.files(path = path, pattern = pattern)
the_files  <- get_files(path=path, pattern = pattern)
identical(l, the_files)


## check names are safely in new environment.
save_old_names(the_files)

the_files  <- remove_prefix(the_files, pattern="")
the_files

n  <- length(the_files)
prefix  <- get_prefix(n=n, digits=5)
prefix

NEW  <- get_proposed_name(the_files = the_files, prefix=prefix)
NEW
