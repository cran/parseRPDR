#' @name data_dia_raw
#'
#' @title Example of dia.txt output from RPDR.
#'
#' @description A dia.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' PPartners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_dia_raw
#'
#' @format data.table
#'
#' @return data table, imported from dia.txt
#' \describe{
#'  \item{EMPI}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MRN_Type}{string, Indicates the institution associated with a specific MRN. This can appear as a comma-delimited list if MRNs from multiple Partners Health System institutions are available.}
#'  \item{MRN}{string, Unique Medical Record Number for the site identified in the 'MRN_Type' field. This can appear as a comma-delimited list if multiple MRNs from Partners hospitals are available.}
#'  \item{Date}{string, Date when the diagnosis was noted.}
#'  \item{Diagnosis_Name}{string, Name of the diagnosis, diagnosis-related group, or phenotype. For more information on available Phenotypes visit https://phenotypes.partners.org/phenotype_list.html.}
#'  \item{Code_type}{string, Standardized classification system or custom grouping associated with the diagnosis code.}
#'  \item{Code}{string, IDiagnosis, diagnosis-related group, or phenotype code.}
#'  \item{Diagnosis_flag}{string, Qualifier for the diagnosis, if any.}
#'  \item{Provider}{string, Provider of record for the encounter where the diagnosis was entered.}
#'  \item{Clinic}{string, Specific department/location where the patient encounter took place.}
#'  \item{Hospital}{numeric, Facility where the encounter occurred.}
#'  \item{Inpatient_Outpatient}{string, Identifies whether the diagnosis was noted during an inpatient or outpatient encounter.}
#'  \item{Encounter_number}{string, Unique identifier of the record/visit. This values includes the source system, hospital, and a unique identifier within the source system.}
#'  }
#'
#' @encoding UTF-8

NULL
