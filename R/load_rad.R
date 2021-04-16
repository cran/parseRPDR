#' @title Loads radiology notes into R.
#' @export
#'
#' @description Loads radiology notes information into the R environment.
#'
#' @param file string, full file path to Rad.txt.
#' @param merge_id string, column name to use to create \emph{ID_MERGE} column used to merge different datasets. Defaults to \emph{EPIC_PMRN},
#' as it is the preferred MRN in the RPDR system.
#' @param sep string, divider between hospital ID and MRN. Defaults to \emph{:}.
#' @param id_length string, indicating whether to modify MRN length based-on required values \emph{id_length = standard}, or to keep lengths as is \emph{id_length = asis}.
#' If \emph{id_length = standard} then in case of \emph{MGH, BWH, MCL, EMPI and PMRN} the length of the MRNs are corrected accordingly by adding zeros, or removing numeral from the beginning.
#' In other cases the lengths are unchanged. Defaults to \emph{standard}.
#' @param perc numeric, a number between 0-1 indicating which parsed ID columns to keep. Data present in \emph{perc x 100\%} of patients are kept.
#' @param na boolean, whether to remove columns with only NA values. Defaults to \emph{TRUE}.
#' @param identical boolean, whether to remove columns with identical values. Defaults to \emph{TRUE}.
#' @param nThread integer, number of threds to use by data.table for reading data.
#' @param mrn_type boolean, should data in \emph{MRN_Type} and \emph{MRN} be parsed. Defaults to \emph{FALSE}, as it is not advised to parse these for all data sources as it takes considerable time.
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
#'
#' @examples \dontrun{
#' #Using defaults
#' d_rad <- load_rad(file = "test_Rad.txt")
#'
#' #Use sequential processing
#' d_rad <- load_rad(file = "test_Rad.txt", nThread = 1)
#'
#' #Use parallel processing and parse data in MRN_Type and MRN columns and keep all IDs
#' d_rad <- load_rad(file = "test_Rad.txt", nThread = 20, mrn_type = TRUE, perc = 1)
#' }

load_rad <- function(file, merge_id = "EMPI", sep = ":", id_length = "standard", perc = 0.6, na = TRUE, identical = TRUE, nThread = 4, mrn_type = FALSE) {

  #Modify Rad txt to be compatible with data.table
  message("Modifing radiological notes file to be compatible with data.table. Could take considerable time, please be patient!")
  data_raw <- readChar(con = file, nchars = file.info(file)$size) #read as string
  data_raw <- gsub("[\r\n]", " ", data_raw) #Remove carriage returns and new lines

  header_end <- regexpr(pattern = "Report_Text", text = data_raw, fixed = TRUE) #Find head row
  data_raw <- paste0(substr(data_raw, start = 1, stop = header_end+10), "\r\n",
                      substr(data_raw, start = header_end+11, stop = nchar(data_raw))) #Add new line to header row
  data_raw <- gsub(pattern = "[report_end]", replacement = "[report_end]\r\n", x = data_raw,  fixed = TRUE) #Add new line to all other rows

  #Supply modified text to load_base function and continue as other load functions
  DATA <- load_base(file = data_raw, merge_id = merge_id, sep = sep, id_length = id_length, perc = perc, na = na, identical = identical, nThread = nThread, mrn_type = mrn_type, src = "rad")
  raw_id <- which(colnames(DATA) == "EMPI" | colnames(DATA) == "IncomingId")[1]
  data_raw <- DATA[, raw_id:dim(DATA)[2]]
  DATA     <- DATA[, 1:(raw_id-1)]

  #Add additional information
  DATA$time_rad_exam       <- as.POSIXct(data_raw$Report_Date_Time, format = "%m/%d/%Y %I:%M:%S %p")
  DATA$rad_rep_num         <- pretty_text(data_raw$Report_Number, remove_after = FALSE, remove_punc = FALSE, remove_white = FALSE)
  DATA$rad_rep_desc        <- pretty_text(data_raw$Report_Description, remove_after = FALSE, remove_punc = FALSE, remove_white = FALSE)
  DATA$rad_rep_status      <- pretty_text(data_raw$Report_Status, remove_after = FALSE, remove_punc = FALSE, remove_white = FALSE)
  DATA$rad_rep_type        <- pretty_text(data_raw$Report_Type, remove_after = FALSE, remove_punc = FALSE, remove_white = FALSE)
  DATA$rad_rep_txt         <- data_raw$Report_Text

  DATA <- remove_column(dt = DATA, na = na, identical = identical)

  return(DATA)
}
