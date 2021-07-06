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

remove(fake_dir)
file.remove(fake_dir)

y  <- unlink(fake_dir, recursive=T, force=T)
y

if  (y == 0) print("Temp files and temp dir removed.")


```

See:  xfun:: code
#### create temp file, write content to it, modify it, read result
```{r}
library(xfun)
f = tempfile()
f

xfun::write_utf8("Hello World", f)

# x is content of file
xfun::process_file(f, function(x) 
                   gsub("World", "woRld", x))

xfun::read_utf8(f)  # see if it has been updated

file.remove(f)
```




