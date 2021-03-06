% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{fan}
\alias{fan}
\title{Diesel generator fan failures}
\format{
A \code{data.frame} with 37 rows and 3 variables:
\tabular{rlll}{
  [, 1] \tab hours \tab Accumulated time at \code{event} \tab \bold{Numeric}\cr
  [, 2] \tab event \tab Event observed at \code{hours} (failure/right-censored) \tab \bold{Categoric}\cr
  [, 3] \tab count \tab Number of events observed at \code{hours} \tab \bold{Numeric}
  }
}
\source{
Nelson, W. (1982), Applied Life Data Analysis, pg 133, New York, John Wiley & Sons Inc.
}
\description{
Failures in 12 of 70 generator fans were reported at times ranging between 450 hours and 8,750 hours. 
              Of the 58 units that did not fail, the reported running times (i.e., censoring times) ranged between 
              460 and 11,500 hours. Different fans had different running times because units were introduced into 
              service at different times and because their use-rates differed.
}
