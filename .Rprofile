###########################################################################
rm(list= ls())

Sys.setlocale("LC_TIME", "C")

## set up R environment ---------------------------------------------------
#PrefLibPaths <- "P:/R/libraries/3.3.2-20170925"
#source("P:/R/common.Rprofile")
#source("P:/R/common.Rprofile.dev.R")
###########################################################################

### make sure open in Chrome
options(browser = "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe")
#.libPaths("P:/R/libraries/3.3.2-20170925")
#Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_361')

###########################################################################
## load R libraries -------------------------------------------------------
.libPaths("C:/Users/Public/R/4.4.2")
library(lubridate)
library(stringr)
library(shiny)
library(utils)
library(dplyr)
library(tidyr)
library(zoo)
library(shinydashboard)
library(DT)
library(highcharter)
library(rvest)
library(magrittr)
library(rjson)
library(RSelenium)
library(wdman)
library(netstat)
library(stringr)

## load user defined functions 
source("R/utility.R")

## download, install and check need softwares
selenium_object <- selenium(retcommand = T, check=F)

## start the web driver
remote_driver <- 
   rsDriver(browser = "firefox",
            verbose = F,
            port = 4445L)

## Client side web driver
remDr <- remote_driver$client
