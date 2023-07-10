library(data.table)

.libPaths()

# ---------------------------------------
##  Already installed:
dt  <- data.table(installed.packages())
dt[1:3]
dt[, .(Package, NeedsCompilation, Built)]
dt[, .(Package, LibPath)]


t  <- tibble(installed.packages())
t
# ---------------------------------------
##
##
old  <- old.packages(checkBuilt = T, instPkgs = installed.packages())
old

{
  begin  <- Sys.time()

  update.packages(
                  ask = F,
                  checkBuilt = T,
                  oldPkgs = old.packages())

  # update.packages(ask = F,
                # oldPkgs = old.packages(),
                # checkBuilt=T)
  end  <- Sys.time()
  diff  <- end - begin
  diff
}


