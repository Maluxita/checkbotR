#install.packages("jsonlite")
#getwd()
#setwd("/home/malusita/karmapulse/checkbotR")
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

### grupos
mtcars$hp
mtcars$cyl
mtcars$qsec
summary(mtcars)

p <- plot_ly(
  type = 'scatter',
  x = mtcars$hp,
  y = mtcars$qsec,
  text = paste("Make: ", rownames(mtcars),
               "<br>hp: ", mtcars$hp,
               "<br>qsec: ", mtcars$qsec,
               "<br>Cyl: ", mtcars$cyl),
  hoverinfo = 'text',
  mode = 'markers',
  transforms = list(
    list(
      type = 'groupby',
      groups = mtcars$cyl,
      styles = list(
        list(target = 4, value = list(marker =list(color = 'blue'))),
        list(target = 6, value = list(marker =list(color = 'red'))),
        list(target = 8, value = list(marker =list(color = 'black')))
      )
    )
  )
)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link <- api_create(p, filename = "groupBasic")
chart_link

### grupos


midwest$popdensity
midwest$percollege
midwest$state
midwest$county
midwest$percwhite

#leemos el json

archivo <- "/home/malusita/karmapulse/checkbotR/checks.json"
con <- file(archivo, open="r")
ejemplo_json <- readLines(con)
close(con)
datos <- fromJSON(ejemplo_json)
summary(datos)

datos$user
datos$status
datos$date

### Ejemplo fechas
strDates <- c("17-08-1965", "02-08-1965")
dates <- as.Date(strDates, "%d-%m-%Y")
dates[1]-dates[2]
### Termina ejemplo fechas

fechaEntrada<-(as.Date(datos$date,"%d-%m-%Y"))
class(fechaEntrada)
wday(fechaEntrada[198], label = TRUE, abbr = FALSE)-wday(fechaEntrada[2])
datos$`_id`

## Quitamos extension mail para dejar solo el usuario
extensionMail=(c("@karmapulse.com"))
checkbot$user=gsub(extensionMail, c(""),checkbot$user)



#este comando crea la lista de horarios de entrada divididos por persona.
summary(datos)
p <- plot_ly(datos, x = ~time, color = ~user, type = "box")
p
api_create(p, filename = "kCheckTime-boxplot")


#este comando muestra la fecha y su distribución, agrupado por status
## Primero convertimos la fecha a tipo date

checkbot<-datos%>% mutate(fechaEntrada=as.Date(datos$date,"%d-%m-%Y"))
head(checkbot)
summary(checkbot)

#a<-format(checkbot$fechaEntrada,format="%B %d %Y")
#a
# print today's date
#today <- Sys.Date()
#today
#format(today, format="%B %d %Y")
###
#crea unagrafica con la fecha de Entrada agrupada por estatus
q <- plot_ly(checkbot, x = ~fechaEntrada, color = ~status, type = "box", boxpoints = FALSE)
q
api_create(q, filename = "kCheckDateOK-boxplot")

#crea unagrafica con la fecha de Entrada agrupada por estatus y tiempo
## primero mutamos tiempo a time

## read in date/time info in format 'm/d/y h:m:s'
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- paste(checkbot$date, checkbot$time)
strptime(paste(checkbot$date, checkbot$time), "%d-%m-%Y %H:%M:%S")


ch<-checkbot%>%mutate(horaEntrada2 = strptime(paste(checkbot$date, checkbot$time), "%d-%m-%Y %H:%M:%S")
)
head(ch)
r <- plot_ly(checkbot, x = ~fechaEntrada, y = ~time, type = "scatter")
#crea unagrafica con la fecha de Entrada agrupada por estatus
r <- plot_ly(checkbot, x = ~fechaEntrada, color = ~status, type = "box", boxpoints = FALSE)
r
api_create(r, filename = "kCheckTimeOK-boxplot")


mutate(fechaEntrada=as.Date(datos$date,"%d-%m-%Y"))
head(checkbot)

## read in date/time info in format 'm/d/y h:m:s'
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- paste(dates, times)
a<-strptime(x, "%m/%d/%y %H:%M:%S")
b<-strptime(times, "%H:%M:%S")
b(day)

class(strptime)




