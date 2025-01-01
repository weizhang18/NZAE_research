### construct all links from nzg

local({
   
   
   ## find all links on nzg by region
   tmp_links <- NULL
   
   for(i in 1:nrow(urls_nzg)){
      tmp_url_region <- urls_nzg$urls[i]
      tmp_links[[i]] <- contruct_region_link_nzg(tmp_url_region)
      
   }
   
   ## all regional links
   links_all_regions <- 
      unlist(tmp_links)
   
   
   ## 
   dtf_links_all_regions <-
      data.frame(url_region = links_all_regions,
                 region = unlist(lapply(strsplit(links_all_regions, "/"),
                                        function( i_str ) {
                                           tmp_region <- i_str[4]
                                        }
                 ))
      )
   
   save(dtf_links_all_regions, file = "data_intermediate/dtf_links_all_regions.rda")
   
})