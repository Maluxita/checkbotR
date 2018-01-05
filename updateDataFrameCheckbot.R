#######

'''
1.0 configurar directorio, cargar librerias y abrir api
1.1 Abrir el json
1.2 Convertir a fecha los formatos pasados en el json
1.3 Agregar una columna de día de la semana label del registro
1.4 Agregar una columna hora del día del registro.
1.5 Agregar una columna de año del registro
1.6 Agregar una columna de nombre de la persona del registro

#######'''

#Paso 1.0
setwd("/home/malusita/karmapulse/checkbotR")
library(openair)
library(jsonlite)
library(ggplot2)
library(RtextTool)
library(topicmodels)
library(ggplot2)
library(stats)
library(graphics)
library(plotly)
library(dplyr)
library(base)
library(lubridate)

Sys.setenv("plotly_username"="malucita")
Sys.setenv("plotly_api_key"="IoyHQM13stwpkmxuNU8l")

#Paso 1.1

#leemos el json

archivo <- "/home/malusita/karmapulse/checkbotR/checks.json"
con <- file(archivo, open="r")
ejemplo_json <- readLines(con)
close(con)
datos <- fromJSON(ejemplo_json)
summary(datos)
head(datos)

#Paso No. 2
##fecha
datos<-datos%>% mutate(fechaCheck=as.Date(datos$date,"%d-%m-%Y"))
head(datos)
summary(datos)
##label dia
datos<-datos%>% mutate(diaChecklabel=wday(datos$fechaCheck,label = TRUE, abbr = FALSE))
head(datos)
summary(datos)
##dia del mes
datos<-datos%>% mutate(diadMesCheck=mday(datos$fechaCheck))
head(datos)
summary(datos)
###para contar los check si fueron mas cerca de la quincena que no o los HO que días se reportan más
##mes label
datos<-datos%>% mutate(meslabel=format(datos$fechaCheck, "%b"))
head(datos)
summary(datos)
class(mes)
##mes en numero
datos<-datos%>% mutate(mes=format(datos$fechaCheck, "%m"))
head(datos)
summary(datos)

##year en numero
datos<-datos%>% mutate(anio=format(datos$fechaCheck, "%Y"))
head(datos)
summary(datos)

## solo usuario
### Quitamos extension mail para dejar solo el usuario

extensionMail=(c("@karmapulse.com"))
datos$user=gsub(extensionMail, c(""),datos$user)
head(datos)
summary(datos)

##fecha y hra
#datos <-datos%>% mutate(fechaandTimeCheck=as.Date(datos$date,"%d-%m-%Y"))
#head(datos)
#summary(datos)
#'''
#'
#misdatos=as.Date(paste(datos$date,datos$time, sep = " "), "%d-%m-%Y %H:%M:%S")
#misdatos[200]-misdatos[1]
#a=format(datos$fechaCheck, "%b")
#texto_split = strsplit(datos$user, split="@karmapulse.com")
#texto_columnas = data.frame(unlist(texto_split))

###

----
  
datos<-datos%>% mutate(fechaTime=paste(datos$fechaCheck,datos$time, sep=" "))
head(datos)
summary(datos)

datos<-datos%>% mutate(hora=hour(parse_date_time(datos$fechaTime, orders = "amd HMS y")(fechaTime)))
head(datos)
summary(datos)

  -----
fecha <- "Mon May 11 03:17:40 UTC 2009"
fecha2<-"2017-06-02 09:43:00"

mi_fecha <- parse_date_time(fecha, orders = "amd HMS y")
mi_fecha2 <- parse_date_time(fecha2, orders = "Ymd HMS")

fecha2<- datos$
  day(mi_fecha)
month(mi_fecha)
hour(mi_fecha2)+(minute(mi_fecha2)/60)
second(mi_fecha)

datos<-mutate(mifecha=paste(datos$date,datos$time, sep = " "))











