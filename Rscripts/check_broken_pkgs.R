#!/usr/bin/env Rscript
#
#
# PURPOSE:  find broken packages, per Yihui
#
# USAGE:    ./check_broken_pkgs  at COMMAND LIME
# Works!
#
Sys.time()
{
  begin  <- Sys.time()
  print(" May be slow ....")
  broken  <- xfun::broken_packages(reinstall = F)
  end  <- Sys.time()
  diff  <- end - begin
  diff
}
print(broken)
