pegeng_test <- function(q = 1, 
                        mu = 1.5, 
                        sigma = 0.5, 
                        delta = 1,
                        old_way = T) {
  
  library(smrdfortran)
  
  q <- logb(q)
  distribution = "dummy"
  smalldelta = 1e-04 
  
  distdummy <- distribution
  maxlen <- max(length(q), length(mu), length(delta), length(sigma))
  q     <- smrdfortran:::expand.vec(q, maxlen)
  mu    <- smrdfortran:::expand.vec(mu, maxlen)
  delta <- smrdfortran:::expand.vec(delta, maxlen)
  sigma <- smrdfortran:::expand.vec(sigma, maxlen)
  logsigma <- logb(sigma)
  xk <- rep(0, maxlen)
  sqrtxk <- rep(0, maxlen)
  logxk <- rep(0, maxlen)
  lgamxk <- rep(0, maxlen)
  lognormal <- abs(delta) <= smalldelta
  frac <- abs(delta[lognormal])/smalldelta
  
  if(old_way) {
    
    delta[lognormal] <- smalldelta * sign(delta)
    delta[frac < smalldelta] <- smalldelta
    xk <- 1/delta^2
    sqrtxk <- sqrt(xk)
    logxk <- logb(xk)
    lgamxk <- lgamma(xk)
    
  } else {
    
    delta[lognormal] <- 0
    xk[!lognormal] <- 1/delta[!lognormal]^2
    sqrtxk[!lognormal] <- sqrt(xk[!lognormal])
    logxk[!lognormal] <- logb(xk[!lognormal])
    lgamxk[!lognormal] <- lgamma(xk[!lognormal])
    
  }
  gammemat <- rbind(mu, sigma, logsigma, delta, xk, sqrtxk, 
                    logxk, lgamxk)
    old <- .Fortran("spgeng", as.double(q), as.double(gammemat), 
                    as.integer(maxlen), answer = double(maxlen))
    
    new <- SMRD::spgeng(as.double(q), 
                            as.matrix(gammemat), 
                            as.integer(maxlen), 
                            answer = double(maxlen))
    old$answer - new
}

# compare values across many parameter combinations

N = 10
A = array(NA, dim = c(N,N,N))

delta <- seq(-1,1, length.out = N)
mu    <- seq(-1,1, length.out = N)
sigma <- seq( 1,2, length.out = N)

for(i in seq_along(delta)){
  for(j in seq_along(mu)){
    for(k in seq_along(sigma)){
    A[i,j,k] = pegeng_test(q = 2, mu = mu[j], sigma = sigma[k], delta = delta[i])
    }
  }
}
