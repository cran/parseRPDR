#' @title Searches diagnosis columns for given diseases.
#' @export
#'
#' @description Analyzes diagnosis data loaded using \emph{load_dia}. Searches diagnosis columns for a specified set of diseases.
#' By default, the data.table is returned with new columns corresponding to boolean values, whether given group of diagnoses are present among the diagnoses.
#' If \emph{collapse} is given, then the information is aggregated based-on the \emph{collapse} column and the earliest of latest time of the given diagnosis is provided.
#'
#'
#' @param d data.table, database containing diagnosis information data loaded using the \emph{load_dia} function.
#' @param code string, column name of the diagnosis code column. Defaults to \emph{dia_code}.
#' @param code_type string, column name of the code_type column. Defaults to \emph{dia_code_type}.
#' @param codes_to_find list, a list of string arrays corresponding to sets of code types and codes separated by \emph{:}, i.e.: "ICD9:250.00".
#' The function searches for the given disease code type and code pair and adds new boolean columns with the name of each list element.
#' These columns are indicators whether any of the disease code type and code pair occurs in the set of codes.
#' @param collapse string, a column name on which to collapse the data.table.
#' Used in case we wish to assess whether given disease codes are present within all the same instances of \emph{collapse}. See vignette for details.
#' @param code_time string, column name of the time column. Defaults to \emph{time_dia}. Used in case collapse is present to provide the earliest or latest instance of diagnosing the given disease.
#' @param aggr_type string, if multiple diagnoses are present within the same case of \emph{collapse}, which timepoint to return. Supported are: "earliest" or "latest". Defaults to \emph{earliest}.
#' @param nThread integer, number of threads to use for parallelization. If it is set to 1, then no parallel backends are created and the function is executed sequentially.
#'
#' @return data.table, with indicator columns whether the any of the given diagnoses are reported.
#' If \emph{collapse} is present, then only unique ID and the summary columns are returned.
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{
#' #Search for Hypertension and Stroke ICD codes
#' diseases <- list(HT = c("ICD10:I10"), Stroke = c("ICD9:434.91", "ICD9:I63.50"))
#' data_dia_parse <- convert_dia(d = data_dia, codes_to_find = diseases, nThread = 2)
#'
#' #Search for Hypertension and Stroke ICD codes and summarize per patient providing earliest time
#' diseases <- list(HT = c("ICD10:I10"), Stroke = c("ICD9:434.91", "ICD9:I63.50"))
#' data_dia_disease <-  convert_dia(d = data_dia, codes_to_find = diseases, nThread = 2,
#' collapse = "ID_MERGE", aggr_type = "earliest")
#' }

convert_dia <- function(d, code = "dia_code", code_type = "dia_code_type",  codes_to_find = NULL,
                        collapse = NULL, code_time = "time_dia", aggr_type = "earliest", nThread = parallel::detectCores()-1) {

  .SD=.N=.I=.GRP=.BY=.EACHI=..=..cols=.SDcols=i=j=time_to_db=..which_ids_to=..which_ids_from=combined=..collapse=. <- NULL

  #Initialize multicore
  if(nThread == 1 | length(codes_to_find) == 1) {
    `%exec%` <- foreach::`%do%`
    future::plan(future::sequential)
  } else {
    if(length(codes_to_find) > 0 & length(codes_to_find) < nThread) {nThread <- length(codes_to_find)}

    if(parallelly::supportsMulticore()) {
      future::plan(future::multicore, workers = nThread)
    } else {
      future::plan(future::multisession, workers = nThread)
    }
    `%exec%` <- doFuture::`%dofuture%`
  }

  #Create combined code colmn
  cols <- c(code_type, code, code_time, collapse)
  comb <- d[, cols, with = FALSE]
  comb[ , combined := do.call(paste, c(.SD, sep = ":")), .SDcols = c(code_type, code)]

  #Find diagnoses if requested
  message(paste0("Finding diagnoses within specified columns."))

  #Find diagnoses per row
  result <- foreach::foreach(i = 1:length(codes_to_find), .combine="cbind",
                             .inorder=TRUE, .options.future = list(chunk.size = 1.0),
                             .errorhandling = c("pass"), .verbose=FALSE) %exec%
    {
      if(is.null(collapse)) {
        diag_coll <- comb[, any(.SD %in% unlist(codes_to_find[i])), .SDcols = "combined", by=1:nrow(comb)]
        diag_coll$nrow <- NULL
        data.table::setnames(diag_coll, "V1", names(codes_to_find[i]))
        diag_coll
      } else {
        comb[, names(codes_to_find[i]) := any(.SD %in% unlist(codes_to_find[i])), .SDcols = "combined", by=1:nrow(comb)]
        ID_dt <- unique(comb[, collapse, with = FALSE]) #Get IDs

        if(aggr_type == "earliest") { #Find time
          diag_coll <- comb[, .(var_time = min(get(code_time))), by=c(collapse, names(codes_to_find[i]))]
        } else {
          diag_coll <- comb[, .(var_time = max(get(code_time))), by=c(collapse, names(codes_to_find[i]))]
        }
        diag_coll <- diag_coll[get(names(codes_to_find[i]))] #Remove negative cases
        diag_coll <- data.table::merge.data.table(ID_dt, diag_coll, by = collapse, all.x = TRUE, all.y = FALSE) #Merge with IDs to get db
        diag_coll[[names(codes_to_find[i])]][is.na(diag_coll[[names(codes_to_find[i])]])] <- FALSE

        data.table::setnames(diag_coll, "var_time", paste0("time_", names(codes_to_find[i])))
        diag_coll
      }
    }
  future::plan(future::sequential)

  if(is.null(collapse)) { #Remove unnecessary info and combine with original data if non-collapse
    result <- cbind(d, result)
  }
  if(!is.null(collapse) & length(codes_to_find)>1) { #Remove unnecessary ID columns if multiple codes_to_find
    result[, seq(4, dim(result)[2], 3)] <- NULL
  }

  future::plan(future::sequential)
  return(result)
}
