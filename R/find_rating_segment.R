
#' Search function on Childrecordings class
#'
#' Search function in Childrecordings class
#' This search function will help you to provide file name and time windows
#' for common coding in raters
#'
#' @param ChildRecordings : a ChildRecordings class
#' @param recording_filename : a wav file name to consider
#' @param annotators : an optional argument listing the annotators to consider
#' @param range_from : an optional time window to restrain the search from 
#' @param range_to : an optional time window to restrain the search to
#' 
#' @importFrom DescTools Overlap
#' @importFrom methods is
#'
#' @return A data.frame containing sections that have been annotated by several annotations
#' 
#' @export
#'
#' @examples
#' 
#' \dontrun{
#' 
#' library(ChildRecordsR)
#' path = "/mnt/94707AA4707A8CAC/CNRS/corpus/vandam-daylong-demo"
#' CR = ChildRecordings(path)
#'
#' # if no time windows is specified, this function will only return at table for all the know raters
#' # To work, all annotators must have at least one common annotation segment.
#' 
#' find.rating.segment(CR, "BN32_010007.mp3")
#'
#' # However, if a time window is provided, this function will find all the data that
#' # overlaps with the time window provided.
#' 
#' Wav_file_name = "BN32_010007.mp3"
#' t1 = 500000
#' t2 = 500000*2
#' find.rating.segment(CR, Wav_file_name, range_from = t1, range_to = t2)
#'
#'
#' # finding segments on wav file for designated rater
#' 
#' raters <-  c("its", "vtc")
#' find.rating.segment(CR,"Wav_file_name", raters)
#'
#' # finding segments on wav file for the designated windows in second and rater
#' 
#' search <- find.rating.segment(CR,"Wav_file_name", raters, range_from = t1, range_to = t2)
#'
#' # try to analyse a larger number of file
#' 
#' wave_file <- unique(CR$all.meta$filename) # get all the wav files
#' raters <- c("its", "vtc") # Define raters you are interested in
#'
#' # bind all the results
#' 
#' search2 <- data.frame()
#' for (file in wave_file[1:10]){
#'   print(file)
#'   search2 <- rbind(search2, find.rating.segment(CR, file, raters)) # could take some time
#' }
#'
#' head(search2)
#'
#' }

find.rating.segment <- function(ChildRecordings,
                                recording_filename,
                                annotators=NULL,
                                range_from=NULL,
                                range_to=NULL){

  if(!methods::is(ChildRecordings, "ChildRecordings")){
    print(paste( substitute(ChildRecordings), "is not a ChildRecordings class"))
    return(NULL)
  }

  ### table
  tbl <- ChildRecordings$all.meta
  tbl <- tbl[tbl$recording_filename==recording_filename,]
  tbl$true_onset <- tbl$time_seek + tbl$range_onset
  tbl$true_offset <- tbl$time_seek + tbl$range_offset

  ### select annotators
  if(is.null(annotators)){
    annotators <- unique(tbl$set)
    n.annotator = length(annotators)
  } else {
    tbl <- tbl[tbl$set %in% annotators,]
    n.annotator = length(annotators)
  }

  if (nrow(tbl)==0){
    return(NULL)
  }

  ### Select window range, if mentioned
  if(!is.null(range_from) & !is.null(range_to)){
    tbl <- tbl[true_time_seg_finder(range_from,range_to,tbl),]
  }else{
    range_from= min(tbl$true_onset)
    range_to= max(tbl$true_offset)
  }

  ### return if empty
  if (nrow(tbl)==0){
    return(NULL)
  }

  #................................................. I don't know if this modification can replace the next double for-loop 
  # # common.annotation <- c()
  # ol.with <-c()
  # 
  # for(row in 1:nrow(tbl)){
  # 
  #   if ((row + 1) <= nrow(tbl)) {                # find the overlapping segments between the current row of the 'tbl' and all rows after the current row (to reduce the iterations)
  #    
  #     for(row2 in (row+1):nrow(tbl)) {
  #       
  #       # cat(row, row2, '\n')
  #       t = DescTools::Overlap(x = c(tbl[row,]$true_onset, tbl[row,]$true_offset),
  #                              y = c(tbl[row2,]$true_onset, tbl[row2,]$true_offset))
  #       
  #       if (t>0) {
  #         ol.with <- c(ol.with, as.character(tbl[row2,]$set))
  #       }
  #     }
  #   }
  # }
  #................................................. 
  
  common.annotation <-c()
  for(row in 1:nrow(tbl)){
    ol.with <-c()
    for(row2 in 1:nrow(tbl)){
      
      t = DescTools::Overlap(
        x=c(tbl[row,]$true_onset,tbl[row,]$true_offset),
        y=c(tbl[row2,]$true_onset,tbl[row2,]$true_offset)
      )
      # print(t)
      if(t>0){
        ol.with <- c(ol.with,as.character(tbl[row2,]$set))
      }
    }
    common.annotation<- c(common.annotation,length(unique(ol.with)))
  }

  # select commun segment possible
  tbl$common.annotation <- common.annotation
  tbl <- tbl[tbl$common.annotation==n.annotator,]
  if (nrow(tbl)==0){
    return(NULL)
  }

  # Define time segment
  range_from <- max( c(min(tbl$true_onset),range_from ))
  range_to <- min( c(max(tbl$true_offset),range_to ))
  time =  seq(range_from-1000, range_to+1000, 1000)
  time.line = data.frame(time = time, count = 0)

  for (row in 1:nrow(tbl)){
    time.line[time>= tbl[row,]$true_onset & time<= tbl[row,]$true_offset,]$count=  time.line[time>= tbl[row,]$true_onset & time<= tbl[row,]$true_offset,]$count +1
  }
  
  time.line$segment <- ifelse(time.line$count==n.annotator,1,0 )
  time.line[time==range_from-1000 | time==range_to+1000,]$segment = 0 # add border

  # find segments
  time.code <- time.line[which(diff(time.line$segment)!=0),]$time
  time.code <- as.data.frame(matrix(time.code,ncol=2,byrow = T))
  names(time.code) <- c("true_onset","true_offset")

  ### Format data to be returned
  rez <- data.frame()
  for (row in 1:nrow(time.code)) {
    true_onset= time.code[row,]$true_onset
    true_offset = time.code[row,]$true_offset
    tmp <- true_time_seg_finder(true_onset,true_offset,tbl)

    tmp <- data.frame( recording_filename=tbl[tmp,]$recording_filename,
                       set= tbl[tmp,]$set,
                       annotation_filename = tbl[tmp,]$annotation_filename,
                       stringsAsFactors = F)


    tmp$true_onset <- true_onset+1000
    tmp$true_offset <- true_offset

    rez <- rbind(rez,tmp)
  }
  
  return(rez)
}
