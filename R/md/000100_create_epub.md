## vim:linebreak:nowrap:nospell tw=78 fo=tqlnr foldcolumn=3

# Spaces, no Tabs

title: Template for .Rmd output: pdf\_document: latex\_engine: xelatex
toc: TRUE toc\_depth: 1 fontsize: 12pt geometry: margin=0.5in,top=0.25in
—

STATUS: from github repo create .epub file. STILL a mess.

/home/jim/.config/nvim/templates/skeleton.Rmd othercomments —

<!--  commments -->
<!--  RENDER:  see bottom -->

    #### Convert bookdown to epub ####

    library(devtools)

    ## Clone to folder

    book_repo <- "hadley/adv-r"

    dest_folder <- "epub/"


    # DO NOT USE THIS
    # creates .git, forks, all kinds of things ...
    # usethis::create_from_github(book_repo,dest_folder,TRUE,protocol = "https")

    # (Now manually open the .rproj file)

    ## Install packages

    devtools::install_deps() # cross fingers and apply debug where necessary

    ## Bookdown to epub

    bookdown::render_book(input = "index.rmd", output_format = bookdown::epub_book()) # cross fingers (and prepare pest control)

    # epub should appear somewhere (_book in this case, I think) after it builds all the way
    @jimrothstein
          ## Error: <text>:27:1: unexpected '@'
          ## 26: # epub should appear somewhere (_book in this case, I think) after it builds all the way
          ## 27: @
          ##     ^

------------------------------------------------------------------------

    knitr::knit_exit() 
