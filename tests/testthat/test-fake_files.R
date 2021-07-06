#  PURPOSE:   test create, remove of fake files


#### Create fake temp files and then remote
```{r fake}
fake_files  <- create_fake_files()
fake_files


lapply(fake_files, write_fake_file)



fake_dir  <- dirname(fake_files[1])
fake_dir
list.files(fake_dir)

# check
xfun::read_utf8(fake_files[1])

remove(fake_dir)

}

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


#### Works!
#### play with ymlthis::
```{r ymlthis}
library(ymlthis)

f  <- tempfile()
f
line1  <- ymlthis::as_yml("title: Big Project ")


use_rmarkdown(.yml = line1,
              path =f)

# xfun::write_utf8(as.character(line1), f)
xfun::read_utf8(f)
remove(f)
```


