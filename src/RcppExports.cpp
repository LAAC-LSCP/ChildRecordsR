// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// convertor_long_cut_loop
Rcpp::DataFrame convertor_long_cut_loop(arma::vec time_seq, arma::vec segment_onset_vec, arma::vec segment_offset_vec, std::vector<std::string> speaker_type_vec);
RcppExport SEXP _ChildRecordsR_convertor_long_cut_loop(SEXP time_seqSEXP, SEXP segment_onset_vecSEXP, SEXP segment_offset_vecSEXP, SEXP speaker_type_vecSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type time_seq(time_seqSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type segment_onset_vec(segment_onset_vecSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type segment_offset_vec(segment_offset_vecSEXP);
    Rcpp::traits::input_parameter< std::vector<std::string> >::type speaker_type_vec(speaker_type_vecSEXP);
    rcpp_result_gen = Rcpp::wrap(convertor_long_cut_loop(time_seq, segment_onset_vec, segment_offset_vec, speaker_type_vec));
    return rcpp_result_gen;
END_RCPP
}
// LENA_overlap_loop
Rcpp::List LENA_overlap_loop(arma::vec segment_onset_vec, arma::vec segment_offset_vec, std::vector<std::string> speaker_type_vec);
RcppExport SEXP _ChildRecordsR_LENA_overlap_loop(SEXP segment_onset_vecSEXP, SEXP segment_offset_vecSEXP, SEXP speaker_type_vecSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type segment_onset_vec(segment_onset_vecSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type segment_offset_vec(segment_offset_vecSEXP);
    Rcpp::traits::input_parameter< std::vector<std::string> >::type speaker_type_vec(speaker_type_vecSEXP);
    rcpp_result_gen = Rcpp::wrap(LENA_overlap_loop(segment_onset_vec, segment_offset_vec, speaker_type_vec));
    return rcpp_result_gen;
END_RCPP
}
