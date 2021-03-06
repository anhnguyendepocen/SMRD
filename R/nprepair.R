nprepair <-
function (data.rd,
          debug1 = F, 
          sort.id = F) 
{
    the.censor.codes <- censor.codes(data.rd)
    the.case.weights <- case.weights(data.rd)
    theResponse <-Response(data.rd)
    fail.times <- theResponse[the.censor.codes == 1, 1]
    censor.time <- theResponse[the.censor.codes == 2, 1]
    number.cases <- nrow(theResponse)
    utime <- sort(unique(theResponse))
    itime <- match(theResponse, utime)
    nobs <- length(the.censor.codes)
    if (is.null(data.rd$unit)) data.rd$unit <- matrix(1, ncol = 1, nrow = nobs)
    test.numeric <- as.numeric.nocheck(unique(data.rd$unit))
    
    `if`(any(is.na(test.numeric)),
         Unit <- as.factor(data.rd$unit),
         Unit <- as.numeric(data.rd$unit))
    
    `if`(sort.id,
         iusys <- sort(unique(Unit)),
         iusys <- unique(Unit))
    
    isys <- match(Unit, iusys)
    nfailt <- length(utime)
    nsys <- length(iusys)
    if (debug1) browser()
    
    zout <- NPSYS(as.integer(itime), 
                  as.integer(isys), 
                  as.integer(the.censor.codes), 
                  as.double(the.case.weights), 
                  as.integer(nobs), 
                  as.integer(nfailt), 
                  as.integer(nsys), 
                  as.double(utime), 
                  as.integer(iusys),
                  ctime = double(nsys), 
                  dead = matrix(0, nrow = nfailt, ncol = nsys),
                  idelta = matrix(0L, nrow = nfailt, ncol = nsys), 
                  dsum = double(nfailt), 
                  idlsum = integer(nfailt),
                  dbar = double(nfailt), 
                  varsum = double(nsys), 
                  xmuhat = double(nfailt), 
                  varxmu = double(nfailt))
    
    fail.at <- zout$numvec$dsum > 0
    the.list <- list(utime = utime[fail.at], 
                     iusys = iusys, 
                     xmuhat = zout$xmuhat[fail.at], 
                     varxmu = zout$varxmu[fail.at], 
                     dead = matrix(zout$numvec$dead, ncol = nsys, dimnames = list(utime, iusys))[fail.at,], 
                     idelta = matrix(zout$intvec$idelta, ncol = nsys, dimnames = list(utime, iusys))[fail.at, , drop = F], 
                     ctime = zout$numvec$ctime, 
                     data.rd = data.rd)
    
    oldClass(the.list) <- "nprepair.out"
    invisible(the.list)
    
}
