## WHERE(name, env=caller_env()
## USAGE:  where("mean")
## Find env which has 'name"
# ===============================
#
library(rlang)
where <- function(name, env = caller_env()) { #
  if (!is.character(name)) abort("name must be a string")
  if (identical(env, empty_env())) {
    stop("no such function found")
  } else if (env_has(env, name)) {
    return(env)
  } else {
    where(name, env_parent(env))
  }
}

# 	where("mean")
# where(mean)
# where("env_has")
# where("junk_9991")

## ==================


## give name to an env
## set_env_name(env, name = )
## USAGE:  set_env_name(env,name)

set_env_name <- function(env, name = deparse(substitute(env))) { #
  if (env_name(env) == "") {
    attr(env, "name") <- name
  }
}

## TEST
# e1  <- env()
# set_env_name(e1, "e1")
# env_name(e1)
#
# set_env_name(global_env())
# env_name(global_env())
#
# e2  <- env()
# set_env_name(e2)
# env_name(e2)
# ============
##

# ============================
## report_info(f, current, calling)
## USAGE:  where("mean")
## PURPOSE: For function f, return enclosing env, calling env, env where
## executing
# ============================
report_info <- function(f, calling, current) {
  list(
    enclosing = fn_env(f),
    current = current, # ie env where f is running
    calling = calling
  )
}

# EXAMPLE1
f <- function() {
  set_env_name(current_env(), "e1")

  do_something <- function() {
    # code
    # code
    set_env_name(current_env(), "e2")
    report_info(do_something, caller_env(), current_env())
  }

  do_something()
}
f()


# EXAMPLE2
e1 <- env()
set_env_name(e1, "e1")

e2 <- env(e1)
env_parent(e2) # e1
# TODO- h isn't right
# e2$h  <- function() {}
#
# fn_env(e2$h)  # really?
#
# fn_env(h)
# env_print(e1)
# env_print(e2)


e1$do_something <- function() {
  # code
  # code
  set_env_name(current_env(), "e2")
  report_info(e1$do_something, caller_env(), current_env())
}

e1$do_something()
environment(e1$do_something) #

# =====================
#  ren_pdf() and ren_github()
#  DESCRIPTION:   Compile <.Rmd file>, render as local github_document markdown
#  USAGE:   ren_github (<file>,<output_dir>)
# =====================

# =======================
# ren_pdf() - render as pdf
# =======================
# MOVED to jimTools::
#
# ren_pdf  <- function(file, dir) {
file <- "011B_misc_fun_operators.Rmd"
dir <- "book_advanced_R"
#   rmarkdown::render(
#                   here(dir,file),
#                   output_dir="~/Downloads/print_and_delete")
# }

# render as pdf
# not run
# ren_pdf( file = "011B_misc_fun_operators.Rmd", dir = "book_advanced_R/R")
#

# ===================================
# ren_github() - render as github in ./md
# ===================================
# ren_github  <- function(file, dir) {
# file  <- "011B_misc_fun_operators.Rmd"
# dir <-"book_advanced_R"
#   rmarkdown::render(
#                     here(dir,file),
#                     output_format="github_document",
#                     output_dir="./md")
#   }
# EXAMPLE, not run
# ren_github( file = "011B_misc_fun_operators.Rmd", dir = "book_advanced_R/R")#

# =====================================================
# info() - helper, info about environment of a function#
# =====================================================

info <- function() {
  list(
    current = current_env(), caller = caller_env(),
    caller_parent = caller_env(n = 2)
  )
}

# TODO add
# return char[], so easier to print in caller?
# enclosure = fn_env

# USAGE:
info()

# EXAMPLE:  inside 2nd function
current_env()
f <- function() {
  info()
}
f() #
