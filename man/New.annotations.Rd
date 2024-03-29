% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/new_annotation.R
\name{New.annotations}
\alias{New.annotations}
\title{Create new dummy annotation}
\usage{
New.annotations(
  row.meta,
  ChildRecordings,
  time.sd = NULL,
  change.cat.prob = NULL,
  new.name = NULL
)
}
\arguments{
\item{row.meta}{: a row meta from ChildRecordings$all.meta to transform into dummy annotation}

\item{ChildRecordings}{: a ChildRecordings class}

\item{time.sd}{: a time deviation in millisecond to apply to the segments on using a normal law}

\item{change.cat.prob}{: The probability of a change in speaker_type}

\item{new.name}{: a string containing a new annotator name}
}
\description{
Use a real annotation to create a dummy annotation with degraded ratings and
directly add info to the ChildRecordings class
}
\examples{

\dontrun{

library(ChildRecordsR)
path = "/mnt/94707AA4707A8CAC/CNRS/corpus/vandam-daylong-demo"
CR = ChildRecordings(path)

CR$all.meta

New.annotations(row.meta = CR$all.meta[2,], ChildRecordings = CR, time.sd = 1500,
                change.cat.prob = 0.10, new.name = "vtc_BAD")

CR$all.meta

}
}
