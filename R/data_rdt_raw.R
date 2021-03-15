#' @name data_rdt_raw
#'
#' @title Example of rdt.txt output from RPDR.
#'
#' @description A rdt.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_rdt_raw
#'
#' @format data.table
#'
#' @return data table, imported from rdt.txt
#' \describe{
#'  \item{EMPI}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MRN_Type}{string, Indicates the institution associated with a specific MRN. This can appear as a comma-delimited list if MRNs from multiple Partners Health System institutions are available.}
#'  \item{MRN}{string, Unique Medical Record Number for the site identified in the 'MRN_Type' field. This can appear as a comma-delimited list if multiple MRNs from Partners hospitals are available.}
#'  \item{Date}{string, Date of the radiology exam.}
#'  \item{Mode}{string, Modality of the exam.}
#'  \item{Group}{string, Higher-level grouping concept used to consolidate similar procedures across hospitals.}
#'  \item{Test_Code}{string, Internal identifier for the procedure used by the source system.}
#'  \item{Test_Description}{string, Full name of the exam/study performed.}
#'  \item{Accession_Number}{string, Identifier assigned to the report or procedure for Radiology tracking purposes.}
#'  \item{Provider}{string, Ordering or authorizing provider for the study.}
#'  \item{Clinic}{string, Specific department/location where the procedure was ordered or performed.}
#'  \item{Hospital}{numeric, Facility where the order was entered.}
#'  \item{Inpatient_Outpatient}{string, Classifies the type of encounter where the procedure was performed.}
#'  }
#'
#' @encoding UTF-8

NULL
