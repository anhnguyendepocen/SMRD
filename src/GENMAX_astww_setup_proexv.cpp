#include <base/base.hpp>
#include <genmax/proex1.hpp>
//#include <genmax/stpexv.hpp>

using namespace genx20;
using namespace genx21;
using namespace genx09;

//' @description Process information on the explanatory variables 
//'              get ..g vectors and save pointers and other important 
//'              info in global variable stored in a namespace.
void proexv(Rcpp::IntegerVector &nxd,
            Rcpp::IntegerVector &intd,
            Rcpp::List &ipxcd,
            Rcpp::IntegerVector &irelad,
            Rcpp::IntegerVector &igtyd,
            Rcpp::IntegerVector &imarkd,
            int &npard,
            int &nregr,
            int &ngamd,
            int &ngame,
            int &nparm,
            Rcpp::IntegerVector &kodet,
            Rcpp::IntegerVector &ifix){

 genx09::kprloc = 0;
 genx09::kscloc = 0;
 genx09::kpwloc = 0;
        
 proex1(nxd,intd,ipxcd,irelad,igtyd,imarkd,npard,
        nregr,
        genx20::nxg,  genx20::nterg, genx20::intg,
        genx20::ipxcg,genx21::irelag,genx21::igtyg,
        genx09::kscloc,genx09::kprloc,genx09::kpwloc,
        genx21::ipthet,ngamd,ngame,
        nparm,kodet,ifix);
 
return;

}

#include <base/base.hpp>
#include <genmax/ptpar.hpp>

//' Takes input data specifying model and relationship and 
//' sets up data structure for computing the likelihood
//' 
//' @param nxd(npard) vector giving number of explanatory variables 
//'        for the ith distribution parameter
//' @param nxg(ngame) same for expanded gamma vector
//' @param intd(npard) vector giving 0 for no intercept and 1 for intercept
//'        for the ith distribution parameter
//' @param intg(ngame) same for expanded gamma vector
//' @param ipxcd(npard) vector of pointers to the stack, pointing to the 
//'        beginning of integer vectors of length nter(iparm) 
//'        giving the cols of x for the ith relationship
//' @param ipxcg(ngame) same for expanded gamma vector
//' @param irelad(npard) vector of codes giving the chosen relationship
//' @param irelag(ngame) same for expanded gamma vector
//' @param ipthet(ngame) pointer to the thetas vector to find the ith 
//'        distribution gamma value or the beginning or the beginning 
//'        of the corresponding beta vector
//' @param igtyd(npard) type of parameter (location,scale,shape,prob)
//' @param igtyg(ngame) same for expanded gamma vector
//' @param imarkd(npard) marker to indicate parameter type 1-loc 2-scale 3-shape 4-pwr
 
void proex1(Rcpp::IntegerVector &nxd,
            Rcpp::IntegerVector &intd,
            Rcpp::List &ipxcd,
            Rcpp::IntegerVector &irelad,
            Rcpp::IntegerVector &igtyd,
            Rcpp::IntegerVector &imarkd,
            int &npard,
            int &nregr,
            Rcpp::IntegerVector &nxg,
            Rcpp::IntegerVector &nterg,
            Rcpp::IntegerVector &intg,
            Rcpp::List &ipxcg,
            Rcpp::IntegerVector &irelag,
            Rcpp::IntegerVector &igtyg,
            int &kscloc,
            int &kprloc,
            int &kpwloc,
            Rcpp::IntegerVector &ipthet,
            int &ngamd,
            int &ngame,
            int &nparm,
            Rcpp::IntegerVector &kodet,
            Rcpp::IntegerVector &ifix){

// initilize the special parameter pointers
   kscloc = 0;
   kprloc = 0;
   kpwloc = 0;
// initilize the parameter counters
   nregr = 0;
   int ignext = 1;
   int itnext = 1;
   
   for(int kdnow = 1; kdnow <= npard; kdnow++){

       ptpar(kdnow,itnext,ignext,kodet,nregr,
             kscloc,kprloc,kpwloc,nxd,intd,
             irelad,igtyd,ipxcd,imarkd,nxg,intg,
             irelag,igtyg,ipxcg,ipthet,nterg);

   }

// when done, back off 1 
// (Feb 2019: testing if this should not be done to account for 
// differences in indexing between FORTRAN and C++ 
   nparm = itnext - 1;
   ngame = ignext - 1;

// Set kodet = 0 for ifix = 1 to fix parameter
   for(int iparm = 1; iparm <= nparm; iparm++){
     
       if(ifix.at(iparm - 1) == 1) kodet.at(iparm - 1) = 0;
       
   }
   
if(debug::kprint >= 4) {

   Rcpp::Rcout << "\nPROEX1 **4**\n" << std::endl;
   
for(int j = 1; j <= npard; j++){
  
    int nterd = nxd.at(j - 1) + intd.at(j - 1);
  
    Rcpp::Rcout << "j = " << j - 1       << std::endl;
    Rcpp::Rcout << "nxd(j) = "           << nxd.at(j - 1)    << std::endl;
    Rcpp::Rcout << "intd(j) = "          << intd.at(j - 1)   << std::endl;
    Rcpp::Rcout << "nterd = "            << nterd        << std::endl;
    Rcpp::Rcout << "igtyd(j) = "         << igtyd.at(j - 1)  << std::endl;
    Rcpp::Rcout << "irelad(j) = "        << irelad.at(j - 1) << std::endl;

}

for(int j = 1; j <= ngame; j++){
  
    Rcpp::Rcout << "\nPROEX1 **4** j = " << j - 1        << std::endl;
    Rcpp::Rcout << "nxg(j) = "           << nxg.at(j - 1)    << std::endl;
    Rcpp::Rcout << "intg(j) = "          << intg.at(j - 1)   << std::endl;
    Rcpp::Rcout << "nterg(j) = "         << nterg.at(j - 1)  << std::endl;
    Rcpp::Rcout << "igtyg(j) = "         << igtyg.at(j - 1)  << std::endl;
    Rcpp::Rcout << "irelag(j) = "        << irelag.at(j - 1) << std::endl;
    Rcpp::Rcout << "ipthet(j) = "        << ipthet.at(j - 1) << std::endl;

}

for(int j = 1; j <= nparm; j++){
  
    Rcpp::Rcout << "\nPROEX1 **4** j = " << j - 1        << std::endl;
    Rcpp::Rcout << "ifix(j) = "          << ifix.at(j - 1)   << std::endl;
    Rcpp::Rcout << "kodet(j) = "         << kodet.at(j - 1)  << std::endl;

}

   for(int ik = 0; ik < 5; ik++){
     
       if(ipxcd[ik] != R_NilValue) {
      
          SEXP l = ipxcd[ik]; Rcpp::IntegerVector y(l);
          Rcpp::Rcout << "i = " << ik << std::endl;
          Rcpp::Rcout << "ipxcd(i) = " << y << std::endl;
     
   }
   }
   
      for(int ik = 0; ik < 5; ik++){
     
       if(ipxcd[ik] != R_NilValue) {
      
          SEXP l = ipxcg[ik]; Rcpp::IntegerVector y(l);
          Rcpp::Rcout << "i = " << ik << std::endl;
          Rcpp::Rcout << "ipxcg(i) = " << y << std::endl;
     
   }
   }
      
}

return;

}
