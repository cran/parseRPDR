#' @name data_dem
#'
#' @title Example of processed dem.txt output from RPDR using the load_dem() function.
#'
#' @description Result of a dem.txt output from RPDR loaded into a data table in R using \emph{load_dem()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_dem
#'
#' @format data.table
#'
#' @return data table, with demographic information data.
#' \describe{
#'  \item{ID_MERGE}{numeric, defined IDs by \emph{merge_id}, used for merging later.}
#'  \item{ID_dem_EMPI}{string, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.
#'  from \emph{dem} datasource, corresponds to EMPI in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_dem_PMRN}{string, Epic medical record number. This value is unique across Epic instances within the Partners network.
#'  from \emph{dem} datasource, corresponds to EPIC_PMRN in RPDR. Data is formatted using pretty_mrn().}
#'  \item{ID_dem_loc}{string, if mrn_type == TRUE, then the data in \emph{MRN_Type} and \emph{MRN} are parsed into IDs corresponding to locations. Data is formatted using pretty_mrn().}
#'  \item{gender}{string, Patient's legal sex, corresponds to Gender in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{time_date_of_birth}{POSIXct, Patient's date of birth, corresponds to Date_of_Birth in RPDR. Converted to POSIXct format.}
#'  \item{age}{string, Patient's current age (or age at death), corresponds to Age in RPDR.}
#'  \item{language}{string, Patient's preferred spoken language, corresponds to Language in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{race}{string, Patient's primary race, corresponds to Race in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{marital}{string, Patient's current marital status, corresponds to Marital_Status in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{religion}{string, Patient-identified religious preference, corresponds to Religion in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{veteran}{string, Patient's current military veteran status, corresponds to Is_a_veteran in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{country_dem}{string, Patient's current country of residence from dem datasource, corresponds to Country in RPDR. Punctuation marks and white spaces are removed.}
#'  \item{zip_dem}{string, Mailing zip code of patient's primary residence from dem datasource, corresponds to Zip_code in RPDR.Formatted to 5 character zip codes.}
#'  \item{vital_status}{string, Identifies if the patient is living or deceased.
#'  This data is updated monthly from the Partners registration system and the Social Security Death Master Index, corresponds to Vital_Status in RPDR. Punctuation marks are removed.}
#'  \item{time_date_of_death}{POSIXct, Recorded date of death from source in 'Vital_Status'.
#'  Date of death information obtained solely from the Social Security Death Index will not be reported until 3 years after death due to privacy concerns.
#'  If the value is independently documented by a Partners entity within the 3 year window then the date will be displayed. corresponds to Date_of_Death in RPDR. Converted to POSIXct format.}
#'}
#'
#' @encoding UTF-8

NULL
