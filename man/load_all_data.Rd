% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_all_data.R
\encoding{UTF-8}
\name{load_all_data}
\alias{load_all_data}
\title{Loads all RPDR text outputs into R.}
\usage{
load_all_data(
  folder,
  which_data = c("mrn", "con", "dem", "all", "bib", "dia", "enc", "lab", "lno", "mcm",
    "med", "mic", "phy", "prc", "prv", "ptd", "rdt", "rfv", "trn", "car", "dis", "end",
    "hnp", "opn", "pat", "prg", "pul", "rad", "vis"),
  old_dem = FALSE,
  merge_id = "EMPI",
  sep = ":",
  id_length = "standard",
  perc = 0.6,
  na = TRUE,
  identical = TRUE,
  nThread = parallel::detectCores() - 1,
  many_sources = TRUE,
  load_report = TRUE,
  format_orig = FALSE
)
}
\arguments{
\item{folder}{string, full folder path to RPDR text files.}

\item{which_data}{string vector, an array of abbreviation corresponding to the datasources wished to load.}

\item{old_dem}{boolean, should old \emph{load_dem} function be used for loading demographic data. Defaults to \emph{TRUE}, should be set to \emph{FALSE} for Dem.txt datasets prior to 2022.}

\item{merge_id}{string, column name to use to create \emph{ID_MERGE} column used to merge different datasets. Defaults to \emph{EMPI},
as it is the preferred MRN in the RPDR system. In case of mrn dataset, leave at EMPI, as it is automatically converted to: "Enterprise_Master_Patient_Index".}

\item{sep}{string, divider between hospital ID and MRN. Defaults to \emph{:}.}

\item{id_length}{string, indicating whether to modify MRN length based-on required values \emph{id_length = standard}, or to keep lengths as is \emph{id_length = asis}.
If \emph{id_length = standard} then in case of \emph{MGH, BWH, MCL, EMPI and PMRN} the length of the MRNs are corrected accordingly by adding zeros, or removing numeral from the beginning.
In other cases the lengths are unchanged. Defaults to \emph{standard}.}

\item{perc}{numeric, a number between 0-1 indicating which parsed ID columns to keep. Data present in \emph{perc x 100\%} of patients are kept.}

\item{na}{boolean, whether to remove columns with only NA values. Defaults to \emph{TRUE}.}

\item{identical}{boolean, whether to remove columns with identical values. Defaults to \emph{TRUE}.}

\item{nThread}{integer, number of threads to use for parallelization.}

\item{many_sources}{boolean, if \emph{TRUE}, then parallelization is done on the level of the datasources. If \emph{FALSE}, then parallelization is done within the datasources.
If there are many datasources, then it is advised to set this TRUE, as then each different datasource will be processed in parallel.
However, if there are only a few datasources selected to load, but many files per datasource (result of large queries), then it may be faster to parallelize within each datasource and therefore should be set to \emph{FALSE}.
If there are only a few sources each with one file then set to TRUE.}

\item{load_report}{boolean, should the report text be returned for notes. Defaults to \emph{TRUE}.}

\item{format_orig}{boolean, should report be returned in its original formatting or should white spaces used for formatting be removed. Defaults to \emph{FALSE}.}
}
\value{
list of parsed data tables containing the information.
}
\description{
Loads all RPDR text outputs into R and returns a list of data tables processed. If multiple text files of the same type are available (if the query is larger than 25000 patients),
then add a \emph{"_"} and a number to merge the same data sources into a single output in the order of the provided number.
}
\examples{
\dontrun{
#Load all Con, Dem and Mrn datasets processing all files within given datasource in parallel
load_all_data(folder = folder_rpdr, which_data = c("con", "dem", "mrn"),
nThread = 2, many_sources = FALSE)

#Load all supported file types parallelizing on the level of datasources
load_all_data(folder = folder_rpdr, nThread = 2, many_sources = TRUE,
format_orig = TRUE)
}
}
