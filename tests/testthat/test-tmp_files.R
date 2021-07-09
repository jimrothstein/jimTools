#  PURPOSE:   test create, remove of fake files

# file <- "/home/jim/code/jimTools/tests/testthat/test-SANDBOX.R"

list.files(dir)
dirname(f)
dir.create(dir)
unlink(dir, recursive = T)

file.create
file.remove(f)


#
##
load_all()

#### create temp file, write content to it, modify it, read result
library(xfun)

f  <- tempfile()
f
dir.create(dirname(f))
file.create(f)

create_file  <- function() {

  f = tempfile()
  dir.create(dirname(f))
  file.create(f)
  f
}

f  <- create_file()
{
dir  <- dirname(f)
list.files(dirname(f))
}

## contents?
readLines(f)

## write to it
  xfun::write_utf8("Hello World", f)

readLines(f)

modify_file_content  <- function(file, from , to){
  xfun::process_file(file, function(x) 
                   sub(from, to, x))
}

modify_file_content( f, "Hello", "Joke")

xfun::read_utf8(f)  # see if it has been updated
readLines(f)


## removes 1 file
##
file.remove(f)

list.files(dirname(f))

## remove all
unlink(dir, recursive = T)
list.files(dir)

tryCatch(file.remove(f),
         error = function(e) print("error") ,
         warning = function(e) print("warning")
         )






