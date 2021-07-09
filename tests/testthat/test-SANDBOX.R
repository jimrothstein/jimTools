#  PURPOSE:   test create, remove of fake files

# file <- "/home/jim/code/jimTools/tests/testthat/test-SANDBOX.R"
#
##
load_all()

library(ttdo)
library(tinytest)
tinytest::using(ttdo)  ## use tinytest extension mechanism
     tt <- tinytest::expect_equal(1+1, 2)
tt
     if (isTRUE(tt)){
       print("w00p w00p!")
     } else {
       print("Oh no!")
     }




{
## create tmpdir and empty tempfile
## should return name of dir
tempdir  <- create_sandbox()
tempdir

}

{
## Add a file
the_files = c("_NA_( 123")
add_files_sandbox(tempdir = tempdir, the_files=the_files)

## Check
dir(tempdir)
}

{
remove_sandbox(tempdir)
dir(tempdir)
list.files(tempdir)
}


# LEGACY
lapply(fake_files, write_fake_file)

# check
xfun::read_utf8(fake_files[1])

fake_dir  <- dirname(fake_files[1])
fake_dir
list.files(fake_dir)

# ================


```



#### Change prefix for fake files
jimTools::get_files

TODO
See:  xfun:: code
#### create temp file, write content to it, modify it, read result
```{r}
library(xfun)
f = tempfile()
f

xfun::write_utf8("Hello World", f)


## modify content in a file
# x is content of file f; 
#
#
modify_file_content  <- function(file, from , to){
xfun::process_file(file, function(x) 
                   sub("World", "woRld", x))
}
xfun::read_utf8(f)  # see if it has been updated

file.remove(f)
```




