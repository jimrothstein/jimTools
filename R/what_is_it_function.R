# returns details about r object

# library(tidyverse)
# library(tibble) # I need this?
#
#' @name	what_is_it
# from: 040_jennybc_function_what_is_it.R
#' @title what_is_it
#' @description Tries to figure out what kind of vector
#' @keywords internal
# ---- what_is_it ----
what_is_it <-function(v){
        testName<-c("tibble",
        	    "list",
                    "vector",
                    "typeof",
                    "length",
                    "atomic", 
                    #"numeric",         Deprecated in purrr
                    "integer",
                    "double",
                    "character",
                    "logical")
        
        result <-
                c(is_tibble(v),
                  is_list(v),
                  is_vector(v), 
                  typeof(v),
                  length(v),
                  is_atomic(v),
                  #is_numeric(v),
                  is_integer(v),
                  is_double(v),
                  is_character(v),
                  is_logical(v))
        
        
        t<-tibble(testName,result)
        print(t)
        print("----jimPackage----")
	}
f_object <- function(o) {
	testName<-c("mode",
		    "length",
		    "class",
		    "typeof")
	
	result <- c(mode(o),
		    length(o),
		    class(o),
		    typeof(o)    )	

        t<-tibble(testName,result)
        print(t)
        print("----jimPackage----")
}

########################
#	f()
# 	see Hadley video on rlang
#	f returns, x+y always, for f(1,2), f(a,b)
#
########################

library(rlang)
f <- function(x,y) rlang::expr(x+y)
f(2+3) # x+y
f(a,b) # x+y
f(2,3) # x+y, always!
