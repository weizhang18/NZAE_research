

##################################################
## 0.0 set environment --------------------------- 
## set R, load user defined functions and some global variables
source(".Rprofile") # it is necessary to run when start from outside Rstudio, and no harm to run it again

## read urls
source("grooming_code/read_urls.R")

## construct all region links in nzg
source("grooming_code/construct_regional_links_nzg.R")

## construct all girls link from each region 
source("grooming_code/construct_girls_links_nzg.R")


## Close the web browser and stop the server 
remDr$close()
remote_driver$server$stop()