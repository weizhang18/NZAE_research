## to construct all girls link from each regions link

local({
   ## load nzg links by region
   load("data_intermediate/dtf_links_all_regions.rda")
   
   ## find all links on nzg by girl
   tmp_links <- NULL
   
   for(i in 1:nrow(dtf_links_all_regions)){
      tmp_url <- dtf_links_all_regions$url_region[i]
      tmp_links[[i]] <- construct_girl_link_nzg(tmp_url)
      
   }
   
   ## all regional links
   links_all_girls <- 
      unlist(tmp_links)
   
   ## 
   dtf_links_all_girls <-
      data.frame(url_girl = links_all_girls,
                 region = unlist(lapply(strsplit(links_all_girls, "/"),
                                        function( i_str ) {
                                           tmp_region <- i_str[4]
                                        }
                 )),
                 girl_id = unlist(lapply(strsplit(links_all_girls, "/"),
                                         function( i_str ) {
                                            tmp_id <- i_str[5]
                                         }
                 ))
      )
   
   save(dtf_links_all_girls, file = "data_intermediate/dtf_links_all_girls.rda")

})