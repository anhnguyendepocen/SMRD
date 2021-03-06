% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/npprobplot.R
\name{npprobplot}
\alias{npprobplot}
\title{Title}
\usage{
npprobplot(
  data.ld,
  distribution,
  shape = NULL,
  xlab = NULL,
  ylab = GetSMRDDefault("SMRD.LabelOnYaxis"),
  xlim = c(NA, NA),
  ylim = c(NA, NA),
  band.type = "Simultaneous",
  conf.level = GetSMRDDefault("SMRD.ConfLevel")/100,
  a.limit = 0.001,
  b.limit = 0.999,
  interactive = T,
  my.title = NULL,
  sub.title = NULL,
  point.cex = 1.2,
  how.show.fhat = "points",
  how.show.interval = "step.fun",
  grids = 0,
  title.option = GetSMRDDefault("SMRD.TitleOption"),
  trunc.correct = T,
  slope.axis = F,
  draw.line = F,
  linear.axes = F,
  add = F,
  pch = 16,
  plot.censored.ticks = F,
  point.pch = 18,
  debug1 = F,
  col.points = 1,
  gamthr = NULL,
  title.line.adj,
  grob,
  ...
)
}
\arguments{
\item{data.ld}{}

\item{distribution}{}

\item{shape}{}

\item{xlab}{}

\item{ylab}{}

\item{xlim}{}

\item{ylim}{}

\item{band.type}{}

\item{conf.level}{}

\item{a.limit}{}

\item{b.limit}{}

\item{interactive}{}

\item{my.title}{}

\item{sub.title}{}

\item{point.cex}{}

\item{how.show.fhat}{}

\item{how.show.interval}{}

\item{grids}{}

\item{title.option}{}

\item{trunc.correct}{}

\item{slope.axis}{}

\item{draw.line}{}

\item{linear.axes}{}

\item{add}{}

\item{pch}{}

\item{plot.censored.ticks}{}

\item{point.pch}{}

\item{debug1}{}

\item{col.points}{}

\item{gamthr}{}

\item{title.line.adj}{}

\item{...}{}
}
\description{
Title
}
\examples{
\dontrun{

doatrun.ld <- frame.to.ld(doatrun,
                          response.column = c(1,2),
                          censor.column = 3, 
                          case.weight.column = 4,
                          truncation.response.column = 5, 
                          truncation.type.column = 6, 
                          data.title = "DOA Truncated Data", 
                          time.units = "Hours")

summary(doatrun.ld)

cdfest(doatrun.ld)

mlest(doatrun.ld,"Weibull")

npprobplot(doatrun.ld,
           distribution = "Weibull")

npprobplot(doatrun.ld,
           distribution = "Weibull",
           trunc.correct = F)

}
}
