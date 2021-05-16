
#'  @title get_tags_line
#'  @description Given a yaml header (everything between `---` inclusive),
#'  return the line begins with `TAGS:`  Return NA if no line contains
  #'  `TAGS:`
#'  @param yaml char vector with each element one line of yaml header
#'  @keywords yaml
#'  @export
 get_TAGS_line  <- function (header = null) {
   yaml  <- header
   if (length(yaml) == 0 ) return(NA)

  # drop the elements with `---`
  yaml = yaml[-c(1, length(yaml))]

  # if nothing left, returns a NA
  if (length(yaml) == 0) return(NA)

  line  <- grep("^TAGS:", yaml)

  # no TAGS line
  if (length(line) == 0) return(NA)

  TAGS = yaml[line]
 }
