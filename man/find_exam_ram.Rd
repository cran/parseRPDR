% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_exam_ram.R
\encoding{UTF-8}
\name{find_exam_ram}
\alias{find_exam_ram}
\title{Find exam data within a given timeframe using parallel CPU computing without shared RAM management.}
\usage{
find_exam_ram(
  d_from,
  d_to,
  d_from_ID = "ID_MERGE",
  d_to_ID = "ID_MERGE",
  d_from_time = "time_rad_exam",
  d_to_time = "time_enc_admit",
  time_diff_name = "timediff_exam_to_db",
  before = TRUE,
  after = TRUE,
  time = 1,
  time_unit = "days",
  multiple = "closest",
  add_column = NULL,
  keep_data = FALSE,
  nThread = parallel::detectCores() - 1
)
}
\description{
Finds all, earliest or closest examination to a given timepoints using parallel computing. A progress bar is also reported in the terminal to show the progress of the computation.
}
\keyword{internal}
