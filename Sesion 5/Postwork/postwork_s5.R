
# Cargamos la bibliotecas de dplyr Y fbRanks
library(dplyr) 
library(fbRanks) 
#Datos almacenados en la pagina web
sp1.esp.1718 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
sp1.esp.1819 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
sp1.esp.1920 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

sp1.esp.1720 <- list(sp1.esp.1718, sp1.esp.1819, sp1.esp.1920)
sp1.esp.1720 <- lapply(sp1.esp.1720, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

# Se obtendra la informacion de los datos.
lapply(sp1.esp.1720, FUN = function(x) { str(x)}) 

# Cambiamos el tipo de dato dentro de nuestro dataframe en la lista y con rbind se combinan los dataframe almacenados 
sp1.esp.1720[[1]] <- mutate(sp1.esp.1720[[1]], Date = as.Date(Date, "%d/%m/%y"))
sp1.esp.1720[[2]] <- mutate(sp1.esp.1720[[2]], Date = as.Date(Date, "%d/%m/%Y"))
sp1.esp.1720[[3]] <- mutate(sp1.esp.1720[[3]], Date = as.Date(Date, "%d/%m/%Y"))
sp1.esp.1720 <- do.call(rbind, sp1.esp.1720)

str(sp1.esp.1720)  
dim(sp1.esp.1720) 
head(sp1.esp.1720)
tail(sp1.esp.1720) 

# Se crea el dataframe con los datos
SmallData <- select(sp1.esp.1720, date = Date, home.team = HomeTeam,  home.score = FTHG, away.team = AwayTeam, away.score = FTAG)

# Crear un archivo csv 
write.csv(SmallData, "soccer.csv", row.names = F)
listasoccer <- create.fbRanks.dataframes("soccer.csv")

# Lista de Anotaciones y lista de equipos
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

# La fechas unicas por cada partido y el tamaño de la lista de las fechas
fecha <- unique(anotaciones$date)
n <- length(fecha)

# Ranking por equipo
ranking.teams <- rank.teams(scores = anotaciones, teams = equipos, min.date = fecha[1], max.date = fecha[n-1])
#Probabilidades que tienen los equipos
predicion <- predict(ranking.teams, date = fecha[n])
