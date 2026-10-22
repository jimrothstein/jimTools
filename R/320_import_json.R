# import json and format

# gh issue list --json number,title,assignees > issues.json
# this file:    jimtools/R/320_import_json.R
# json file:    jimtools/issues.json
# json file:    aNCA/issues.json

library(jsonlite)
library(tibble)
library(dplyr)
library(kableExtra)

library(knitr)

thefile <- "~/code/aNCA/issues.json"

issues <- fromJSON(thefile, simplifyDataFrame = TRUE)

result <- issues |>
  mutate(assignees = sapply(assignees, function(x) {
    if (length(x) == 0 || all(is.na(x$name))) "" else paste(x$name, collapse = ", ")
  })) |>
  select(number, assignees, title) |>
  as_tibble()

t = kable(result, format = "markdown", col.names = c("Number", "Assignees", "Title")) 

writeLines(t, con= "output_table.md")


