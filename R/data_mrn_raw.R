#' @name data_mrn_raw
#'
#' @title Example of mrn.txt output from RPDR.
#'
#' @description A mrn.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_mrn_raw
#'
#' @format data.table
#'
#' @return data table, imported from mrn.txt
#' \describe{
#'  \item{IncomingId}{numeric, Patient identifier, usually the EMPI.}
#'  \item{IncomingSite}{string, Source of identifier, e.g. EMP for Enterprise Master Patient Index, MGH for Mass General Hospital.}
#'  \item{Status}{string, Status of the record.}
#'  \item{Enterprise_Master_Patient_Index}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MGH_MRN}{numeric, Unique Medical Record Number for Mass General Hospital.}
#'  \item{BWH_MRN}{numeric, Unique Medical Record Number for Brigham and Women's Hospital.}
#'  \item{FH_MRN}{numeric, Unique Medical Record Number for Faulkner Hospital.}
#'  \item{SRH_MRN}{numeric, Unique Medical Record Number for Spaulding Rehabilitation Hospital.}
#'  \item{NWH_MRN}{numeric, Unique Medical Record Number for Newton-Wellesley Hospital.}
#'  \item{NSMC_MRN}{numeric, Unique Medical Record Number for North Shore Medical Center.}
#'  \item{MCL_MRN}{numeric, Unique Medical Record Number for McLean Hospital.}
#'  \item{MEE_MRN}{numeric, Unique Medical Record Number for Mass Eye and Ear.}
#'  \item{DFC_MRN}{numeric, Unique Medical Record Number for Dana Farber Cancer center.}
#'  \item{WDH_MRN}{numeric, Unique Medical Record Number for Wentworth-Douglass Hospital.}

#'  }
#'
#' @encoding UTF-8

NULL
