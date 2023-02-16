#'	@export
jr_install.packages  <- function(pkg_names=NULL) {
	install.packages(pkg_names,
									 dependencies=TRUE,
									 keep_outputs=TRUE)
}

#'	@export
jr_update_packages  <- function() {
	update.packages(
	# ask before install
	# if built with older R version, mark as old.
					ask = TRUE,
			checkBuilt = TRUE)	
}



#'	@export
jr_package_dependencies  <- function(package = NULL) {
 	tools::package_dependencies(package,reverse=FALSE	)
}

#'	@export
jr_package_dependencies_reverse  <- function(package = NULL) {
	tools::dependsOnPkgs(package,
                   dependencies = c("Depends", "Imports", "LinkingTo"),
                   recursive = TRUE, lib.loc = NULL)

                   #installed = utils::installed.packages(lib.loc, fields = "Enhances"))
}

#'	@export
jr_set_env  <- function(key = NULL, value=NULL) {
	Sys.setenv(key = value) 
}

#'	@export
jr_get_env  <- function(key) {
	stopifnot(
						!rlang::is_empty(key), # catches NULL
						!rlang::is_na(key),  # catch NA
						rlang::is_character(key)
	)
	Sys.getenv(key)
}
