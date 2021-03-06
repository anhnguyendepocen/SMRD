% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resid.probplot.R
\name{resid.probplot}
\alias{resid.probplot}
\title{Title}
\usage{
\method{resid}{probplot}(
  groupm.list,
  xlim = c(NA, NA),
  ylim = c(NA, NA),
  original.par = T,
  my.title = NULL,
  point.cex = 1.2,
  shape = NULL,
  title.option = GetSMRDDefault("SMRD.TitleOption"),
  grids = 0,
  conf.level = GetSMRDDefault("SMRD.ConfLevel")/100,
  band.type = "Simultaneous",
  a.limit = 0.001,
  b.limit = 0.999,
  ...
)
}
\arguments{
\item{groupm.list}{}

\item{xlim}{}

\item{ylim}{}

\item{original.par}{}

\item{my.title}{}

\item{point.cex}{}

\item{shape}{}

\item{title.option}{}

\item{grids}{}

\item{conf.level}{}

\item{band.type}{}

\item{a.limit}{}

\item{b.limit}{}

\item{...}{}
}
\description{
Title
}
\examples{
\dontrun{

ZelenCap.ld <- frame.to.ld(zelencap,
                           response.column = 1,
                           censor.column = 2,
                           case.weight.column = 3,
                           x.columns = c(4, 5),
                           time.units = "Hours")
ZelenCap.groupm.out1 <-
  groupm.mleprobplot(ZelenCap.ld,
                     distribution = "Weibull")

resid.vs.order(ZelenCap.groupm.out1)

resid.vs.fit(ZelenCap.groupm.out1)

resid.vs.explan(ZelenCap.groupm.out1,
                x.to.plot = 1)

resid.vs.explan(ZelenCap.groupm.out1,
                x.to.plot = 2)
                
resid.probplot(ZelenCap.groupm.out1)

}
}
