
#' Functions related to ENV
#'


## WHERE(name, env=caller_env()
## USAGE:  where("mean")
## Find env which has 'name"
# ===============================
where  <- function(name, env=caller_env()){

	if (!is.character(name)) abort("name must be a string")
	if (identical(env, empty_env())) {
				stop("no such function found")
}  else if (env_has(env, name)) {
							return(env)
}  else {
	where(name, env_parent(env))
}
}
## ==================


## give name to an env
## set_env_name(env, name = ) 
## USAGE:  set_env_name(env,name)

set_env_name  <- function(env, name = deparse(substitute(env) ) ){
	if (env_name(env) == ""){
		attr(env, "name")  <- name
	}
}

# ============

# ============================
## report_info(f, current, calling) 
## USAGE:  where("mean")
## PURPOSE: For function f, return enclosing env, calling env, env where
## executing
# ============================
report_info  <- function(f , calling, current) {
	list(enclosing = fn_env(f),
			 current = current,    # ie env where f is running
			 calling = calling 
	)
}


# =====================
#  ren() and ren2()
#  DESCRIPTION:   Compile <.Rmd file>, render as local github_document markdown
#  USAGE:   ren2 (<file>,<output_dir>) 
# =====================

# =======================
# ren() - render as pdf
# =======================
ren  <- function(file, dir) {
	# file  <- "011B_misc_fun_operators.Rmd"
	# dir <-"book_advanced_R"
	rmarkdown::render(
									here(dir,file), 
									output_dir="~/Downloads/print_and_delete") 
}

# render as pdf
# not run
# ren( file = "011B_misc_fun_operators.Rmd", dir = "book_advanced_R/R")
# 

# ===================================
# ren2() - render as github in ./md
# ===================================
ren2  <- function(file, dir) {
	# file  <- "011B_misc_fun_operators.Rmd"
	# dir <-"book_advanced_R"
	rmarkdown::render(
										here(dir,file), 
										output_format="github_document",
										output_dir="./md") 
	}

# =====================================================
# info() - helper, info about environment of a function# 
# =====================================================

info  <- function() list(current = current_env(), caller = caller_env(),
	caller_parent = caller_env(n=2))

# TODO add
# return char[], so easier to print in caller?
	#enclosure = fn_env



# =======
# TESTING
# =======


#	where("mean")
# where(mean)
# where("env_has")
# where("junk_9991")


## TEST set_env_name
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



# EXAMPLE1 report_info()
f  <- function(){
	set_env_name(current_env(),"e1")

	do_something  <- function() {
		# code
		# code
		set_env_name(current_env(),"e2")
		report_info(do_something,caller_env(),current_env())
	}

	do_something()
}
# f()

# EXAMPLE2 
e1  <- env()
set_env_name(e1, "e1")

e2  <- env(e1)
env_parent(e2) #e1
# TODO- h isn't right
# e2$h  <- function() {}
# 
# fn_env(e2$h)  # really?
# 
# fn_env(h)
# env_print(e1)
# env_print(e2)


do_something  <- function() {
		# code
		# code
		set_env_name(current_env(),"e2")
		report_info(do_something,caller_env(),current_env())
	}

do_something()
environment(do_something)
# 




# EXAMPLE, not run
# ren2( file = "011B_misc_fun_operators.Rmd", dir = "book_advanced_R/R")# 



# USAGE:
info()

# EXAMPLE:  inside 2nd function
current_env()
f  <- function() {
	info()
}
f()# 

#' format_single_string flattens a named list
#'
#' @param l list
#' @export

# GIVEN named list of strings, flatten list into single string
# a:value <TAB>
format_single_string  <- function(l) {
	purrr::map2_chr(names(l), l, ~ paste0(.x ,": ",purrr::pluck(.y), "\t\t")  )
}

l  <- list(a="apple", b="banana", c="carrot")
format_single_string(l)

