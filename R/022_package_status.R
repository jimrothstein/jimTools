# 	022_package_status.R
# nolint start:
# 	PURUPOSE:
# 		Method to find packages needed upgrade.
# 	TODO:
# 	-	LibPath is far too long, replace with ifelse to use `nickname`;   user dir  vs system dir
# 	TAGS:  ifelse, `:=`, 14jj


# library(data.table)

# inst <- packageStatus()$inst
# dt <- as.data.table(inst)

this is error


# names(dt)
# dim(dt)



# dt[Status != "ok", .(Package, Version, Priority, Built, Status)]

## 	Simply LibPath (opt or user)

# dt[, "path" := ifelse(grepl(x = LibPath, pattern = "opt"), "opt", "user")]
# dt[Status != "ok", .(Package, path, Built, Status)]


## 	help(":=")  CLARIFIES syntax rules, CHECK IT
# help(":=")
# 	need to specify data.table::

# dt[, "path" := ifelse(2 > 1, "yes", "no")]
# nolint end
