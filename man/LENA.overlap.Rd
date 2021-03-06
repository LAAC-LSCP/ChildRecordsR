% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LENA.overlap.R
\name{LENA.overlap}
\alias{LENA.overlap}
\title{Overlap LENA function}
\usage{
LENA.overlap(meta_row, ChildRecordings)
}
\arguments{
\item{meta_row}{: a row from the meta containing all the info of the cvs file}

\item{ChildRecordings}{: a ChildRecordings class}
}
\value{
A data.frame with 2 added columns
}
\description{
Open an annotation file and add 2 columns to find overlap according to the LENA-style overlap definition
}
\examples{
library(ChildRecordsR)
path = "/mnt/94707AA4707A8CAC/CNRS/corpus/namibia-data/"
CR = ChildRecordings(path)
raw_file <- LENA.overlap(CR$all.meta[1,],CR)
head(raw_file)



}
