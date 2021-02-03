#------------------------POSTWORK 2 -------------------------- 

# Directorios del trabajo y del proyecto
currentWD <- getwd()
dirProyect <- dirname(rstudioapi::getSourceEditorContext()$path)
# Verificar el directorio , que si se este en le mismo
if (dirProyect != currentWD)
{
  setwd(dirProyect) 
}
dirDataFrame <- paste(dirProyect, "/data-postwork3", sep = "")

# Ponemos el directorio de trabajo en la carpeta donde se guardaran nuestro archivos
setwd(dirDataFrame)

# URL de los datos 
u1718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
u1819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
u1920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"

# Almacenamos en los data frames.
download.file(url = u1718, destfile = "sp1-esp-1718.csv", mode = "wb")
download.file(url = u1819, destfile = "sp1-esp-1819.csv", mode = "wb")
download.file(url = u1920, destfile = "sp1-esp-1920.csv", mode = "wb")

dir()
files.sp1.esp <- lapply(dir(), read.csv)
# str : Idealmente, solo se muestra una línea para cada estructura "básica",nos sirve para conocer el tipo y el nombre de cada todo dentro de nuestro dataframe
str(files.sp1.esp[1])

# head : traera los primeros elementos dentro nuestro data frame.
# View : muestra los datos en formato de tabla para visualizar el contenido
# summary : un resumen de cada columna de nuestro data frame.
head(files.sp1.esp[1])
View(files.sp1.esp[1])
summary(files.sp1.esp[1])

library(dplyr)

# Seleccionar las  variables y cambiarlas el tipo de nuestras variables de cada archivo en la lista
files.sp1.esp <- lapply(files.sp1.esp, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

str(files.sp1.esp)

files.sp1.esp <- lapply(files.sp1.esp, mutate, Date = as.Date(Date, "%Y-%m-%d"))

str(files.sp1.esp) # Verificamos que nuestra salida sea correcta

# Combinamos los documentos en un SOLO data frame.
sp1.esp.1720 <- do.call(rbind, files.sp1.esp)
sp1.esp.1720 <- sp1.esp.1720[order(sp1.esp.1720$Date), ]

str(sp1.esp.1720)
dim(sp1.esp.1720) 
head(sp1.esp.1720)
tail(sp1.esp.1720) 

# Data frame como csv.
write.csv(sp1.esp.1720, "sp1-esp-1720.csv", row.names = F)
