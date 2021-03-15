#' @title Provides progress bar for foreach loops.
#' @keywords internal
#'
#' @description Provides progress bar based-on iteration cycles in foreach loops. Does not work for some reason.
#' In the call of foreach add: .combine=progress_bar(n = nThread, type = "c")
#' https://gist.github.com/kvasilopoulos/d49499ea854541924a8a4cc43a77fed0
#'
#' @param n integer, number of iterations
#'
#' @return progress bar
#'
#' @encoding UTF-8

progress_bar <- function(n, type){
  if(n != 1) {pb <- utils::txtProgressBar(min = 1, max = n, style = 3)}
  count <- 1
  function(...) {
    if(n != 1) {
      count <<- count + length(list(...)) - 1
      utils::setTxtProgressBar(pb, count)
      utils::flush.console()
    } else { #If only one iteration
      utils::setTxtProgressBar(utils::txtProgressBar(min = 1, max = 2, style = 3), 2)
    }
    if(type == "cbind") {
      cbind(...)
    } else if(type == "rbind") {
      rbind(...)
    } else if(type == "c") {
      c(...)
    }
  }
}
