#  PURPOSE:   test create, remove of fake files


#### Create fake temp files and then remote
```{r fake}
load_all()
fake_files  <- create_fake_files()
fake_files


lapply(fake_files, write_fake_file)

# check
xfun::read_utf8(fake_files[1])

fake_dir  <- dirname(fake_files[1])
fake_dir
list.files(fake_dir)

# ================

remove_sandbox(fake_dir)

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




