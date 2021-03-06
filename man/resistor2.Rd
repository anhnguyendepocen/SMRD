% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{resistor2}
\alias{resistor2}
\title{Carbon-Film Resistor Accelerated Degradation Test}
\format{
A \code{data.frame} with 145 rows and 4 variables:
\tabular{rlll}{
  [, 1] \tab resistor \tab Resistor type \tab \bold{Categoric}\cr
  [, 2] \tab celsius \tab Temperature applied to the resistor  \tab \bold{Numeric}\cr
  [, 3] \tab hours \tab Accumulated time when \code{resistance} was measured \tab \bold{Numeric}\cr
  [, 4] \tab resistance \tab Resistance (ohms) observed \tab \bold{Numeric}
   }
}
\source{
Shiomi, H., and Yanagisawa, T. (1979), 
        On distribution parameter during accelerated life test for a carbon film resistor, 
        Bulletin of the Electrotechnical Laboratory, \bold{43}, 330-345 (in Japanese).

Suzuki, K., Maki, K., and Yokogawa, S. (1993), 
        An analysis of degradation data of a carbon film and properties of the estimators, 
        in Statistical Sciences and Data Analysis, 501-511. K. Matusita, M. Puri, and T. Hayakawa, Editors.
        Utrecht, Netherlands: VSP.
}
\description{
Samples of carbon-film resistors were tested at each of three levels of temperature. At the standard 
             operating temperature of 50^{o} C, carbon-film resistors will slowly degrade. Changes in resistance 
             can cause reduced product performance or even cause system failures.  The test was run at high levels 
             of temperature to accelerate the chemical degradation process and obtain degradation data more quickly.
             
             The \code{\link{resistor}} dataset presents the percent change in resistance measured throughout the test, 
             while this dataset presents the absolute value of resistance measure during the test.
}
\seealso{
\code{\link{resistor}}
}
