#  PURPOSE:   test create, remove of fake files USING tinytest::
#  TINYTEST::

file <- "../tests/testthat/tt_package_tools.R"

##
load_all()
library(tinytest)

{
  ## find packages which depend on this one
  jr_package_dependencies_reverse("tibble")
  jr_package_dependencies_reverse("data.table")
  jr_package_dependencies_reverse("magrittr")
}

{
## .libPaths() to find user and `common` library locations
# in my home directory, and
# in /usr/local/lib/R/library
.libPaths()
}

{
## list packages in user library
# top level dir only (so not recursive)
pkgs  <- lapply(.libPaths(), list.dirs, recursive=FALSE)

# user - 288!
length(pkgs[[1]])

# common - 30  
length(pkgs[[2]])
}



{
## What repos are packages from?
options("repos")
}

{
### remove a package
  if (F) {
    pkg = 
  remove.packages(pkg)
  }
}

## Examine available.packages() (>17k)
{
if (F) versions  <- available.packages()

library(tibble)
t  <- as_tibble(versions)
t[,c(1,2,12:13,15:16)]
str(versions)
names(versions)
typeof(versions)
length(versions)
versions[[4]]
head(versions)
}

### installed.packages
{
installed  <- as_tibble(installed.packages())

# 6 x 16
head(installed) 
str(installed)

# 317
installed[,"NeedsCompilation" == "no"]

installed[,"NeedsCompilation" == "yes"]
}

## Where are we now?
  * which dir are used? (for user pkgs, for common pkgs)
  * status of pkgs in each dir
# packages that can be upgraded
  #
{
old.packages()

# x is list
x  <- packageStatus()
typeof(x)
str(x)
print(x)

# details
summary(x)
}

## install.packages (using DT)

```{r installed_use_DT}
library(data.table)
library(microbenchmark)

# 4.5 ms
microbenchmark( installed  <- tibble::as_tibble(installed.packages()))

dt  <- as.data.table(installed)
names(dt)

# remove uneeded fields
# .()  is alias for list()
dt  <- dt[, .(Package,  OS_type, NeedsCompilation, Built)]
dt %>% head()

# count, group by version of Build ( = version)
dt[,.(.N)    , by=.(Built)]

# same
dt[, .N, by = .(Built)]   

dt[, .N, by = "OS_type"]  # all <NA>
dt[, .N, by = .(OS_type)]  # all <NA>

dt[, .N, by = .(NeedsCompilation)]   # 141 need!

# create subset, needs compilation
x  <- dt[NeedsCompilation == "yes"]
```



## More advanced package managment:

## List all packages + description, by library location
```{r library}
library()

(.packages())
(.packages(all.available  = TRUE))
```

## List Default Packages ?? Explain
```{r default}
getOption("defaultPackages")
```

## Basic installation
  *  sudo R CMD INSTALL *.tar.gz
```{r install, eval=F, include=F}
  install.packages("igraph", verbose=TRUE, dependencies=TRUE)
```


## workhorse
```{r update, eval=F, include=F}
{
begin  <- Sys.time()
.libPaths()

update.packages(ask=FALSE )
end  <- Sys.time()
diff  <- end - begin
diff
}
```

## Troubleshoot:  install packages one at a time
```{r trouble, eval=F, include=F}
{
begin  <- Sys.time()

# p  <- c("digest")
# p  <- c("future")
# p  <- c("httpuv")
# p  <- c("jsonlite")
# p  <- c("servr")
## p  <- c("lattice")
#p  <- c("utf8")
# p  <- c("rlang")
if (F) {
install.packages(p, verbose=TRUE, dependencies = TRUE)
}
# upgrade (p, ask = FALSE , checkBuild=TRUE)

end  <- Sys.time()
diff  <- end - begin
diff
}
# print updated summary table

```

### Pkg Dependencies
```{r dependencies}
pkg = "purrr"
packageDescription(pkg)
# subset vector
packageDescription(pkg)[c("Imports", "Suggests")]
```


## sessioninfo::package_info()
```{r package_info}
# For Installed Packages, yields dependencies
sessioninfo::package_info(pkg="tibble")

sessioninfo::package_info()
```

```{r startup}

# ---- 004 R startup ----

# In this order, R seeks .Rprofile $R_HOME, $HOME, project directory
?Startup
R.home() # /usr/lib/R
site_path = R.home(component = "home") 
site_path

# file.path constructs path to a file
fname = file.path(site_path, "etc", "Rprofile.site") 
fname

file.exists(fname) 

```

### if pkg is installed, it will have `DESCRIPTION` file
```{r description}
# returns char[] , logical for each path
does_pkg_exist  <- function(path = .libPaths(), pkg = NULL,
                            file_name = "DESCRIPTION")

  file.exists(file.path(.libPaths(), pkg=pkg, "DESCRIPTION"))

pkg = "jimTools"
pkg = "foolish"
x  <- does_pkg_exist(pkg = pkg)
x

```
