% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TestWindow.R
\name{TestWindow}
\alias{TestWindow}
\title{Title}
\usage{
TestWindow(ID, time, event, count)
}
\arguments{
\item{ID}{}

\item{time}{}

\item{event}{}

\item{count}{}
}
\description{
Title
}
\examples{
\dontrun{

halfbeak.rdu <- frame.to.rdu(halfbeak,
                             ID.column = "unit", 
                             time.column = "hours" ,
                             event.column = "event", 
                             data.title = "Halfbeak Data", 
                             time.units = "Thousands of Hours of Operation")

summary(halfbeak.rdu)
event.plot(halfbeak.rdu)
print(mcf(halfbeak.rdu))
mcf.plot(halfbeak.rdu)
interarrival.times(halfbeak.rdu)
mcf.plot(halfbeak.rdu,
         xlab = "Thousands of Hours of Operation",
         ylab = "Cumulative Number of Maintenance Actions")

## Halfbeak additional plots

interarrival.plot(halfbeak.rdu,
                  xlab = "Thousands of Hours of Operation",
                  ylab = "Thousands of Hours Between Maintenance Actions",
                  my.title="")

ar1.plot(halfbeak.rdu,
         xlab = "Lagged Thousands of Hours Between Maintenance Actions",
         ylab = "Thousands of Hours Between Maintenance Actions")

ar1.plot(halfbeak.rdu,
         xlab = "Lagged Thousands of Hours Between Maintenance Actions",
         ylab = "Thousands of Hours Between Maintenance Actions",
         plot.acf = T)

fit.power.and.loglin.process(halfbeak.rdu,
                             xlab = "Thousands of Hours of Operation",
                             ylab = "Cumulative Number of Maintenance Actions")

repair.tsplot(halfbeak.rdu)
interarrival.plot(halfbeak.rdu)
ar1.plot(halfbeak.rdu)

renewal.plots(halfbeak.rdu)
laplace.test(halfbeak.rdu)
lewis.robinson.test(halfbeak.rdu)
milhbk189.test(halfbeak.rdu)

PlotMCFandNHPP(halfbeak.rdu, form = "power rule")
PlotMCFandNHPP(halfbeak.rdu, form = "log linear")

fit.power.process(halfbeak.rdu)
fit.loglin.process(halfbeak.rdu)
fit.power.and.loglin.process(halfbeak.rdu)

TestWindow(halfbeak[[1]],halfbeak[[2]],halfbeak[[3]],NULL)


}
}
