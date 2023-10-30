## Install relevant packages
install.packages("rjson") # To submit a query to opencitations

## Create citation retrieval function
retrieve_citing <- function(doi){
  
  ## Generate strings for opencitations and the DOI you are interested in
  opencite <- "https://opencitations.net/index/coci/api/v1/citations/"
  
  ## Remove url prefix of the DOI
  doi <- gsub("https://doi.org/", "", doi)

  ## Submit query to opencitations
  result <- rjson::fromJSON(file = paste0(opencite, doi))
  
  ## Extract DOIs of citing papers from the returned list from opencitations
  citing <- lapply(result, function(x){
    x[['citing']]
  })
  
  ## Unlist the list of DOIs into a vector and return
  citing <- unlist(citing) 
  return(citing)
  
}