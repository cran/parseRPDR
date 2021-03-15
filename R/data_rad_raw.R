#' @name data_rad_raw
#'
#' @title Example of rad.txt output from RPDR.
#'
#' @description A rad.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_rad_raw
#'
#' @format data.table
#'
#' @return data table, imported from rad.txt
#' \describe{
#'  \item{EMPI}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MRN_Type}{string, Indicates the institution associated with a specific MRN. This can appear as a comma-delimited list if MRNs from multiple Partners Health System institutions are available.}
#'  \item{MRN}{string, Unique Medical Record Number for the site identified in the 'MRN_Type' field. This can appear as a comma-delimited list if multiple MRNs from Partners hospitals are available.}
#'  \item{Report_Number}{string, Source-specific identifier used to reference the report.}
#'  \item{Report_Date_Time}{string, Date when the report was filed.}
#'  \item{Report_Description}{string, Type of procedure detailed in the report.}
#'  \item{Report_Status}{string, Completion status of the note/report..}
#'  \item{Report_Type}{string, This will always default to RAD.}
#'  \item{Report_Text}{string, Full narrative text contained in the note/report.}
#'  }
#'
#' @encoding UTF-8

NULL
