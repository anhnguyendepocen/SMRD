#ifndef SMRD_wqm_cpoints_H
#define SMRD_wqm_cpoints_H
void wqm_cpoints(Rcpp::NumericMatrix &y,
                 int &ny,
                 Rcpp::IntegerVector &codes,
                 Rcpp::NumericVector &codes2,
                 Rcpp::IntegerVector &weight,
                 Rcpp::NumericVector &weight2,
                 Rcpp::NumericMatrix &ty,
                 int &nty,
                 Rcpp::IntegerVector &tcodes,
                 int &n,
                 int &nstart,
                 Rcpp::NumericVector &dscrat,
                 Rcpp::NumericVector &scrat,
                 Rcpp::IntegerVector &iscrat,
                 int &maxit,
                 double &tol,
                 int &maxmsd,
                 Rcpp::NumericVector &p,
                 Rcpp::NumericVector &q,
                 Rcpp::NumericVector &prob,
                 Rcpp::NumericVector &sd,
                 int &m,
                 double &pchmax,
                 bool &lsd,
                 int &ier,
                 Rcpp::IntegerVector &ilcv,
                 Rcpp::IntegerVector &iucv,
                 Rcpp::IntegerVector &iltv,
                 Rcpp::IntegerVector &iutv,
                 Rcpp::IntegerVector &iorder,
                 Rcpp::NumericVector &xlcen,
                 Rcpp::NumericVector &xrcen,
                 Rcpp::NumericVector &fail,
                 Rcpp::NumericVector &xltru,
                 Rcpp::NumericVector &xrtru,
                 Rcpp::NumericVector &ys,
                 Rcpp::NumericVector &pgrad,
                 Rcpp::NumericVector &s,
                 Rcpp::NumericVector &probd,
                 Rcpp::NumericVector &fscrat);
#endif
