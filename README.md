<!-- README.md is generated from README.Rmd. Please edit that file -->

# parseRPDR

[![](https://cranlogs.r-pkg.org/badges/last-day/parseRPDR?color=4B8F8C)](https://CRAN.R-project.org/package=parseRPDR)
[![](https://cranlogs.r-pkg.org/badges/last-week/parseRPDR?color=E28413)](https://CRAN.R-project.org/package=parseRPDR)
[![](https://cranlogs.r-pkg.org/badges/last-month/parseRPDR?color=CC76A1)](https://CRAN.R-project.org/package=parseRPDR)
[![](https://cranlogs.r-pkg.org/badges/grand-total/parseRPDR?color=ABE188)](https://CRAN.R-project.org/package=parseRPDR)

parseRPDR is a package for loading and manipulating Research Patient
Data Registry (RPDR) data in the R environment. All functionalities are
parallelized for fast and efficient analyses. parseRPDR currently
supports txt sources: “mrn”, “con”, “dem”, “enc”, “rdt”, “lab”, “med”,
“dia”, “rfv”, “prc”, “car”, “dis”, “end”, “hnp”, “opn”, “pat”, “prg”,
“pul”, “rad” and “vis”. For each datasource there is unique load\_abc
function which loads the datasource into R into a data table. These
functions do minimal cleanup of the inputs for easier manipulations
later. These are specified in each help file corresponding to the
functions. The package also provides helper functions for data
manipulation and frequently used tasks, such as finding imaging
examinations within a timeframe of a hospital encounter. For detailed
examples please read the
[vignette](https://CRAN.R-project.org/package=parseRPDR/vignettes/Using_parseRPDR.html).
