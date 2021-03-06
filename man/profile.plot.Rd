% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/profile.plot.R
\name{profile.plot}
\alias{profile.plot}
\title{Title}
\usage{
\method{profile}{plot}(
  fitted,
  profile.title = paste(fitted$subtitle, "\\n", lplot.type, "Likelihood and ",
    percent.conf.level(conf.level), "Confidence Interval", "\\n for", variable.name,
    model.dist.str),
  confidence.interval = T,
  conf.level = GetSMRDDefault("SMRD.ConfLevel")/100,
  xlim = NULL,
  ylim = c(0, 1.05),
  log.axis = F,
  variable.name = fitted$xlab,
  original.par = F,
  add = F,
  lty = 1,
  lwd = 2,
  print.ci = T,
  col = 1,
  plotem = T,
  need.smooth = F,
  approx.plot = F,
  ...
)
}
\arguments{
\item{fitted}{}

\item{profile.title}{}

\item{confidence.interval}{}

\item{conf.level}{}

\item{xlim}{}

\item{ylim}{}

\item{log.axis}{}

\item{variable.name}{}

\item{original.par}{}

\item{add}{}

\item{lty}{}

\item{lwd}{}

\item{print.ci}{}

\item{col}{}

\item{plotem}{}

\item{need.smooth}{}

\item{approx.plot}{}

\item{...}{}
}
\description{
Title
}
\examples{
\dontrun{

lzbearing.ld <- frame.to.ld(lzbearing, 
                            response.column = 1)

gmleprobplot(lzbearing.ld,
             distribution = "egeng",
             xlim = c(10,199),
             ylim = c(.0011,.991),
             compare = c("Weibull","Lognormal","Exponential"))

text(2.4969, -1.31908, "EXP")
text(2.50633, -3.4758, "WEIB")
text(2.34606, -5.75833, "EGENG")
text(2.70432, -6.94453, "LOGNOR")

tmp <- one.dim.profile(bear.egeng.gmle.out,
                       profile.on.list = 3,
                       range.list = list(c(-1,2.0)),
                       size = 50,
                       save.structures = F)


profile.plot(tmp, variable.name = "lambda")
}
}
