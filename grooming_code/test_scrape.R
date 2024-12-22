### create a function to scrap nzg data
url <- "https://www.newzealandgirls.co.nz/auckland-escorts/nzgirls-ladygabriella-36842"

scrape_nzg <- 
   function(url = "https://www.newzealandgirls.co.nz/auckland/escorts/nzgirls.php"){
      ld_page_php <- 
         rvest:::request_POST(url,
                              config(referer = x$url),
                              user_agent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.86 Safari/537.36"),
                              body = list(...), 
                              encode = "form")
      
   }

x <- 
GET("https://www.newzealandgirls.co.nz/auckland/escorts/nzgirls.php", 
    add_headers(`:authority:` = "www.newzealandgirls.co.nz",
                `:method:` = "POST",
                `:path:` = "/cdn-cgi/rum?",
                `:scheme:` = "https",
                `accept` = "*/*",
                `accept-encoding` = "gzip, deflate, br, zstd",
                `accept-language` = "en-US,en;q=0.9", 
                `content-length` = "1055",
                `content-type` = "application/json",
                #`cookie` = "PHPSESSID=yHaAC3AYwGDquJ28KhtAAyQVc-UUNzq2; utcookie=SESSION; _ga=GA1.1.775412638.1734900042; new_splash=off; _ga_6RLX98ZPRD=GS1.1.1734902061.2.1.1734903296.59.0.0; AWSALBTG=RWB1BPtYGAglXnxKdXq/muIZWaXfXGda5BXO69gsjBUAIigE7JkXwQ6f11JWEHm2WGgE8vw81QZHZrTi4j5SailR9lWnwkwkBrCyrjCJLqqbLW7j30NFHQJJDRZd6OneOtmpXbxkdKWXckomCnb8BIPoBnsV4BfSYHfoql9I02ux2YrSu8c=; AWSALB=uWxSlvqQ49b3Xrlgy3eXqmkUIK/+CY74k4D5K9Amapg5KQSTafBkj4eqmx6QWg/wCkQMN9yYDl0S6a81hy8Psn47xXGM09BG0D8LlvLYdXG9aJtscSdjsHQEKgBo",
                #`origin` = "https://www.newzealandgirls.co.nz",
                `priority` =  "u=4, i",
                `referer` = "https://www.newzealandgirls.co.nz/all/css/slick-theme.css",
                `sec-ch-ua` = '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"',
                `sec-ch-ua-mobile` = "?0",
                `sec-ch-ua-platform` = "Windows",
                `sec-fetch-dest` = "empty",
                `sec-fetch-mode` = "cors",
                `sec-fetch-site` = "same-origin",
                `user-agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36)"
    ))

url1 <- 'https://www.newzealandgirls.co.nz/auckland/escorts/nzgirls.php'
UA <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0"

res   <- GET(url1, add_headers(`Connection` = "keep-alive", `User-Agent` = UA))


url1 <- 'https://www.sec.gov/Archives/edgar/data/0001336528/0001172661-21-001865.txt'
UA <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0"

res   <- GET(url1, add_headers(`Connection` = "keep-alive", `User-Agent` = UA))
data1 <- strsplit(content(res), "\n")[[1]]

head(data1, 10) 


library(RCurl)
URL <- "https://www.newzealandgirls.co.nz/auckland-escorts/nzgirls-ladygabriella-36842"
x <- getURL(URL)