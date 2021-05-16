
#'  @title fetch_yaml_header
#'  @description  This function does most of actual work:  Given a file name,
#'  return yaml header as character vector, one element per line.
#'  @param f name of file
#'  @return character vector, one entry for each yaml line, `---` inclusive.
#'  @export
  fetch_yaml_header  <- function(f) {
      yaml  <-   bookdown:::fetch_yaml(read_utf8(f))

}
