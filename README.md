# ChildRecordsR
R package for ChildRecordsData

## Getting started

1. Make sure you have installed [ChildRecordsData](https://github.com/LAAC-LSCP/ChildRecordsData#installation) 
1. Make sure you have some data within that format -- more info in the [ChildRecordsData doc](https://github.com/LAAC-LSCP/ChildRecordsData#data-formatting-and-structure)
 may need annex
1. If you are in the team, you can import a dataset https://github.com/LAAC-LSCP/ChildRecordsData/blob/f314c7a536ba48422bf42ce0161ef1a2c55106e2/docs/templates/PROJECTS.md#installing-a-dataset
- get annotation

If you want to test the firsts functions please use the testbench.R fil, do not change this file. Use playground.R to test what you want. 

## What it can do 

 - Checking referenced file in the childrecording folder and meta (try to mess it to check)
 - retrieve file and provide "True" onset and offset
 - If date_iso and time_start are provided then it gives the real date and hour of the ratting line (useful if you want to look at the file by year/day/hours)
 - formatting data to future reliability test (0 = silence, 1=child, 2=FEM, 3=MAL, 4=OCHI, NA=overlap)
 - You can choose the granulation of the cut, by default it is 0.100 second

## Need to implementation 

 - Currently, research function lack of flexibility 
 - Function do not know how to handle empty ratting file
 - A summary method to provide reliability of ratter is not implemented
 - The code could be refine.
 - implemetation of overlap labeling and lena method on overlap
 - Description of CLass/function will come later as well as structure
 
# if you want to change code 

- Create a new branch from *develop* and a merge request on develop i will handle the merge. 
 
 
 
