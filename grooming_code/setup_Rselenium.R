## load libraries
library(RSelenium)
library(wdman)
library(netstat)
library(stringr)

## download, install and check need softwares
selenium_object <- selenium(retcommand = T, check=F)

## start the web driver
remote_driver <- 
   rsDriver(browser = "firefox",
            verbose = F,
            port = 4445L)

## Client side web driver
remDr <- remote_driver$client

## navigate to sites
remDr$navigate("https://www.r-bloggers.com/")


remDr$navigate("https://www.newzealandgirls.co.nz")

remDr$navigate("https://www.newzealandgirls.co.nz/auckland/escorts/nzgirls.php")
lady_grid <- remDr$findElements(using = 'xpath',value = '//*[@class="wrap-link esc-link "]')
lady_grid[[2]]$getElementAttribute("href")

more_page <- remDr$findElements(using = 'class name',value = 'more-pages-menu')

tmp_page_txt <- more_page[[1]]$getElementText()[[1]]
tmp_page_num <- str_extract_all(tmp_page_txt, "\\d+")[[1]]
tmp_page_num_ind <- strsplit(tmp_page_num, split = "")[[1]]




## Close the web browser and stop the server 
remDr$close()
remote_driver$server$stop()

