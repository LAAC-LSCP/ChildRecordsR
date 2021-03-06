% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_rating_segment.R
\name{find.rating.segment}
\alias{find.rating.segment}
\title{Search function on Childrecordings class}
\usage{
find.rating.segment(
  ChildRecordings,
  recording_filename,
  annotators = NULL,
  range_from = NULL,
  range_to = NULL
)
}
\arguments{
\item{ChildRecordings}{: a ChildRecordings class}

\item{annotators}{: an optional argument providing le annotators to look at}

\item{range_from}{and range_to : an optional time windows for the search}

\item{filename}{: a wav file name to look}
}
\value{
A data.frame containing commun annoation segment for each annotator
}
\description{
Search function in Childrecordings class
This search function will help you to provide file name and time windows
for common coding in raters
}
\examples{
library(ChildRecordsR)
path = "/mnt/94707AA4707A8CAC/CNRS/corpus/namibia-data/"
CR = ChildRecordings(path)

# if no time windows is specified, this function will only return at table for all the know raters
# All the rater need to ratter any segment find
find.rating.segment(CR, "aiku/namibie_aiku_20160715_1.wav")

# However, if a time windows is provided, this function will find all the data that
# overlaps with the time windows provided.
# For instance, you can shift the window it will give you the same result
Wav_file_name = "aiku/namibie_aiku_20160715_1.wav"
t1 = 27180000
t2 = 27000000
t3 = 27240000
find.rating.segment(CR, Wav_file_name, range_from = t1, range_to = t3)
find.rating.segment(CR, Wav_file_name, range_from = t1, range_to = t3)
find.rating.segment(CR, Wav_file_name, range_from = t2, range_to = t3)

# finding segments on wav file for designated rater
raters <-  c("textgrid_ak", "textgrid_mm", "textgrid_m1")
find.rating.segment(CR,"Wav_file_name", raters)

# finding segments on wav file for the designated windows in second and rater
search <- find.rating.segment(CR,"Wav_file_name", raters, range_from = t1, range_to = t2)

# try to analyse a larger number of file
wave_file <- unique(CR$all.meta$filename) # get all the wav files
raters <- c("textgrid_ak", "textgrid_mm", "textgrid_m1") # Define raters you are interested in

# bind all the results
search2 <- data.frame()
for (file in wave_file[1:10]){
  print(file)
  search2 <- rbind(search2, find.rating.segment(CR, file, raters)) # could take some time
}

head(search2)





}
