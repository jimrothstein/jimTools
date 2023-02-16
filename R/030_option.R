#'	@export
get_options  <- function() {

	
t <- tibble::tibble(options = options())

z  <- tibble::tibble(option_name=names(t$options),
										values = t[[1]])

}
# ---------------------------------------  options() ---------------------------------------
# Goal:   fix digits displayed
# options() .Options are INCONSISENT

# few options for printing format
options() |> length()         #92  (of list)
options() |> names()

# find options with "dig" in name
options() |> names() |> grep(pattern="dig*")      # not correct
z  <- options() |> names() |> grep(pattern="dig") # correct 
options()[z]    # digits

# sprintf is better, also prettNum()
sprintf("%e", pi)
sprintf("%e", pi/10)


# for NOW, just divide by 1000 (cases per 1000 people)

# ------------------------------------------------------------------------------
#   pairlist and not function
.Options


(getOption("width"))

# catch old, set new
old  <- options("width" = 50)
getOption("width")  #50

# change it back
old  #74
(options(width = 74))
(options(width = old))   # why fail?


# ------------------------------------------------------------------------------
# Find all options with 'dplyr' in name
.Options[grep(pattern='dplyr', names(.Options))]
options("width")      # list
getOption("width")    # atomic
