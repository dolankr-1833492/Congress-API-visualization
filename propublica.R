options(stringsAsFactors = FALSE)



library(plyr)
library(stats)
library(dplyr, warn.conflicts=FALSE)
library(ggplot2)
library(ggthemes)
library(scales)
library(lubridate)
library(xml2)
library(rjson)
library(httr)

result <- GET("https://api.propublica.org/congress/v1/116/house/members.json", 
              add_headers("X-API-Key" = "sVT08Uow92I0knTOnHNYtkhbFiNCCitVXiqWGTQi"))
parsed_result <- content(result, 'parsed')

members <- ldply(parsed_result$results[[1]]$members, 
                 .fun=function(x){
                   as.data.frame(x[!sapply(x, is.null)])
                 }
)
