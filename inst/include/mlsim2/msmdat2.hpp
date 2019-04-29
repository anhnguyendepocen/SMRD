#ifndef SMRD_msmdat2_H
#define SMRD_msmdat2_H
void msmdat2(Rcpp::NumericVector &theta,
             int &nparm,
             Rcpp::IntegerVector &nsamsz,
             Rcpp::NumericVector &centim,
             int &kdist,
             Rcpp::NumericMatrix &x,
             Rcpp::NumericMatrix &y,
             Rcpp::IntegerVector &cen,
             Rcpp::IntegerVector &wt,
             int &nrow,
             int &nter,
             int &ny,
             int &nty,
             Rcpp::NumericMatrix &ty,
             Rcpp::IntegerVector &tcodes,
             Rcpp::IntegerVector &krfail,
             int &ngroup,
             int &nrownw,
             double &prdelt,
             int &kpredt,
             int &iersim);
#endif
