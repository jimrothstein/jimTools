Template for .Rmd
================

    file <- "001_compress_files.Rmd"
    file  <- basename(file)
    dir="rmd"

    jimTools::ren_pdf(file,dir)
    jimTools::ren_github(file, dir)

jr\_compress\_dir()

    dir <- NULL

    jr_compress_dir("rmd")
    jr_compress_dir("R")

    # To inspect tar.gz
    # tar doesn't like files in quotes
    tar --list -f <file>
          ## Error: <text>:3:20: unexpected '>'
          ## 2: # tar doesn't like files in quotes
          ## 3: tar --list -f <file>
          ##                       ^

    knitr::knit_exit()
