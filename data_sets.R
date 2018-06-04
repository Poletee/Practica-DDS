library(stringr) #++dplyr
library(iptools)

list.category <- function(IPS){
  print (dplyr::distinct(IPS[2]))
}


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

setwd("C:\\Users\\Goordi\\Desktop\\master\\datadriven\\geoips") # WORKING DIRECTORY
src.files <- list.files()
countries <- NULL

for (file_name in src.files){
  file_info <- read.table(file=file_name, comment.char="/", sep = "\t", stringsAsFactors = F,nrows=50, row.names = NULL)
  country_tmp <- dplyr::filter(file_info, stringr::str_detect(V1,"--"))
  tmp2 <- read.table(file = paste("C:\\Users\\Goordi\\Desktop\\master\\datadriven\\geoips",file_name, 
                                 sep = "\\"),skipNul = T, na.strings = "NULL", col.names = c("range"), stringsAsFactors = F, row.names= NULL)
  for (ip in tmp2) {
    tmp_boundary <- range_boundaries(ip)
    tmp2$min <- tmp_boundary[1]
    tmp2$max <- tmp_boundary[2]
  }
  if(nrow(country_tmp) > 0) {
    country <- stringr::str_trim(stringr::str_split(country_tmp$V1, "#")[[1]][2])
    country <- stringr::str_trim(stringr::str_split(country, ",")[[1]][1])
    print(file_name)
  }
  tmp2$country <- rep(x = country, nrow(tmp2))
  countries <- rbind(countries,tmp2)
}


# Mostra les IPs i els cops que han estat atacats
list.ip.count <- function(df, ip){
  mydf <- (as.data.frame(table(df[1])))
  mytable <- table(df[1])
  #t <- table(df[1])
  #print(which(mydf == ip))
  #print(mydf[957])
  print(dplyr::filter(str_detect(mytable, ip)))
  print(mytable[mytable[,1]==ip,1])
  
  dplyr::filter(file_info, stringr::str_detect(V1,"--"))
}

IPsRecount <- list.ip.count(IPS, '5.188.86.174')

# Mostra les diferents categories d'atac
list.category <- function(df){
  print (dplyr::distinct(df[2]))
}

# Mostra les diferents categories d'atac i el recompte de cada un
list.category.count <- function(df){
  print(as.data.frame(table(df[2])))
}

# Mostra tots els diferents països que tenen IPs que han sigut atacades
list.country <- function(df){
  print (dplyr::distinct(df[3]))
}

# Mostra una taula amb els diferents països i el recompte d'atacs rebuts
list.country.count <- function(df){
  print (table(df[3]))
}

list.category.count(IPS)
