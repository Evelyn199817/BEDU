#Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match

#Cargra la biblioteca de mongolite
library(mongolite)
# Directorio de trabajo actual y del proyecto
currentWD <- getwd()
dirProyect <- dirname(rstudioapi::getSourceEditorContext()$path)

if (dirProyect != currentWD)
{
  setwd(dirProyect) 
}

# Directorio donde se guardaran los archivos y el direcorio de trabajo donde se guardaran los archivos
dirDataFrame <- paste(dirProyect, "/data-postwork7", sep = "")
setwd(dirDataFrame)

# URL de los datos
url.data <- "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-07/Postwork/data.csv"

# Obtenemos los datos y los almacenamos en los data frames.
download.file(url = url.data, destfile = "data.csv", mode = "wb")

# Conexion con MONGO para crear una coleccionllamada "match_games"
mongo_collection = mongo(collection = "match", db = "match_games")
mongo_collection$insert(match)

# Count:conocer el número de registros que se tiene en la base
mongo_collection$count()


# realizamos la busqueda del dia 20/12/2015 dentro de la coleccion , sin embargo podemos apreciar que no se encuentran resultados de dicha busqueda
mongo_collection$find('{"Date":"2015-12-20", "HomeTeam":"Real Madrid"}')
#Podemos apreciar que dicha base de datos no muestra nungun dato referente al año del 2015, en dicho caso es recomendable el buscar informacion adjunta en una base de datos 
#diferente que contenga datos de dicho año o hacer un replanteamiento de la pregunta.

#Podemso realizar una busqueda diferente el equipo del Real Madrid
mongo_collection$find('{"Date":"2017-08-27", "HomeTeam":"Real Madrid"}')
# En este caso se encontro el resultado donde el Real Madrid Valencia tuvo un partidoque termino en empate 2-2

#Terminar la conexion con MONGO 
rm(mongo_collection)
