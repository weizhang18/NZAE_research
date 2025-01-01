###
local({
   ## load data
   load("data_intermediate/dtf_links_all_girls.rda")
   
   ## clean the data a bit
   dtf_links_all_girls_cl <-
      dtf_links_all_girls %>% 
      dplyr::filter( girl_id != "escorts" ) %>%  ## agency ad
      dplyr::filter( !grepl("nzpc",girl_id ) ) ## NZPC ad
      
})