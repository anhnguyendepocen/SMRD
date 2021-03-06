#ifndef smrd_ast3xx_H
#define smrd_ast3xx_H
void ast3xx(int &kmod,
            int &kdist,
            Rcpp::IntegerVector &intd,
            Rcpp::IntegerVector &nxd,
            Rcpp::List &ipxcd,
            Rcpp::IntegerVector &irelad,
            int &npard,
            Rcpp::NumericVector &theta,
            Rcpp::NumericVector &thetas,
            Rcpp::IntegerVector &kodet,
            Rcpp::IntegerVector &ifix,
            int &nparm,
            Rcpp::NumericMatrix &y,
            int &ncoly,
            int &nrownw,
            Rcpp::NumericMatrix &x,
            int &ncolx,
            Rcpp::IntegerVector &codes,
            Rcpp::IntegerVector &pcodes,
            Rcpp::IntegerVector &weight,
            Rcpp::IntegerVector &pweigh,
            Rcpp::NumericMatrix &ty,
            int &ncolty,
            Rcpp::IntegerVector &tc,
            int &kcentr,
            Rcpp::IntegerVector &iplab,
            int &maxit,
            Rcpp::NumericMatrix &vcvs,
            Rcpp::NumericMatrix &vcv,
            Rcpp::NumericMatrix &r,
            int &ier,
            int &nstart,
            int &maxmsd,
            double &tol,
            int &lsd,
            double &pchmax);
#endif