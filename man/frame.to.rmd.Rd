% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frame.to.rmd.R
\name{frame.to.rmd}
\alias{frame.to.rmd}
\title{Title}
\usage{
frame.to.rmd(
  frame,
  response.column,
  time.column,
  unit.column,
  group.column,
  response.units = NULL,
  unit.name = NULL,
  data.title = NULL,
  time.units = NULL,
  x.columns = NULL,
  xlabel = NULL,
  data.note = "",
  skip = 0
)
}
\arguments{
\item{frame}{}

\item{response.column}{}

\item{time.column}{}

\item{unit.column}{}

\item{group.column}{}

\item{response.units}{}

\item{unit.name}{}

\item{data.title}{}

\item{time.units}{}

\item{x.columns}{}

\item{xlabel}{}

\item{data.note}{}

\item{skip}{}
}
\description{
Title
}
\examples{
\dontrun{

GaAsLaser.rmd <- 
  frame.to.rmd(gaaslaser, 
               response.column = 1, 
               unit.column = 2, 
               time.column = 3, 
               response.units = "Increase in Operating Current (\%)")

summary(GaAsLaser.rmd)
plot(GaAsLaser.rmd)
trellis.plot(GaAsLaser.rmd, order.groups = T)

trellis.plot(GaAsLaser.rmd, order.groups = F)

# Convert to a \code{life.data} object

GaAsLaser.ld <- rmd.to.ld(GaAsLaser.rmd, 
                          fail.level = 10, 
                          x.axis = "sqrt")

plot.rmd.residual(GaAsLaser.ld)

GaAsLaser.ld <- rmd.to.ld(GaAsLaser.rmd,
                          fail.level = 10)

plot.rmd.residual(GaAsLaser.ld)

summary(GaAsLaser.ld)

}
}
