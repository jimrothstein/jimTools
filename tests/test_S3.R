
#	user does NOT use these
	reveal.secret  <- function(x) as.character(x)
	reveal.top_secret  <- function(x) cat("I can not tell you\n")

#	Do use these:
	reveal(x)
	reveal(y)

x <- create_S3_object(s="BLUE", class="secret")
y <- create_S3_object("RED", author="jim", class="top_secret")
get_info(x)
reveal
reveal.secret
reveal.top_secret
