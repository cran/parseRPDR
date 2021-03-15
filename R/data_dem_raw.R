#' @name data_dem_raw
#'
#' @title Example of dem.txt output from RPDR.
#'
#' @description A dem.txt output from RPDR loaded into a data table in R using \emph{data.table::fread()}.
#'
#' **NOTE**: Due to potential issues with PHI and PPI, the example datasets can be downloaded from the
#' Partners Gitlab repository under *parserpdr-sample-data*.
#'
#' @docType data
#'
#' @usage data_dem_raw
#'
#' @format data.table
#'
#' @return data table, imported from dem.txt
#' \describe{
#'  \item{EMPI}{numeric, Unique Partners-wide identifier assigned to the patient used to consolidate patient information.}
#'  \item{EPIC_PMRN}{numeric, Epic medical record number. This value is unique across Epic instances within the Partners network.}
#'  \item{MRN_Type}{string, Indicates the institution associated with a specific MRN. This can appear as a comma-delimited list if MRNs from multiple Partners Health System institutions are available.}
#'  \item{MRN}{string, Unique Medical Record Number for the site identified in the 'MRN_Type' field. This can appear as a comma-delimited list if multiple MRNs from Partners hospitals are available.}
#'  \item{Gender}{string, Patient's legal sex.}
#'  \item{Date_of_Birth}{string, Patient's date of birth.}
#'  \item{Age}{string, Patient's current age (or age at death).}
#'  \item{Language}{string, Patient's preferred spoken language.}
#'  \item{Race}{string, Patient's primary race.}
#'  \item{Marital_status}{string, Patient's current marital status.}
#'  \item{Religion}{string, Patient-identified religious preference.}
#'  \item{Is_a_veteran}{string, Patient's current military veteran status.}
#'  \item{Zip_code}{string, Mailing zip code of patient's primary residence from dem datasource.}
#'  \item{Country}{string, Patient's current country of residence from dem datasource.}
#'  \item{Vital_status}{string, Identifies if the patient is living or deceased.
#'  This data is updated monthly from the Partners registration system and the Social Security Death Master Index.}
#'  \item{Date_Of_Death}{string, Recorded date of death from source in 'Vital_Status'.
#'  Date of death information obtained solely from the Social Security Death Index will not be reported until 3 years after death due to privacy concerns.
#'  If the value is independently documented by a Partners entity within the 3 year window then the date will be displayed.}
#'}
#'
#' @encoding UTF-8

NULL
