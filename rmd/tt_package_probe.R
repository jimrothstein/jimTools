
---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
output: 
  pdf_document:
    toc: TRUE 
		toc_depth: 4
    latex_engine: xelatex
fontsize: 12pt
geometry: margin=0.5in,top=0.25in
#  md_document:
#  html_document:
#  github_document:
#   toc: true
#  	toc_float: true
#    css: styles.css
params:
  date: !r lubridate::today()
---
~/code/MASTER_INDEX.md
file="/home/jim/.config/nvim/templates/skeleton.R"


PURPOSE   Tools to probe a single R packages.
TODO  Study code   


```{r setup, include=FALSE		}
knitr::opts_chunk$set(echo = TRUE,
                      comment = "      ##",
                      error = TRUE,
                      collapse = FALSE   ) # easier to read
file  <- knitr::current_input() 
library(tibble)
library(here)
library(knitr)
library(yaml)

read_yaml(file = "0088C_base_probe_one_package.Rmd")

# reading from a file connection
filename <- tempfile()
filename
tag1  <- paste0(basename(filename), "_", "my_tag")
tag1

cat("test: data\n", file = filename)
cat("tags: A,B,C,", tag1, ",\n", file=filename, append=TRUE)
con <- file(filename, "r")
read_yaml(con)
close(con)


the_pkg  <- "knitr"
```


## sessioninfo::package_info()
```{r package_info}
# For Installed Packages, yields dependencies
sessioninfo::package_info(pkg="tibble")
```

### library
```{r library}
# note syntax
x  <- library(help = knitr)
str(x)
x   # opens help
library(dplyr)
glimpse(x)
info  <- x$info
glimpse(info)
info[[1]]  # credits, thousands of blank lines ?

# function and purpose (need to widen window)
info[[2]]

# 9 x 2 matrix?
info[[3]]
```

### list objects in environment
```{r ls}
# ?ls
# note syntax
x  <- ls("package:knitr")
typeof(x)
length(x) #124
x
```

### list object info,  ls.str, lsf.str()
```{r ls}
?lsf.str
# note syntax
x  <- lsf.str("package:knitr")
typeof(x)  #111
length(x)
x
```

### getNameSpace
```{r namespace}
getNamespace("knitr")
```
### ls objects in Namespace
```{r ls_objects}
x  <- ls(getNamespace(the_pkg))
typeof(x)  #418
length(x)
x

```

### 
```{r exports}
x  <- getNamespaceExports("knitr")
typeof(x)
length(x) #124
x


```
