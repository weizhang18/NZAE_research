
library(RSelenium)
library(wdman)
library(netstat)



selenium_object <- selenium(retcommand = T, check=F)


remote_driver <- 
   rsDriver(browser = "firefox",
            verbose = F,
            port = 4445L)




remote_driver$server$stop()


remDr <- remote_driver$client

remDr$open()
remDr$navigate("https://www.6park.com")
remDr$navigate("https://www.newzealandgirls.co.nz")
