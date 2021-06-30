#!/usr/bin/env Rscript
#
#
# PURPOSE:  Update tinytex:: , per Yihui
# FIRST:    update old & update packages
#
# Note0:  This Rscript **updates**  At some point, it may FAIL.
#         Then use command in Note1:
#
# Note1:   tinytex::install_tinytex() installs binary| daily 
#         the variation TinyTeX-1.*  (~90 latex packages)
#
# Note2:  Several variations of TinyTeX, above should be fine.
#
#
#
#
# USAGE:    ./update_tinytex.R  at COMMAND LIME
# Works!
#
Sys.time()
{
  begin  <- Sys.time()
  tinytex::tlmgr_update()
  end  <- Sys.time()
  diff  <- end - begin
  diff
}
