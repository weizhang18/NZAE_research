## utility functions

## based on the reginoal url to construct all pages
construct_region_link_nzg <-
   function( region_base_url, sleep_time = 2 ){
      ## start page
      remDr$navigate(region_base_url)
      Sys.sleep(sleep_time )
      
      more_page <- remDr$findElements(using = 'class name',value = 'more-pages-menu')
      tmp_page_txt <- more_page[[1]]$getElementText()[[1]]
      
      if(tmp_page_txt != ""){
         tmp_page_num <- str_extract_all(tmp_page_txt, "\\d+")[[1]]
         tmp_page_num_ind <- strsplit(tmp_page_num, split = "")[[1]]
         tmp_page_num_ind <- tmp_page_num_ind[1:(length(tmp_page_num_ind)-1)]
         tmp_all_links <- paste0(region_base_url, "?pos=", tmp_page_num_ind)
         return( c(region_base_url, tmp_all_links) )
      }else{
         return(region_base_url)
      }
      
   }


### based on all regional links to get all girls
construct_girl_link_nzg <-
   function( region_link, sleep_time = 2){
      ## start page
      remDr$navigate(region_link)
      Sys.sleep(sleep_time )
      
      ## find girls card
      tmp_girl_card <- remDr$findElements(using = 'css selector',value = '.wrap-link.esc-link')
      
      ## find href 
      tmp_list <- lapply( tmp_girl_card,
                          function(i_girl){
                             i_girl$getElementAttribute("href")
                          } )
      
      return( unlist(tmp_list) )
   }


## construct girls info from nzg
construct_girl_info_nzg <-
   function( girl_link, sleep_time = 2){
      ## start page
      remDr$navigate(girl_link)
      Sys.sleep(sleep_time )
      
      ## test if the page has price info
      ## get price info
      price_element_raw <- 
         remDr$findElements(using = "css selector", ".price-list") 
      
      ## if price info is available
      if( length(price_element_raw) >0 ){
         ## get about me info
         about_me_element <- remDr$findElements(using = "css selector", ".row.gap")
         
         ## find about me 
         about_me_text <-unlist(lapply( about_me_element,
                                        function(i_girl){
                                           i_girl$getElementText()
                                        } ))
         
         ## to a data frame
         tmp_abm <-
            lapply(strsplit( about_me_text, "\n"),
                   function(i_abm){
                      tmp_col <- i_abm[1]
                      tmp_value <- i_abm[2]
                      
                      tmp_dtf <- as.data.frame(t(as.matrix(tmp_value)))
                      colnames(tmp_dtf) <- tolower(tmp_col)
                      
                      return( tmp_dtf )
                   })  
         
         tmp_dtf_abm <- bind_cols(tmp_abm)
         
         ## get phone number
         phone <- 
            remDr$findElements(using = "css selector", ".button.btn-large.red")[[1]]$getElementText()[[1]]
         
         ## put phone number in
         tmp_dtf_abm <-
            tmp_dtf_abm %>% 
            bind_cols( data.frame(phone = phone) )
         
         
         ## get all image href for future needs
         pictures_elem <- 
            remDr$findElements(using = "css selector", ".photo-box.resp-img")
         
         pic_links <- 
         lapply(pictures_elem , 
                function(i_pic){
                   tmp_link <- 
                      i_pic$findChildElements(using = "tag name", value = "img" )[[1]]$getElementAttribute("src")[[1]]
                   
                   return(tmp_link)
                }
               )
         
         ## get price info
         price_element <- 
            price_element_raw[[1]]$findChildElements("css selector", ".row")
         
         ## find about me 
         price_text <-unlist(lapply( price_element,
                                     function(i_price){
                                        i_price$getElementText()
                                     } ))
         
         # ## to a data frame
         # tmp_price <-
         #    lapply(strsplit( price_text, "\n"),
         #           function(i_price){
         #              tmp_col <- i_price[1]
         #              tmp_value <- i_price[2]
         #              
         #              tmp_dtf <- as.data.frame(t(as.matrix(tmp_value)))
         #              colnames(tmp_dtf) <- tolower(tmp_col)
         #              
         #              return( tmp_dtf )
         #           })  
         # 
         # tmp_dtf_price <- bind_cols(tmp_price)  
      }
      
      return( list( about_me =  tmp_dtf_abm,
                    price = price_text ) )
   }
