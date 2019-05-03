#include <base/base.hpp>
#include <genmax/rgami.hpp>

using namespace genx03;
using namespace genx20;
using namespace genx21;

//' get the gamme vector ready to send to the distribution level
//' we are inside all summations here
//' this is important**************
//' 
//'   gamme description                       action wrt summation
//' nterg     nxg      type                inside                 outside
//' -----------------------------------------------------------------------
//'  1        0     constant           copy from gamms        compute below
//' >0       >0     real regr          compute below          compute below
//'  0        0     derived const.     copy from gamms        picked up above
//'  0       >0     derived regr.      picked up above        picked up above

void rgamme(int &kpnow,
            Rcpp::NumericVector &thetas,
            Rcpp::NumericVector &gamme){

Rcpp::IntegerVector xcols;
// Iterate over all parameters and functions of parameters
   for(int igam = 1; igam <= genx03::g_ngame; igam++){
      
       // If the parameter does not depend on any explanatory
       // variables, skip and get saved value from gamms
          if(genx20::nxg.at(igam - 1) != 0) {
          
             // If the 'parameter' is a direct function, it is already in place so skip
                if(genx20::nterg.at(igam - 1) == 0) continue;
                
             // Otherwise take relationship info below to get the values from exp vars
                SEXP x = genx20::ipxcg[igam - 1];
                Rcpp::IntegerVector xcols(x);
                
                if(debug::kprint >= 5){
                   
                   Rcpp::Rcout << "\nRGAMME BEFORE RGAMI\n" << std::endl;
                   Rcpp::Rcout << "kpnow = " << kpnow << std::endl;
                   Rcpp::Rcout << "igam = " << igam << std::endl;
                   Rcpp::Rcout << "nxg.at(igam) = " << genx20::nxg.at(igam - 1) << std::endl;
                   Rcpp::Rcout << "nterg.at(igam) = " << genx20::nterg.at(igam - 1) << std::endl;
                   Rcpp::Rcout << "intg.at(igam) = " << genx20::intg.at(igam - 1) << std::endl;
                   Rcpp::Rcout << "xcols = " << xcols << std::endl;
                   Rcpp::Rcout << "ipthet.at(igam) = " << genx21::ipthet.at(igam - 1) << std::endl;
                   Rcpp::Rcout << "igtyg.at(igam) = " << genx21::igtyg.at(igam - 1) << std::endl;
                   Rcpp::Rcout << "irelag.at(igam) = " << genx21::irelag.at(igam - 1) << std::endl;
                   Rcpp::Rcout << "thetas = " << thetas << std::endl;
                   Rcpp::Rcout << "gamme = " << gamme << std::endl;
                   
                }
                
                Rcpp::IntegerVector NXG = clone(genx20::nxg);
                Rcpp::IntegerVector INTG = clone(genx20::intg);
                Rcpp::IntegerVector NTERG = clone(genx20::nterg);
                Rcpp::IntegerVector IGTYG = clone(genx21::igtyg);
                Rcpp::IntegerVector IPTHET = clone(genx21::ipthet);
                Rcpp::NumericVector IPSD = clone(genx05::g_ipsd);
                Rcpp::IntegerVector IRELAG = clone(genx21::irelag);

                rgami(kpnow,igam,NXG.at(igam - 1),NTERG.at(igam - 1),
                      INTG.at(igam - 1),xcols,IPTHET.at(igam - 1),
                      IGTYG.at(igam - 1),IRELAG.at(igam - 1),thetas,gamme);
                
                genx20::nxg = clone(NXG);
                genx20::intg = clone(INTG);
                genx20::nterg = clone(NTERG);
                genx21::igtyg = clone(IGTYG);
                genx21::ipthet = clone(IPTHET);
                genx05::g_ipsd = clone(IPSD);
                genx21::irelag = clone(IRELAG);
                
                continue;
          
          }
          
          gamme.at(igam - 1) = genx21::gamms.at(igam - 1);
         
   }
   
   if(debug::kprint >= 7){
      
      Rcpp::Rcout << "\nRGAMME**7**\n"   << std::endl;
      Rcpp::Rcout << "kpnow = " << kpnow << std::endl;
      Rcpp::Rcout << "gamme = " << gamme << std::endl;
      
      
   }
   
return;

}
