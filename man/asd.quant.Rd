% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/asd.quant.R
\name{asd.quant}
\alias{asd.quant}
\title{Return asd quantity}
\usage{
asd.quant(plan.values, n, censor.time, quantile.mark)
}
\arguments{
\item{plan.values}{}

\item{n}{}

\item{censor.time}{}

\item{quantile.mark}{}
}
\value{
variance
}
\description{
Return asd quantity
}
\examples{
\dontrun{
plan.values3 <- get.plan.values("Weibull",
                                prob = c(.2,.12),
                                time = c(1000,500), 
                                time.units = "Hours")

asd.quant(plan.values3, 
          n = 50, 
          censor.time = 1000, 
          quantile.mark = 0.1)

#compare:

asd.quant(plan.values3,
          n = 50, 
          censor.time = 1000, 
          quantile.mark = 0.1)*sqrt(50)

asd.quant(plan.values3,
          n = 500, 
          censor.time = 1000, 
          quantile.mark = 0.1)*sqrt(500)

asd.quant(plan.values3,
          n = 5000, 
          censor.time = 1000, 
          quantile.mark = 0.1)*sqrt(5000)

}
}
\seealso{
code{link{get.plan.values}}
}
