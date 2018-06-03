library(stringr)

setwd("C:\Users\Goordi\Desktop\master\datadriven") # WORKING DIRECTORY
src.files <- list.files() # LLEGIR FITXERS DEL WORKING DIRECTORY
IPS <- NULL
for (file_name in src.files){
  tmp <- read.table(file = paste("C:\Users\Goordi\Desktop\master\datadriven",
                                 file_name, sep = "\\"), skipNul = T, col.names = c("ip"), na.strings = "NULL", stringsAsFactors = F)
  
  file_info <- read.table(file=file_name, comment.char="/", sep = "\t", stringsAsFactors = F,nrows=50 )
  categ <- dplyr::filter(file_info, stringr::str_detect(V1,"Category"))
  if(nrow(categ) > 0) {
    categ <- stringr::str_trim(stringr::str_split(categ$V1, ":")[[1]][2])
    tmp$categ <- rep(x = categ, nrow(tmp))
    print(file_name)
    IPS <- rbind(IPS, tmp )
  }
}
