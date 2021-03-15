#' @title Creates a vector of all possible IDs for mi2b2 workbench
#' @export
#'
#' @description Gathers all possible IDs from different input sources to provide a vector of all possible MGH or BWH IDs to be used as a data request for mi2b2 workbench.
#' mi2b2 workbench only works with MGH or BWH IDs, therefore curated IDs, such as PMRN cannot be used. However, as MGH and BWH IDs may change over time,
#' to access all possible images for given patients, a full list of all IDs over time for each patient is needed. For this all possible IDs need to gathered and returned.
#'
#' @param type string, either \emph{"MGH"} or \emph{"BWH"} specifying which IDs to use.
#' @param d_mrn data.table, parsed mrn dataset using the \emph{load_mrn} function.
#' @param d_con data.table, parsed con dataset using the \emph{load_con} function.
#'
#' @return vector, with all MGH or BWH IDs that occur in the con and mrn datasources for all patients. This is required to request mi2b2 workbench allowing access to
#' all possible images of the patients, even if the MGH or BWH changed over time.
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{
#' all_MGH_mrn <- all_ids_mi2b2(type = "MGH", d_mrn = data_mrn, d_con = data_con)
#' }

all_ids_mi2b2 <- function(type = "MGH", d_mrn, d_con) {
  message(paste0("Providing all possible ",  type, " MRNs for mi2b2."))
  if(type == "MGH") {
    out <- c(d_mrn$ID_mrn_INCOMING, d_mrn$ID_mrn_MGH, d_con$ID_con_MGH, d_con$ID_con_MGH_list)
    out <- out[grep("MGH", x = out)]
  }
  if(type == "BWH") {
    out <- c(d_mrn$ID_mrn_INCOMING, d_mrn$ID_mrn_BWH, d_con$ID_con_BWH, d_con$ID_con_BWH_list)
    out <- out[grep("BWH", x = out)]
  }
  out <- unique(out)
  return(out)
}
