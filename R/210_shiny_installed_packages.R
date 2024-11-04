### PURPOSE:   Update R  packages, fancy way.   Candidate for SHINY as GUI?
## /home/jim/code/jimTools/210_shiny_installed_packages.R
##              TODO:
##              package directory:  include but in clean way
##              fix LSP to recognize *.R as filetype r

library(shiny)
library(data.table)
dt <- as.data.table(installed.packages())

ui <- fluidPage(
  h2("Currently Installed Packagess"),
  textOutput("dim"),
  tableOutput("installed")
)
# head(dt)[1:3,1:3 ]
# dim(dt) # [1] 264  16

server <- function(input, output, session) {
  output$dim <- renderText(dim(dt))
  output$installed <- renderTable(dt[, .(Package, Version)])
}

shinyApp(ui, server)
# 		/* vim: set filetype=r : */
