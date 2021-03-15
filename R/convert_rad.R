#' @title Extracts information from radiological notes free text.
#' @export
#'
#' @description Analyzes radiological notes loaded using \emph{load_rad}. Extracts information from the free text present in \emph{rad_rep_txt}.
#' An array of string is provided using the \emph{anchors} argument. The function will return as many columns as there are anchor points.
#' Each column will contain the text between the given anchor point and the next following anchor point.
#' This way the free text report is split into corresponding smaller texts. By default, these are the common standard elements of the radiological report,
#' however they may be extended to include sections of interest, i.e. if a given score is reported standardly, then adding this phrase (i.e. "CAD-RADS")
#' would create a column where the text following this statement is returned. After this the resulting columns can be easily cleaned up if needed.
#' Be aware to always include \emph{"report_end"} in the anchors array, to provide the function of the last occurring statement in the report.
#'
#' @param d data.table, database containing radiological notes loaded using the \emph{load_rad} function.
#' @param code string vector, column name containing the results. Defaults to: \emph{"rad_rep_txt"}.
#' @param anchors string array, elements to search for in the text report. Defaults to common standard elements, but may be extended to include additional phrases i.e. "CAD-RADS".
#' @param nThread integer, number of threads to use by \emph{dopar} for parallelization. If it is set to 1, then no parallel backends are created and the function is executed sequentially.
#' On windows machines sockets are used, while on other operating systems fork parallelization is used.
#'
#' @return data.table, with new columns corresponding to elements in \emph{anchors}.
#'
#' @encoding UTF-8
#'
#' @examples \dontrun{
#' #Create columns with specific parts of the radiological report defined by anchors
#' data_rad_parsed <- convert_rad(d = data_rad, nThread = 2)
#' }

convert_rad <- function(d, code = "rad_rep_txt",
                        anchors = c("Exam Code", "Ordering Provider", "HISTORY", "Associated Reports",
                                    "Report Below", "REASON", "REPORT",  "TECHNIQUE", "COMPARISON",
                                    "FINDINGS", "IMPRESSION", "RECOMMENDATION", "SIGNATURES", "report_end"),
                        nThread = 4) {
  .SD=.N=.I=.GRP=.BY=.EACHI=..=..cols=.SDcols=i=j=time_to_db=..which_ids_to=..which_ids_from=..collapse <- NULL

  message(paste0("Extracting information from radiological notes free text."))

  #Initialize multicore
  if(nThread == 1) {
    `%exec%` <- foreach::`%do%`
  } else {
    if(.Platform$OS.type == "windows") {
      cl <- parallel::makeCluster(nThread, outfile = "", type = "PSOCK", methods = FALSE, useXDR = FALSE)
    } else{
      cl <- parallel::makeCluster(nThread, outfile = "", type = "FORK", methods = FALSE, useXDR = FALSE)
    }
    doParallel::registerDoParallel(cl)
    `%exec%` <- foreach::`%dopar%`
  }

  #Find text locations
  d_res <- d[[code]]
  l_loc <- lapply(anchors, function(x) {regexpr(d_res, pattern = x, ignore.case = FALSE)})
  names(l_loc) <- anchors
  d_loc     <- as.data.frame(lapply(l_loc, as.numeric)); d_loc[d_loc == -1] <- NA
  d_length  <- as.data.frame(lapply(l_loc, attr, "match.lengt")); d_length[d_length == -1] <- NA


  #Run parallel on elements of anchors
  result <- foreach::foreach(i = 1:length(anchors), .combine="cbind",
                             .inorder=TRUE,
                             .errorhandling = c("pass"), .verbose=FALSE) %exec%
    {
      from    <- d_loc[[i]] + d_length[[i]] #nchar ID from to use text
      d_dist  <- d_loc - from #find closest anchors
      d_dist[d_dist < 0] <- NA #delete negative instances
      to_id   <- as.numeric(apply(X = d_dist, MARGIN = 1, FUN = which.min)) #which column contains smallest value
      to      <- d_dist[cbind(seq_along(to_id), to_id)] + from #get distance value from given column

      if(length(to) != 0) {
        #Get text
        txt <- substring(d_res, first = from, last  = to-1)
        txt <- trimws(txt, whitespace = "[[:punct:]]") #remove leading and trailing punctuation marks
        txt <- gsub("[[:blank:]]+", " ", txt) #Remove multiple blank spaces
        txt <- trimws(txt) #Remove leading and trailing white
      } else {
        txt <- NULL
      }
      txt
    }

  #Rename columns
  cols <- anchors[-length(anchors)]
  cols <- tolower(cols)
  cols <- gsub("[[:blank:]]", "_", cols)
  cols <- paste0("rad_rep_", cols)
  colnames(result) <- cols

  result <- cbind(d, result)
  if(exists("cl") & nThread>1) {parallel::stopCluster(cl)}
  return(result)
}
