% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aggregate_rating.R
\name{aggregate.rating}
\alias{aggregate.rating}
\title{aggregation of annnotations data}
\usage{
\method{aggregate}{rating}(data, ChildRecordings, cut = 100, verbose = T)
}
\arguments{
\item{data}{: find.ratting.segment return or similar data.frame}

\item{ChildRecordings}{: a ChildRecordings class}

\item{cut}{: time size in millisecond for the unit segment}
}
\value{
A raterData class containing with original format and long format for every annotators.
}
\description{
Base on the result of an find.ratting.segment return or similar data.frame
the function will extract data from annotation file in a raterData Class
}
\details{
the data will be organize un raw annotation format and a long segmented format
}
\examples{
library(ChildRecordsR)
path = "/mnt/94707AA4707A8CAC/CNRS/corpus/namibia-data/"
CR = ChildRecordings(path)

# if no time windows is specified, this function will only return at table for all the know raters
# All the rater need to ratter any segment find
search = find.rating.segment(CR, "aiku/namibie_aiku_20160715_1.wav")
rez = aggregate.rating(search, CR, cut=0.100, verbose=T)

}
