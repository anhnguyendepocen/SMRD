#ifndef SMRD_wqm_varcov_H
#define SMRD_wqm_varcov_H
void wqm_varcov(Rcpp::NumericMatrix &xnew,
                Rcpp::NumericMatrix &y,
                Rcpp::IntegerVector &cen,
                Rcpp::IntegerVector &wt,
                int &nty,
                Rcpp::NumericMatrix &ty,
                Rcpp::IntegerVector &tcodes,
                int &nrow,
                int &nter,
                int &ny,
                int &kdist,
                Rcpp::NumericVector &thetg,
                Rcpp::NumericVector &fsderd,
                Rcpp::LogicalVector &lfix,
                int &nparm,
                double &upcen,
                Rcpp::NumericMatrix &vcvg,
                Rcpp::NumericVector &dscrat,
                Rcpp::IntegerVector &iscrat,
                int &ier,
                Rcpp::NumericVector &ivd,
                Rcpp::NumericMatrix &ivcvd,
                Rcpp::NumericMatrix &ivcvdd,
                Rcpp::IntegerVector &iir,
                Rcpp::IntegerVector &ijc);
#endif
