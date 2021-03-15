#' @name data_con_raw
#'
#' @title Example of con.txt output from RPDR.
#'
#' @description A con.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_con_raw
#'
#' @format data.table
#'
#' @return data table, imported from con.txt
#' \describe{
#'  \item{EMPI}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MRN_Type}{string, Indicates the institution associated with a specific MRN. This can appear as a comma-delimited list if MRNs from multiple Partners Health System institutions are available.}
#'  \item{MRN}{string, Unique Medical Record Number for the site identified in the 'MRN_Type' field. This can appear as a comma-delimited list if multiple MRNs from Partners hospitals are available.}
#'  \item{Last_Name}{string, Patient's last name.}
#'  \item{First_Name}{string, Patient's first name.}
#'  \item{Middle_Name}{string, Patient's middle name or initial.}
#'  \item{Direct_Contact_Consent}{boolean, Indicates whether the patient has given permission to contact them directly through the RODY program.}
#'  \item{Address1}{string, Patient's current address.}
#'  \item{Address2}{string, Additional address information.}
#'  \item{City}{string, City of residence.}
#'  \item{State}{string, State of residence.}
#'  \item{Zip}{numeric, Mailing zip code of primary residence from con datasource.}
#'  \item{Country}{string, Country of residence from con datasource.}
#'  \item{Home_Phone}{number, Patient's home phone number.}
#'  \item{Day_Phone}{number, Phone number where the patient can be reached during the day.}
#'  \item{SSN}{string, Social Security Number.}
#'  \item{VIP}{character, Special patient statuses as defined by the EMPI group.}
#'  \item{Previous_Name}{string, Any alternate names on record for this patient.}
#'  \item{Patient_ID_List}{string, Comma-delimited list of all hospital-specific identifiers on record for this patient.}
#'  \item{Insurance_1}{string, Patient's primary health insurance carrier and subscriber ID information.}
#'  \item{Insurance_2}{string, Patient's secondary health insurance carrier and subscriber ID information.}
#'  \item{Insurance_3}{string, Patient's tertiary health insurance carrier and subscriber ID information.}
#'  \item{Primary_Care_Physician}{string, Comma-delimited list of all primary care providers on record for this patient per institution, along with contact information (if available).}
#'  \item{Resident_Primary_Care_Physician}{string, Comma-delimited list of any Resident primary care providers on record for this patient per institution, along with contact information (if available).}
#'  }
#'
#' @encoding UTF-8

NULL
