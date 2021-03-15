#' @name data_con
#'
#' @title Example of processed con.txt output from RPDR using the load_con() function.
#'
#' @description Result of a con.txt output from RPDR loaded into a data table in R using \emph{load_con()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_con
#'
#' @format data.table
#'
#' @return data table, with contact information data.
#' \describe{
#'  \item{ID_MERGE}{numeric, defined IDs by \emph{merge_id}, used for merging later.}
#'  \item{ID_con_EMPI}{string, Unique Partners-wide identifier assigned to the patient used to consolidate patient information
#'  from \emph{con} datasource, corresponds to EMPI in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_con_PMRN}{string, Epic medical record number. This value is unique across Epic instances within the Partners network
#'  from \emph{con}datasource, corresponds to EPIC_PMRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_con_loc}{string, if mrn_type == TRUE, then the data in \emph{MRN_Type} and \emph{MRN} are parsed into IDs corresponding to locations. Data is formatted using pretty_mrn().}
#'  \item{ID_con_loc_list}{string, if prevalence of IDs in \emph{Patient_ID_List} > \emph{perc}, then they are included in the output. Data is formatted using pretty_mrn().}
#'  \item{name_last}{string, Patient's last name, corresponds to Last_Name in RPDR.}
#'  \item{name_first}{string, Patient's first name, corresponds to First_Name in RPDR.}
#'  \item{name_middle}{string, Patient's middle name or initial, corresponds to Middle_Name in RPDR.}
#'  \item{name_previous}{string, Any alternate names on record for this patient, corresponds to Previous_Name in RPDR.}
#'  \item{SSN}{string, Social Security Number, corresponds to SSN in RPDR.}
#'  \item{VIP}{character, Special patient statuses as defined by the EMPI group, corresponds to VIP in RPDR.}
#'  \item{address1}{string, Patient's current address, corresponds to address1 in RPDR.}
#'  \item{address2}{string, Additional address information, corresponds to address2 in RPDR.}
#'  \item{city}{string, City of residence, corresponds to City in RPDR.}
#'  \item{state}{string, State of residence, corresponds to State in RPDR.}
#'  \item{country_con}{string, Country of residence from con datasource, corresponds to Country in RPDR. Punctuation marks are removed.}
#'  \item{zip_con}{numeric, Mailing zip code of primary residence from con datasource, corresponds to Zip in RPDR. Formatted to 5 character zip codes.}
#'  \item{direct_contact_consent}{boolean, Indicates whether the patient has given permission to contact them directly through the RODY program, corresponds to Direct_Contact_Consent in RPDR.}
#'  \item{phone_home}{number, Patient's home phone number, corresponds to Home_Phone in RPDR. Formatted to 10 digit phone numbers.}
#'  \item{phone_day}{number, Phone number where the patient can be reached during the day, corresponds to Day_Phone in RPDR. Formatted to 10 digit phone numbers.}
#'  \item{insurance1}{string, Patient's primary health insurance carrier and subscriber ID information, corresponds to Insurance_1 in RPDR. Punctuation marks are removed.}
#'  \item{insurance2}{string, Patient's secondary health insurance carrier and subscriber ID information, if any, corresponds to Insurance_2 in RPDR. Punctuation marks are removed.}
#'  \item{insurance3}{string, Patient's tertiary health insurance carrier and subscriber ID information, if any, corresponds to Insurance_3 in RPDR. Punctuation marks are removed.}
#'  \item{primary_care_physician}{string, Comma-delimited list of all primary care providers on record for this patient per institution, along with contact information (if available),
#'  corresponds to Primary_Care_Physician in RPDR. Punctuation marks are removed.}
#'  \item{primary_care_physician_resident}{string, Comma-delimited list of any Resident primary care providers on record for this patient per institution, along with contact information (if available),
#'  corresponds to Resident _Primary_Care_Physician in RPDR. Punctuation marks are removed.}
#'  }
#'
#' @encoding UTF-8

NULL
