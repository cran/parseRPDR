<!-- README.md is generated from README.Rmd. Please edit that file -->

# parseRPDR

parseRPDR is a package for loading and manipulating Research Patient
Data Registry (RPDR) data in the R environment. All functionalities are
parallelized for fast and efficient analyses. parseRPDR currently
supports txt sources: mrn, con, dem, enc, rdt, lab, med, dia and rad.
For each datasource there is unique load_abc function which loads the
datasource into R into a data table. These functions do minimal cleanup
of the inputs for easier manipulations later. These are specified in
each help file corresponding to the functions. The package also provides
helper functions for data manipulation and frequently used tasks, such
as finding imaging examinations within a timeframe of a hospital
encounter. For detailed examples please read the
[vignette](https://CRAN.R-project.org/package=parseRPDR/vignettes/Using_parseRPDR.html).
