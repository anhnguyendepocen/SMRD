% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/censored.data.plot.R
\name{censored.data.plot}
\alias{censored.data.plot}
\title{Plot failures and censored observations as a function of the response}
\usage{
censored.data.plot(
  data.ld,
  explan.var = 1,
  ylim = c(NA, NA),
  xlim = c(NA, NA),
  x.axis = "linear",
  y.axis = "linear",
  my.title = NULL,
  ylab = get.time.units(data.ld),
  xlab = NULL,
  cex = par()$cex,
  cex.labs = par()$cex.lab,
  cex.points = 1.2,
  add = F,
  grids = F,
  title.option = GetSMRDDefault("SMRD.TitleOption"),
  response.on.yaxis = T
)
}
\arguments{
\item{data.ld}{Name (as a character string) of a \code{life.data} object created using the function \code{frame.to.ld}}

\item{explan.var}{numeric(\code{1})

   Explanatory variable to be plotted versus the responses.  Value cannot be greater that the number \code{x.columns} defined in \code{data.ld}.
   Setting \code{explan.var = 1} selects the \code{x.column} with the lowest number, regardless of the order in which the \code{x.columns} were defined in \code{frame.to.ld}.  For example, \code{data.ld} can have argument \code{x.columns = c(4,5,6)} or \code{x.columns = c(6,5,4)}.  For either case, \code{explan.var = 1} selects \code{x.column = 4} since this is the smallest value.
   Note, \code{explan.var} may also be defined using a character string matching the name of column}

\item{ylim}{numeric(\code{c(NA, NA)})

   \bold{(optional)} Range of plotting values for the y-axis.  If left blank, values will be chosen based on the information in \code{data.ld}}

\item{xlim}{numeric(\code{c(NA, NA)})

   \bold{(optional)} Range of plotting values for the x-axis.  If left blank, values will be chosen based on the information in \code{data.ld}}

\item{x.axis}{character(\code{"linear"}) 

   Transformation applied to the values defined along the x-axis.  See \code{.generic.relationship.name} for the list of transformation relationships that can be used}

\item{y.axis}{character(\code{"linear"}) 

   Transformation applied to the values defined along the x-axis.  See \code{.generic.relationship.name} for the list of transformation relationships that can be used.}

\item{my.title}{character(\code{NULL})

   Title to be displayed above the plot}

\item{ylab}{character(\code{get.time.units(data.ld)})

   \bold{(optional)} Title of the y-axis. If left blank, the value of the \code{time.units} argument defined in \code{data.ld} will be used.  If no \code{time.units} were defined when \code{data.ld} was created, \code{'Hours'} is used as the default}

\item{xlab}{character(\code{NULL})

   \bold{(optional)} Title of the x-axis.  If left blank, the column name in \code{data.ld} corresponding the argument \code{explan.var} is used.}

\item{cex}{numeric(\code{par()$cex})}

\item{cex.labs}{numeric(\code{par()$cex.lab})}

\item{cex.points}{numeric(\code{1.2})

   Scaling value for size of the points to be plotted}

\item{add}{logical(\code{FALSE}) 

   If \code{TRUE} plotting is suppressed to allow for the addition of more graphical features}

\item{grids}{logical(\code{FALSE})

   If \code{TRUE}, gridlines are provided on the plot}

\item{title.option}{character(\code{GetSMRDDefault("SMRD.TitleOption")})

   \bold{(optional)} Produces a title above the plot using the SMRD default title format}

\item{response.on.yaxis}{character(\code{TRUE})

   If \code{FALSE}, the x and y axes are reversed such that the response values are plotted along the x-axis}
}
\description{
Plot failures and censored observations as a function of the response
}
\examples{
# Create a \code{life.data} object
superalloy.ld <- frame.to.ld(superalloy,
                             response.column = 1, 
                             censor.column = 2,
                             x.columns = c(5,6,4),
                             time.units = "Kilocycles")

summary(superalloy.ld)

censored.data.plot(superalloy.ld, 
                  explan.var = 3)

censored.data.plot(superalloy.ld, 
                  explan.var = 3 ,
                  response.on.yaxis = F)

censored.data.plot(superalloy.ld, 
                  explan.var = 3, 
                  x.axis = "log", 
                  y.axis = "log")

censored.data.plot(superalloy.ld, 
                  explan.var = 3 ,
                  response.on.yaxis = F, 
                  x.axis = "log", 
                  y.axis = "log")
}
\seealso{
\code{\link{frame.to.ld}}
}
\author{
William Q. Meeker, PhD
}
