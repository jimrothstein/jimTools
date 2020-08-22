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
