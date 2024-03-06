# 2023-10-31 -


# -------------------------------------
# 200_   orginal R update, simplified
# 201_   misc commands to explore packages (clean up!)
# 202_   fancier R update (working, need to get to tip-top shape)
# -------------------------------------

library(data.table)
.libPaths()

# ---------------------------------------
##  Already installed:
dt <- data.table(installed.packages())
dt[1:3]
dt[, .(Package, NeedsCompilation, Built)]
dt[, .(Package, LibPath)]


t <- tibble(installed.packages())
t
# ---------------------------------------
##
##
old <- old.packages(checkBuilt = T, instPkgs = installed.packages())
old

{
  begin <- Sys.time()

  update.packages(
    ask = F,
    checkBuilt = T,
    oldPkgs = old.packages()
  )

  # update.packages(ask = F,
  # oldPkgs = old.packages(),
  # checkBuilt=T)
  end <- Sys.time()
  diff <- end - begin
  diff
}
