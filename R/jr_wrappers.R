#' jr_install.packages
#'
#' @param pkg_names   packages to install
#' @export
#'
jr_install.packages  <- function(pkg_names=NULL) {
# include any dependencies
# retain output messages in file *.out
	install.packages(pkg_names,
									 dependencies=TRUE,
									 keep_outputs=TRUE)
}

#' jr_update_packages
#'
#' 
#' @export
#'
jr_update_packages  <- function() {
	update.packages(
	# ask before install
	# if built with older R version, mark as old.
					ask = TRUE,
			checkBuilt = TRUE)	
}



#' jr_package_dependencies  
#'
#' @param package package or packages needs what? 
#' @export
jr_package_dependencies  <- function(package = NULL) {
 	tools::package_dependencies(package,reverse=FALSE	)
}

#' jr_package_dependencies_reverse
#'
#' @param package package or packages depend on this one?
#' @export
jr_package_dependencies_reverse  <- function(package = NULL) {
 	#tools::package_dependencies(package,reverse=TRUE	)

	tools::dependsOnPkgs(package,
                   dependencies = c("Depends", "Imports", "LinkingTo"),
                   recursive = TRUE, lib.loc = NULL,
                   installed =
                   utils::installed.packages(lib.loc, fields = "Enhances"))
}

#' jr_set_env 
#'
#' HELPER
#' @param key key is name of env variable
#' @param value value of env variable
#' @export
jr_set_env  <- function(key = NULL, value=NULL) {
	Sys.setenv(key = value) 
}

#' jr_get_env 
#'
#' HELPER
#' @param key key is name of env variable
#' @export
jr_get_env  <- function(key) {
	# stop if any evaluate to FALSE		
	stopifnot(
						!rlang::is_empty(key), # catches NULL
						!rlang::is_na(key),  # catch NA
						rlang::is_character(key)
	)

	Sys.getenv(key)}
