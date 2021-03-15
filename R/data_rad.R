#' @name data_rad
#'
#' @title Example of processed rad.txt output from RPDR using the load_rad() function.
#'
#' @description Result of a rad.txt output from RPDR loaded into a data table in R using \emph{load_rad()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_rad
#'
#' @format data.table
#'
#' @return data table, with radiological notes information.
#' \describe{
#'  \item{ID_MERGE}{numeric, defined IDs by \emph{merge_id}, used for merging later.}
#'  \item{ID_rad_EMPI}{string, Unique Partners-wide identifier assigned to the patient used to consolidate patient information
#'  from \emph{rad} datasource, corresponds to EMPI in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_rad_PMRN}{string, Epic medical record number. This value is unique across Epic instances within the Partners network
#'  from \emph{rad} datasource, corresponds to EPIC_PMRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_rad_loc}{string, if mrn_type == TRUE, then the data in \emph{MRN_Type} and \emph{MRN} are parsed into IDs corresponding to locations \emph{(loc)}. Data is formatted using pretty_mrn().}
#'  \item{time_rad_exam}{POSIXct, Date when the report was filed, corresponds to Report_Date_Time in RPDR. Converted to POSIXct format.}
#'  \item{rad_rep_num}{string, Source-specific identifier used to reference the report, corresponds to Report_Number in RPDR.}
#'  \item{rad_rep_desc}{string, Type of procedure detailed in the report, corresponds to Report_Description in RPDR.}
#'  \item{rad_rep_status}{string, Completion status of the note/report, corresponds to Report_Status in RPDR. }
#'  \item{rad_rep_type}{string, This will always default to RAD, corresponds to Report_Type in RPDR.}
#'  \item{rad_rep_txt}{string, Full narrative text contained in the note/report, corresponds to Report_Text in RPDR.}
#'  }
#'
#' @encoding UTF-8

NULL
