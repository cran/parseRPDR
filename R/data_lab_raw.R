#' @name data_lab_raw
#'
#' @title Example of lab.txt output from RPDR.
#'
#' @description A lab.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_lab_raw
#'
#' @format data.table
#'
#' @return data table, imported from lab.txt
#' \describe{
#'  \item{EMPI}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MRN_Type}{string, Indicates the institution associated with a specific MRN. This can appear as a comma-delimited list if MRNs from multiple Partners Health System institutions are available.}
#'  \item{MRN}{string, Unique Medical Record Number for the site identified in the 'MRN_Type' field. This can appear as a comma-delimited list if multiple MRNs from Partners hospitals are available.}
#'  \item{Seq_Date_Time}{string, Date when the specimen was collected.}
#'  \item{Group_Id}{string, Higher-level grouping concept used to consolidate similar tests across hospitals.}
#'  \item{Loinc_Code}{string, Standardized LOINC code for the laboratory test.}
#'  \item{Test_Id}{string, Internal identifier for the test used by the source system.}
#'  \item{Test_Description}{string, Name of the lab test.}
#'  \item{Result}{string, Result value for the test.}
#'  \item{Result_Text}{string, Additional information included with the result. This can include instructions for interpretation or comments from the laboratory.}
#'  \item{Abnormal_Flag}{string, Flag for identifying if values are outside of normal ranges or represent a significant deviation from previous values.}
#'  \item{Reference_Units}{numeric, Units associated with the result value.}
#'  \item{Reference_Range}{string, Normal or therapeutic range for this value.}
#'  \item{Toxic_Range}{string, Reference range of values defined as being toxic to the patient.}
#'  \item{Specimen_Type}{string, Type of specimen collected to perform the test.}
#'  \item{Specimen_Text}{string, Free-text information about the specimen, its collection or its integrity.}
#'  \item{Correction_Flag}{string, Free-text information about any changes made to the results.}
#'  \item{Test_Status}{string, Flag which indicates whether the procedure is pending or complete.}
#'  \item{Ordering_Doc_Name}{string, Name of the ordering physician.}
#'  \item{Accession}{string, Internal tracking number assigned to the specimen for identification in the lab.}
#'  \item{Source}{string, Database source, either CDR (Clinical Data Repository) or RPDR (internal RPDR database).}
#'  }
#'
#' @encoding UTF-8

NULL
