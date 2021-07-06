
#  @param path Path to directory.
#  @pattern Use pattern (regex) to return subset of files.  If pattern is NULL, all files
# in path will be returned.
get_files  <- function(path = NULL, pattern = NULL) {
  ## tests
  list.files(path, pattern)
}



path  <- fake_dir
path
path  <- "~/mp3_files/"
path  <- "./"
pattern  <- NULL

the_files  <- get_files(path=path, pattern=pattern)
the_files



#  safety save copy of original files in separate environmentt
save_old_names  <- function(the_files = NULL) {
  e  <<- new.env()
  e$the_files  <- the_files
}


save_old_names(the_files)
OLD  <- the_files
OLD

## Remove any existing prefix according to pattern
## May need multiple passes
## the_files
## pattern

remove_prefix  <- function(the_files = NULL, pattern = pattern) {
  sub(pattern=pattern, replace="", x=the_files)
}
the_files  <- remove_prefix(the_files, pattern="")
the_files


pattern  <-   "^[[:digit:]]{1,2}"
the_files  <- remove_prefix(the_files, pattern=pattern)
the_files
list.files(fake_dir, pattern=pattern)
list.files(fake_dir)


## propose new prefix, min of digits
## n
## digits  sprintf will nice format prefix, padding zeroes to front if
## necessary.
  get_prefix  <- function(n=NULL, digits=4) {
    format  <- paste0("%0",digits,"i_")
    the_prefixs  <- sprintf(format, 1:n)
  }
n  <- length(the_files)
prefix  <- get_prefix(n=n, digits=5)
prefix


get_proposed_name  <- function(the_files = NULL, prefix=NULL) {
  paste0(prefix, the_files)
}
NEW  <- get_proposed_name(the_files = the_files, prefix=prefix)
NEW

rename_files  <- function() 
 {
    start_time <- Sys.time()

#    file.rename(
                from = OLD
                to = NEW
                )
    end_time <- Sys.time()
    print (end_time - start_time)
 }

## careful
rename_files(OLD, NEW)
