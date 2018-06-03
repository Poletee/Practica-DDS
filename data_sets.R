library(stringr) #++dplyr

setwd("C:\\Users\\Goordi\\Desktop\\master\\datadriven\\blocklist-ipsets-master") # WORKING DIRECTORY
src.files <- list.files() # LLEGIR FITXERS DEL WORKING DIRECTORY
IPS <- NULL
for (file_name in src.files){
  tmp <- read.table(file = paste("C:\\Users\\Goordi\\Desktop\\master\\datadriven\\blocklist-ipsets-master",
                                 file_name, sep = "\\"), skipNul = T, col.names = c("ip"), na.strings = "NULL", stringsAsFactors = F)
  file_info <- read.table(file=file_name, comment.char="/", sep = "\t", stringsAsFactors = F,nrows=50 )
  categ <- dplyr::filter(file_info, stringr::str_detect(V1,"Category"))
  if(nrow(categ) > 0) {
    categ <- stringr::str_trim(stringr::str_split(categ$V1, ":")[[1]][2])
    tmp$categ <- rep(x = categ, nrow(tmp))
    print(file_name)
    IPS <- rbind(IPS, tmp)
  }
}

file_name <- "country_ad.netset"

setwd("C:\\Users\\Goordi\\Desktop\\master\\datadriven\\geoips") # WORKING DIRECTORY
src.files <- list.files()

for (file_name in src.files){
  file_info <- read.table(file=file_name, comment.char="/", sep = "\t", stringsAsFactors = F,nrows=50 )
  country_tmp <- dplyr::filter(file_info, stringr::str_detect(V1,"--"))
  tmp <- read.table(file = paste("C:\\Users\\Goordi\\Desktop\\master\\datadriven\\geoips",file_name, 
                                 sep = "\\"),skipNul = T, na.strings = "NULL", col.names = c("Country"), stringsAsFactors = T)
  
  if(nrow(country_tmp) > 0) {
    country <- stringr::str_trim(stringr::str_split(country_tmp$V1, ",")[[1]][1])
    tmp$country <- rep(x = country, nrow(tmp))
    print(file_name)
    IPS <- rbind(IPS, tmp)
  }
}

