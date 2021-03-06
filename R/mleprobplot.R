#' Title
#'
#' @param data.ld 
#' @param distribution 
#' @param gamthr 
#' @param xlab 
#' @param xlim 
#' @param ylim 
#' @param time.range 
#' @param conf.level 
#' @param my.title 
#' @param cex 
#' @param cex.labs 
#' @param cex.axis 
#' @param sub.title 
#' @param grids 
#' @param linear.axes 
#' @param slope.axis 
#' @param title.option 
#' @param ylab 
#' @param trunc.correct 
#' @param add 
#' @param cex.points 
#' @param theta.start 
#' @param parameter.fixed 
#' @param plot.censored.ticks 
#' @param pch 
#' @param print.parameters 
#' @param band.type 
#' @param debug1 
#' @param lwd.ci 
#' @param lwd.fhat 
#' @param band.method 
#' @param mono.tran 
#' @param title.line.adj 
#' @param param.loc 
#' @param ... 
#'
#' @return NULL
#' @export
#'
#' @examples
#' \dontrun{
#' 
#' ShockAbsorber.ld <- frame.to.ld(shockabsorber,
#'                                 response.column = 1,
#'                                 failure.mode.column = 2,
#'                                 censor.column = 3, 
#'                                 time.units = "Kilometers")
#' summary(ShockAbsorber.ld)
#' event.plot(ShockAbsorber.ld)
#' 
#' # Split out by failure mode
#' 
#' mleprobplot(ShockAbsorber.ld, 
#'             distribution = "Weibull")
#' 
#' mfmi.mleprobplot(ShockAbsorber.ld, 
#'                  distribution = "Weibull")
#' 
#' mfmc.mleprobplot(ShockAbsorber.ld, 
#'                  distribution = "Weibull")
#'                  
#' ShockAbsorber.mfld <- mfm.to.ld(ShockAbsorber.ld)
#' 
#' multiple.mleprobplot(ShockAbsorber.mfld,
#'                      data.ld.name="xx",
#'                      xlab="yy",
#'                      distribution="Weibull")
#' 
#' mleprobplot(ShockAbsorber.Mode1.ld, 
#'             distribution = "Weibull")
#' 
#' mleprobplot(ShockAbsorber.Mode2.ld,
#'             distribution = "Weibull")
#' 
#' get.time.vector(ShockAbsorber.Mode2.ld)
#' }
mleprobplot <-
function (data.ld,
          distribution,
          gamthr = 0,
          xlab = NULL,
          xlim = c(NA, NA),
          ylim = c(NA, NA),
          time.range = c(NA, NA),
          conf.level = GetSMRDDefault("SMRD.ConfLevel")/100,
          my.title = NULL,
          cex = 1,
          cex.labs = 1.1,
          cex.axis = 1.1,
          sub.title = NULL,
          grids = F,
          linear.axes = F,
          slope.axis = F,
          title.option = GetSMRDDefault("SMRD.TitleOption"),
          ylab = GetSMRDDefault("SMRD.LabelOnYaxis"),
          trunc.correct = T,
          add = F,
          cex.points = 1.2,
          theta.start = c(NA, NA),
          parameter.fixed = NULL,
          plot.censored.ticks = F,
          pch = 16,
          print.parameters = T,
          band.type = "p",
          debug1 = F,
          lwd.ci = 3,
          lwd.fhat = 2,
          band.method = GetSMRDDefault("SMRD.ConfidenceBandMethod"),
          mono.tran = T,
          title.line.adj,
          param.loc = "bottomright",...)
{
    if (missing(title.line.adj)) { title.line.adj = -3 }
  
    if (is.null(xlab)) {
      
        xlab <- get.time.units(data.ld)
        if (!is.null(gamthr) && gamthr != 0)
            xlab <- paste(xlab, "-", gamthr)
    }
  
    cdfest.out <- cdfest(data.ld, gamthr = gamthr)
    cdpoints.out <- cdpoints(cdfest.out)
    
    if(is.logdist(distribution)) {
      
       if(any(Response(data.ld) <= 0)) stop("log-distribution specified but nonpositive response(s) in your life data object.")
      
    }
    
    mlest.out <- mlest(data.ld, 
                               distribution, 
                               theta.start = theta.start,
                               parameter.fixed = parameter.fixed, 
                               gamthr = gamthr, ...)
    
    trunc.correct <- (!is.null(cdfest.out$left.trun.cond) || !is.null(cdfest.out$right.trun.cond)) && trunc.correct
    
    if(trunc.correct) {
      
       cdpoints.out <- truncadj(cdpoints.out, mlest.out, debug1 = debug1)
       
    }
    trunc.correct.string <- attr(cdpoints.out, "trunc.correct.string")
    ybandrange <- NULL
    xtvna <- is.na(time.range)
    if (any(xtvna)) time.range[xtvna] <- range(cdpoints.out$yplot)[xtvna]
    
    if (map.SMRDDebugLevel() >= 4) {
      
        cat("Band method is", band.method, "band type is", band.type,
            "Confidence level=", conf.level, "\n")
      
    }
    switch(band.method, logit.cdf.method = {
        bands <- get.parametric.bands(mlest.out, 
                                      conf.level = conf.level,
                                      xlim = time.range, 
                                      mono.tran = mono.tran)
        xbandrange <- NULL
        ybandrange <- range(strip.na(bands$lower), strip.na(bands$upper))
    }, zhat.cdf.method = {
        bands <- get.parametric.bands.zhat(mlest.out, 
                                           conf.level = conf.level,
                                           xlim = time.range, 
                                           mono.tran = mono.tran)
        xbandrange <- NULL
        ybandrange <- range(strip.na(bands$lower), strip.na(bands$upper))
    }, log.quantile.method = {
        bands <- get.parametric.bands.quant(mlest.out, 
                                            conf.level = conf.level,
                                            xlim = time.range)
        ybandrange <- NULL
        xbandrange <- range(strip.na(bands$lower), strip.na(bands$upper))
    }, {
        stop(paste(band.method, "Not recognized"))
    })
    
    if (any(is.na(ybandrange))) ybandrange <- NULL
    xrna <- is.na(xlim) 
    if (any(xrna)) xlim[xrna] <- range(xbandrange, time.range, cdpoints.out$yplot)[xrna]
    yrna <- is.na(ylim)
    if (any(yrna)) ylim[yrna] <- range(cdpoints.out$pplot, ybandrange)[yrna]
    
    `if`(band.type != "n",
         conf.int.title <- paste("and Pointwise", paste(floor(conf.level * 100 + 0.01), "%", sep = ""), "Confidence Intervals"),
         conf.int.title <- "")
    
    if (is.null(my.title)) {
      
        my.title <- paste(get.data.title(data.ld), 
                          "\n", "with",
                          distribution, 
                          "ML Estimate ", 
                          conf.int.title, 
                          trunc.correct.string)
        
    }
    
    if(!missing(gamthr) && is.null(sub.title)) {
      
       `if`(is.postsctiptok(),
            { sub.title <- paste("~f13~.g~f3~. = ", format(gamthr),"~", sep = "") ; cex <- 1.2 },
              sub.title <- paste("shift gamma = ", format(gamthr)))
        
     } else {
    
       if (is.null(sub.title)) sub.title <- ""
        
     }
    
    if(!add) {
      
       log.of.data <- probplot.setup(distribution, 
                                     range(xlim),
                                     ylim, 
                                     my.title = my.title, 
                                     sub.title = sub.title,
                                     cex = cex, 
                                     cex.labs = cex.labs, 
                                     grids = grids, 
                                     linear.axes = linear.axes,
                                     title.option = title.option, 
                                     slope.axis = slope.axis,
                                     ylab = ylab, 
                                     xlab = xlab, 
                                     title.line.adj = title.line.adj,...)
        
     } else {
    
       log.of.data <- get.prob.scales(distribution, 
                                      shape = NULL,
                                      prob.range = ylim)$logger
       
     }
    
     plot.nonparametric.estimate(x = cdfest.out, 
                                         cdpoints.out, 
                                         distribution,
                                         log.of.data, 
                                         how.show.fhat = "points", 
                                         shape = NULL,
                                         point.cex = cex.points, 
                                         pch = pch, 
                                         point.pch = pch, 
                                         xlim,
                                         cex.axis = cex.axis, 
                                         cex.lab = cex.labs)
     
    bands.over <- bands$bands.over
    times <- bands$times
    fhat <- bands$fhat
    
    if(!is.null(fhat)) {
      
       lines(pp.data(times[bands.over], log.of.data), 
             pp.quant(fhat, distribution)[bands.over], 
             col = "black", lwd = lwd.fhat)
      
    }
    
    switch(band.method, 
           zhat.cdf.method = , logit.cdf.method = {
             
           if(band.type != "n" && !is.null(ybandrange)) {
             
              plot.bands(bands, 
                                 distribution = distribution, 
                                 log.of.data = log.of.data,
                                 lwd.ci = lwd.ci, 
                                 lwd.fhat = lwd.fhat)
             
           }
             
        }, log.quantile.method = {
          
           if(band.type != "n" && !is.null(xbandrange)) {
             
              plot.bands.quantile(bands, 
                                  distribution = distribution,
                                  log.of.data = log.of.data, 
                                  lwd.ci = lwd.ci, 
                                  lwd.fhat = lwd.fhat,
                                  mono.tran = mono.tran)
             
           }
          
        }, { stop(paste(band.method, "not recognized"))
          
        })
    
    f.plot.censored.ticks(data.ld, log.of.data, plot.censored.ticks)
    f.print.parameters(mlest.out, print.parameters, param.loc = param.loc)
}
