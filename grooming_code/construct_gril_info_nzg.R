###
local({
   ## load data
   load("data_intermediate/dtf_links_all_girls.rda")
   
   ## clean the data a bit
   dtf_links_all_girls_cl <-
      dtf_links_all_girls %>% 
      dplyr::filter( girl_id != "escorts" ) %>%  ## agency ad
      dplyr::filter( !grepl("nzpc",girl_id ) ) ## NZPC ad
   
   
   ##
   tmp_girl_list <- NULL
   no_of_girls <- nrow(dtf_links_all_girls_cl)
   
   for(i in 1:no_of_girls){
      
      print(paste0(i, " out of ", no_of_girls) )
      
      tmp_girl_link <- 
         dtf_links_all_girls_cl$url_girl[i]
      
      tmp_dtf_girl_about_me <-
         construct_girl_info_nzg(tmp_girl_link, sleep_time = 0)
      
      tmp_girl_list[[i]] <- 
         bind_cols(dtf_links_all_girls_cl[i,c("girl_id","region")],
                   tmp_dtf_girl_about_me)
   }
   
   dtf_girls_info <- bind_rows(tmp_girl_list)
})