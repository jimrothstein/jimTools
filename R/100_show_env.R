#'	@export
show_env <- function(){
  list(ran.in = environment(),     # temporary (active, or runtime) env
    parent = parent.env(environment()),# parent 
    objects = ls.str(environment())
  )
}
show_env()
