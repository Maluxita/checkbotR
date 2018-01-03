install.packages("jsonlite")
getwd()
setwd("/home/malusita/karmapulse/checkbotR")
library(jsonlite)

archivo <- "/home/malusita/karmapulse/checkbotR/checks_test.json"


con <- file(archivo, open="r")
ejemplo_json <- readLines(con)
close(con)
datos <- fromJSON(ejemplo_json)



