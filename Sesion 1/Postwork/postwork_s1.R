library(dplyr)
#datos de soccer de la temporada 2019/2020 de la primera división de la liga española 
liga.football <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
size.registers <- dim(liga.football)[1]
# extrae las columnas que contienen los números de goles anotados por los equipos
goals.fthg <- liga.football$FTHG
goals.ftag <- liga.football$FTAG

pm.fthg <- (table(goals.fthg) / size.registers) * 100
pm.ftag <- (table(goals.ftag) / size.registers) * 100
pmc <- (table(goals.fthg, goals.ftag) / size.registers) * 100
# tablas de frecuencias relativas para estimar las probabilidades
print(pm.fthg)
print(pm.ftag)
print(pmc)
