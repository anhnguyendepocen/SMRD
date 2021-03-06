% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/egeng.mle.R
\name{egeng.mle}
\alias{egeng.mle}
\title{Title}
\usage{
egeng.mle(
  data.ld,
  start.distribution = "Weibull",
  theta.start = NULL,
  debug1 = F
)
}
\arguments{
\item{data.ld}{}

\item{start.distribution}{}

\item{theta.start}{}

\item{debug1}{}
}
\description{
Title
}
\examples{
\dontrun{

at7987.ld <- frame.to.ld(at7987, 
                         response.column = 1,
                         censor.column = 2, 
                         case.weight.column = 3,
                         time.units = "Kilocycles")
                         
at7987.egeng.gmle.out <- egeng.mle(at7987.ld)
}
}
