PURPOSE:    Collect code related to package information.

~/code/try_things_here/rmd/

INCLUDE:   
  *  00001_explore ...
  *  085_system_tools  (related to pkgs)

SEE ALSO:
  *  Rscripts for working code to update packages.
  

BASE TOOLS used here:
  *  tools::dependsOnPkgs
  *  utils::installed.packages


{  ## setup

load_all()

}

{  ## ALL this from JennyBC, spartan (prune ...)

#01-explore-libraries....R
# see /rstd.io/forgot  (sends to github page)

#' Which libraries does R search for packages?

library(tidyverse)

## how many installed packages?
t <- as_tibble(installed.packages())
t
s <- t %>% select(Package, LibPath, Version, Priority) %>% 
	mutate(lib = if_else( stringr::str_starts(LibPath,
											  "/home/jim/R/x86"),
											  "jim Lib", 
											  "other Lib")
) %>% 
select(-LibPath)
s
print(s, n=400)

# tabulate (count) pkgs for each R version
table(t$Built)			

#' Exploring the packages

##   * tabulate by LibPath, Priority, or both

# 2 library paths!   mine and /usr/lib/R/library
table(t$LibPath)

# so why do I have 351 packages!
table(t$Priority)	# base=14  recommended=19


##   * what proportion need compilation?
## no=191 yes=151
table(t$NeedsCompilation)



#' Reflections

##   * how does the result of .libPaths() relate to the result of .Library?


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
head(installed.packages(fields=c("Package","Depends"), n=15))
## END of JennyBC

}
# =================End JennyBC =================================


{ ## Code from ~/code/try_things_here/rmd/0085_system_tools.Rmd

### find package locations
  *  uses find.package
  *  does not load package, only  tests if exists
```{r pkg_location}
base::system.file(package="base")
base::system.file(package="tibble")
base::system.file(package="jimTools")
```

```{r .libPaths)
#### 4-.libPaths(), list all paths, purpose, name
#### see also ~/.Renviron

t_libPaths <- tibble(.libPaths()) %>% 
  mutate(
  purpose =  c("added packages", 
               ".Library.site", 
               ".Library.site", 
               "base R pkgs"),  

  quantity  = c("many", "Empty", "Empty", "many")  ,
  env_var = c("R_LIBS_USER","","","R_LIBS?"),
  aka = c("",".Library.site", ".Library.site", ".Library.site, .Library"))

t_libPaths
```

other ways to list all pkgs
```{r all_pkgs}
# too much output
if (FALSE) {
  #### another way to list ALL pkgs
  # For each element of .libPaths(), dir() returns list of ALL files/directories.
  lapply(.libPaths(), dir)   # dir() returns <list>

  #### returns <list> of char[]	
  lapply(.libPaths(), list.dirs, recursive = FALSE)
}

```
}
dependencies?
```{r begin}
package="ggplot2"
# What does package need?
jimTools::jr_package_dependencies(package=package)


# BROKEN
# What other pkg need this one?
t  <-  jimTools::jr_package_dependencies_reverse(package=package)
t  <- tibble::as_tibble(t)
t %>% head()


# fields refers to fields in DESCRIPTION of packag
# TODO, replace lib.loc with my lib
tools::dependsOnPkgs(package,
               dependencies = c("Depends", "Imports", "LinkingTo"),
               recursive = TRUE, 
							 lib.loc = NULL,
               installed =
               utils::installed.packages(lib.loc=NULL, 
																				 fields = "Enhances"))

# try this in dt?
library(datatable)

```

```{r learn_about_options}
# list of lists
length(options()) #84

t  <- tibble::tibble(name=names(options()))
print(t, n=100)
```




```{r knit_exit()}
knitr::knit_exit()
```



