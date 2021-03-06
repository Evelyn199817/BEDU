  
#Graficar probabilidades  marginales y conjuntas para el número de goles que anotan en un partido de cada equipo

#Instalar la libreria
library(stringr)
dirProyect <- dirname(rstudioapi::getSourceEditorContext()$path)

nameFolder <- "/Sesion 3"
dirMainFolder <- str_replace(dirProyect, nameFolder, "")
setwd(dirMainFolder)

# Dentro de la carpeta de "Sesion 2"Correr el postwork-s2.R 
pathDataSp1720 <- "Sesion 2/data-postwork2/sp1-esp-1720.csv"
sp1.esp.1720 <- read.csv(pathDataSp1720)

currentWD <- getwd()
if (dirProyect != currentWD)
{
  setwd(dirProyect) # Ponemos el directorio del proyecto
  currentWD <- dirProyect
}

# 1.- Elabora tablas de frecuencias relativas

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
str(sp1.esp.1720)
size.registers <- dim(sp1.esp.1720)[1]
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
goals.fthg <- sp1.esp.1720$FTHG
goals.ftag <- sp1.esp.1720$FTAG
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
pm.fthg <- (table(goals.fthg) / size.registers) * 100
pm.ftag <- (table(goals.ftag) / size.registers) * 100
pmc <- (table(goals.fthg, goals.ftag) / size.registers) * 100

# 2.-
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante
#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.
library(ggplot2)
#barplot: pide como argumento una matriz, que represente una tabla de contingencia con los datos a graficar.
barplot(pm.fthg, xlab = "Goles por equipo en casa", ylab = "Probabilidades marginales", main = "Probabilidades de anotar un gol jugando en casa", col = "blue", border = "red")

barplot(pm.ftag, xlab = "Goles por equipo en visitante", ylab = "Probabilidades marginales", main = "Probabilidades de anotar un gol jugando de visitante", col = "red", border = "blue")
#Probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.
# heatmap(pmc, Colv = NA, Rowv = NA, scale="row")

chart.pmc <- as.data.frame(pmc)
chart.pmc <- rename(chart.pmc, golesH = goals.fthg, golesV = goals.ftag, Frecuencia = Freq)
str(chart.pmc)

chart.pmc %>% ggplot(aes(golesH, golesV)) + 
geom_tile(aes(fill=Frecuencia)) + 
ggtitle("Probabilidades conjuntas") + 
scale_fill_gradient(low = "white", high = "steelblue")
