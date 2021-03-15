#' @name data_mrn
#'
#' @title Example of processed mrn.txt output from RPDR using the load_mrn() function.
#'
#' @description Result of a mrn.txt output from RPDR loaded into a data table in R using \emph{load_mrn()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_mrn
#'
#' @format data.table
#'
#' @return data table, with MRN data.
#' \describe{
#'  \item{ID_MERGE}{numeric, defined IDs by \emph{merge_id}, used for merging later.}
#'  \item{ID_mrn_INCOMING}{string, Patient identifier, usually the EMPI, corresponds to IncomingId in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_INCOMING_SITE}{string, Source of identifier, e.g. EMP for Enterprise Master Patient Index, MGH for Mass General Hospital, corresponds to IncomingSite in RPDR.}
#'  \item{ID_mrn_PMRN}{string, Epic medical record number. This value is unique across Epic instances within the Partners network, corresponds to EPIC_PMRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_EMPI}{string, Unique Partners-wide identifier assigned to the patient used to consolidate patient information, corresponds to Enterprise_Master_Patient_Index in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_MGH}{string, Unique Medical Record Number for Mass General Hospital, corresponds to MGH_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_BWH}{string, Unique Medical Record Number for Brigham and Women's Hospital, corresponds to BWH_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_FH}{string, Unique Medical Record Number for Faulkner Hospital, corresponds to FH_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_SRH}{string, Unique Medical Record Number for Spaulding Rehabilitation Hospital, corresponds to SRH_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_NWH}{string, Unique Medical Record Number for Newton-Wellesley Hospital, corresponds to NWH_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_NSMC}{string, Unique Medical Record Number for North Shore Medical Center, corresponds to NSMC_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_MCL}{string, Unique Medical Record Number for McLean Hospital, corresponds to MCL_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_MEE}{string, Unique Medical Record Number for Mass Eye and Ear, corresponds to MEE_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_DFC}{string, Unique Medical Record Number for Dana Farber Cancer center, corresponds to DFC_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_WDH}{string, Unique Medical Record Number for Wentworth-Douglass Hospital, corresponds to WDH_MRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_mrn_STATUS}{string, Status of the record, corresponds to Status in RPDR.}
#'  }
#'
#' @encoding UTF-8

NULL
