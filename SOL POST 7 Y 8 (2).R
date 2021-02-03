post 7


biblioteca ( mongolita )

setwd ( " ../Sesión 7 / " )    # dependerá de donde estén guardados tus datos
match = data.table :: fread ( " ../data.csv " )
nombres ( coincidencia )

my_collection  = mongo ( collection  =  " match " , db  =  " match_games " ) # crear conexión, base de datos y colección
my_collection $ insert ( match )   # insertando el CVS a la BDD

# Número de registros
my_collection $ count ()

# Visualizar el fichero
my_collection $ buscar ()

# Consultas básicas: ¿Cuántos goles metió como local el Real Madrid el la fecha estipulada?
my_collection $ find ( ' {"date": "2015-12-20", "home_team": "Real Madrid"} ' )

# Agregar otro CVS a la DDB
my_collection  = mongo ( collection  =  " mtcars " , db  =  " match_games " ) # crear conexión, base de datos y colección
my_collection $ insertar ( mtcars )

# Cerrando la conexión
rm ( mi_colección )







###############

` ` R
biblioteca ( fbRanks )
biblioteca ( dplyr )
biblioteca ( ggplot2 )



# Colocar el directorio de trabajo según corresponda

setwd ( " C: / Usuarios / Usuario / Documentos / Bedu / Sesion 8 / post / " )
' '

` ` R
# Descarga de archivos
# https://www.football-data.co.uk/spainm.php

u1011  <-  " https://www.football-data.co.uk/mmz4281/1011/SP1.csv "
u1112  <-  " https://www.football-data.co.uk/mmz4281/1112/SP1.csv "
u1213  <-  " https://www.football-data.co.uk/mmz4281/1213/SP1.csv "
u1314  <-  " https://www.football-data.co.uk/mmz4281/1314/SP1.csv "
u1415  <-  " https://www.football-data.co.uk/mmz4281/1415/SP1.csv "
u1516  <-  " https://www.football-data.co.uk/mmz4281/1516/SP1.csv "
u1617  <-  " https://www.football-data.co.uk/mmz4281/1617/SP1.csv "
u1718  <-  " https://www.football-data.co.uk/mmz4281/1718/SP1.csv "
u1819  <-  " https://www.football-data.co.uk/mmz4281/1819/SP1.csv "
u1920  <-  " https://www.football-data.co.uk/mmz4281/1920/SP1.csv "

# RawData <- "C: \\\"
download.file ( url  =  u1011 , destfile  = " SP1-1011.csv " , mode  =  " wb " )
download.file ( url  =  u1112 , destfile  = " SP1-1112.csv " , mode  =  " wb " )
download.file ( url  =  u1213 , destfile  = " SP1-1213.csv " , mode  =  " wb " )
download.file ( url  =  u1314 , destfile  = " SP1-1314.csv " , mode  =  " wb " )
download.file ( url  =  u1415 , destfile  = " SP1-1415.csv " , mode  =  " wb " )
download.file ( url  =  u1516 , destfile  = " SP1-1516.csv " , mode  =  " wb " )
download.file ( url  =  u1617 , destfile  = " SP1-1617.csv " , mode  =  " wb " )
download.file ( url  =  u1718 , destfile  = " SP1-1718.csv " , mode  =  " wb " )
download.file ( url  =  u1819 , destfile  = " SP1-1819.csv " , mode  =  " wb " )
download.file ( url  =  u1920 , destfile  = " SP1-1920.csv " , mode  =  " wb " )
' '

` ` R
# Lectura de datos

# lista <- lapply (list.files (ruta = RawData), read.csv)
' '

` ` R
# Procesamiento de datos

# lista <- lapply (lista, seleccionar, Fecha: FTR)

d1011  <- read.csv ( " SP1-1011.csv " )
d1112  <- read.csv ( " SP1-1112.csv " )
d1213  <- read.csv ( " SP1-1213.csv " )
d1314  <- read.csv ( " SP1-1314.csv " )
d1415  <- read.csv ( " SP1-1415.csv " )
d1516  <- read.csv ( " SP1-1516.csv " )
d1617  <- read.csv ( " SP1-1617.csv " )
d1718  <- read.csv ( " SP1-1718.csv " )
d1819  <- read.csv ( " SP1-1819.csv " )
d1920  <- read.csv ( " SP1-1920.csv " )

d1011S  <- seleccionar ( d1011 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1112S  <- seleccionar ( d1112 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1213S  <- seleccionar ( d1213 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1314S  <- seleccionar ( d1314 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1415S  <- seleccionar ( d1415 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1516S  <- seleccionar ( d1516 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1617S  <- seleccionar ( d1617 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1718S  <- seleccionar ( d1718 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1819S  <- seleccionar ( d1819 , Fecha : FTAG , BbMx.2.5 : BbAv.2.5.1 )
d1920S  <- seleccionar ( d1920 , Fecha : FTAG , Máx.2.5 : Promedio 2.5.1 )
d1920S  <- seleccionar ( d1920S , - Hora )
# colnames (d1718S); colnames (d1819S); colnames (d1920S)

# Arreglamos las fechas
d1011S  <- mutate ( d1011S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1112S  <- mutate ( d1112S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1213S  <- mutate ( d1213S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1314S  <- mutate ( d1314S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1415S  <- mutate ( d1415S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1516S  <- mutate ( d1516S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1617S  <- mutate ( d1617S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1718S  <- mutate ( d1718S , Date  = as.Date ( Date , format  =  " % d /% m /% y " ))
d1819S  <- mutate ( d1819S , Date  = as.Date ( Date , format  =  " % d /% m /% Y " ))
d1920S  <- mutate ( d1920S , Date  = as.Date ( Date , format  =  " % d /% m /% Y " ))
' '

` ` R
# Unimos de d1415S a d1819S

d1019S  <- rbind ( d1011S , d1112S , d1213S , d1314S , d1415S , d1516S , d1617S , d1718S , d1819S )
' '

` ` R
# Renombrar columnas

d1019S  <- renombrar ( d1019S ,   Max.2.5.O  =  BbMx.2.5 ,
                       Promedio 2.5.O  =  BbAv.2.5 ,
                       Máx.2.5.U  =  BbMx.2.5.1 ,
                       Promedio 2.5.U  =  BbAv.2.5.1 )

d1920S  <- renombrar ( d1920S ,   Max.2.5.O  =  Max.2.5 ,
                       Promedio 2.5.O  =  Promedio 2.5 ,
                       Max.2.5.U  =  Max.2.5.1 ,
                       Promedio 2.5.U  =  Promedio 2.5.1 )

# Ordenamos las columnas

d1019S  <- seleccionar ( d1019S , colnames ( d1920S ))

# Volvemos a unir

d1020S  <- rbind ( d1019S , d1920S )

# Renombramos

d1020S  <- de cambio de nombre ( d1020S , fecha  =  fecha , home.team  =  HomeTeam , home.score  =  FTHG , away.team  =  AwayTeam , away.score  =  FTAG )

# Ordenamos columnas

data  <- select ( d1020S , date , home.team , home.score , away.team , away.score : Avg.2.5.U ) # Este marco de datos contiene todos los datos necesarios
' '


` ` R
cabeza ( datos , n  =  2L ); cola ( datos , n  =  2L )
' '

# Data frames de partidos y equipos

` ` R
md  <-  data % > % select ( fecha : ausente.puntaje )
write.csv ( md , " match.data.csv " , row.names  =  FALSE )
df  <- create.fbRanks.dataframes ( scores.file  =  " match.data.csv " )
equipos  <-  df $ equipos ; puntuaciones  <-  df $ puntuaciones
' '


` ` R
cabeza ( equipos , n  =  2L ); dim ( equipos ); cabeza ( puntuaciones , n  =  2L ); dim ( puntuaciones )
' '

# Conjuntos iniciales de entrenamiento y de prueba

` ` R
f  <-  puntajes $ fecha  # Fechas de partidos
fu  <- único ( f ) # Fechas sin repetición
Ym  <- formato ( fu , " % Y-% m " ) # Meses y años
Ym  <- unique ( Ym ) # Meses y años sin repetir
places  <- which ( Ym [ 15 ] == formato ( puntuaciones $ fecha , " % Y-% m " )) # Consideramos partidos de 15 meses para comenzar a ajustar el modelo
ffe  <-  score $ date [max ( places )] # Fecha final conjunto de entrenamiento
' '

Consideraremos  partidos  de  15  meses  para  comenzar  a  ajustar  el  modelo.  As í, nuestro  primer  conjunto  de  entrenamiento  consiste  de  datos  de  partidos  hasta  el  `r ffe` 

` ` R
entrenar  <-  puntuaciones % > % filtro ( fecha  < =  ffe )
prueba  <-  puntuaciones % > % filtro ( fecha  >  ffe )
' '


` ` R
cabeza ( tren , n  =  1 ); cola ( tren , n  =  1 )
cabeza ( prueba , n  =  1 ); cola ( prueba , n  =  1 )
' '

# Primer ajuste del modelo

` ` R
traindate  <- único ( tren $ fecha )
testdate  <- único ( test $ date )
' '


` ` R
ranks  <- rank.teams ( puntajes  =  puntajes , equipos  =  equipos ,
                       min.date  =  traindate [ 1 ],
                       max.date  =  traindate [longitud ( traindate )])
' '

# Primera predicción


` ` R
pred  <- predecir ( rangos , fecha  =  fecha de prueba [ 1 ])
' '

` ` R
phs  <-  pred $ puntuaciones $ pred.home.score  # puntuación local prevista
pas  <-  pred $ puntuaciones $ pred.away.score  # puntuación de visitante prevista
pht  <-  pred $ puntuaciones $ home.team  # equipo local en predicciones
pat  <-  pred $ puntuaciones $ away.team  # equipo visitante en predicciones
' '

# Continuar ajustando y prediciendo


` ` R
phs  <-  NULL ; pas  <-  NULO ; pht  <-  NULL ; pat  <-  NULO
para ( i  en  1 : (longitud (único ( puntuaciones $ fecha )) - 170 )) {
  ranks  <- rank.teams ( puntajes  =  puntajes , equipos  =  equipos ,
                         min.date  = único ( puntuaciones $ fecha ) [ i ],
                         fecha máx.  = única ( puntuaciones $ fecha ) [ i + 170 - 1 ],
                         silencioso  =  VERDADERO ,
                         time.weight.eta  =  0.0005 )
  pred  <- predecir ( rangos , fecha  = único ( puntajes $ fecha ) [ i + 170 ],
                      silencioso  =  VERDADERO )
  
  phs  <- c ( phs , pred $ puntuaciones $ pred.home.score ) # puntuación local prevista
  pas  <- c ( pas , pred $ puntuaciones $ pred.away.score ) # puntuación de visitante prevista
  pht  <- c ( pht , pred $ scores $ home.team ) # equipo local en predicciones
  pat  <- c ( pat , pred $ puntuaciones $ away.team ) # equipo visitante en predicciones
}
' '

# Eliminamos NA's


` ` R
buenos  <-  ! (is.na ( phs ) | is.na ( pas )) # 
phs  <-  phs [ buenos ] # resultado local previsto
pas  <-  pas [ buenos ] # marcador visitante previsto
pht  <-  pht [ buenos ] # equipo local en las predicciones
pat  <-  pat [ buenos ] # equipo visitante en las predicciones
momio  <-  data % > % filter ( fecha  > = único ( puntajes $ fecha ) [ 171 ]) # momios conjunto de prueba
momio  <-  momio [ buenos ,]
mean ( pht  ==  momio $ home.team ); mean ( pat  ==  momio $ away.team )
mean ( phs  +  pas  >  2.5  &  momio $ home.score  +  momio $ away.score  >  2.5 )
mean ( phs  +  pas  <  2.5  &  momio $ home.score  +  momio $ away.score  <  2.5 )
hs  <-  momio $ home.score
como  <-  momio $ away.score
' '

# Probabilidades condicionales


` ` R
mean ( phs  +  pas  >  3 ) # proporción de partidos con más de tres goles según el modelo
media ( phs  +  pas  >  3  &  hs  +  as  >  2.5 ) / media ( phs  +  pas  >  3 )
# probabilidad condicional estimada de ganar en más de 2.5
mean ( phs  +  pas  <  2.1 ) # proporción de partidos con menos de 2.1 goles según el modelo
media ( phs  +  pas  <  2,1  &  hs  +  as  <  2,5 ) / media ( phs  +  pas  <  2,1 )
# probabilidad condicional estimada de ganar en menos de 2.5
' '

# Apuestas con momios máximos


` ` R
cap  <-  50000 ; g  <-  NULO

para ( j  en  1 : longitud ( phs )) {
  if ((( phs [ j ] +  pas [ j ]) >  3 ) & ( 0.64 / ( momio $ Max.2.5.O [ j ] ^ - 1 ) >  1 )) {
    if (( hs [ j ] +  as [ j ]) >  2.5 ) cap  <-  cap  +  1000 * ( momio $ Max.2.5.O [ j ] - 1 )
    else  cap  <-  cap  -  1000
    g  <- c ( g , cap )
  }
  
  if ((( phs [ j ] +  pas [ j ]) <  2.1 ) & ( 0.58 / ( momio $ Max.2.5.U [ j ] ^ - 1 ) >  1 )) {
    if (( hs [ j ] +  as [ j ]) <  2.5 ) cap  <-  cap  +  1000 * ( momio $ Max.2.5.U [ j ] - 1 )
    else  cap  <-  cap  -  1000
    g  <- c ( g , cap )
  }
}
' '

# Escenario con momios máximos

` ` R
g  <-  data.frame ( Num_Ap  =  1 : longitud ( g ), Capital  =  g )
p  <- ggplot ( g , aes ( x = Num_Ap , y = Capital )) + geom_line ( color = " púrpura " ) + geom_point () +
  laboratorios ( x  =  " Número de Apuesta " ,
                 y  =  " Capital " ,
                 title  =  " Realizando una secuencia de apuestas " ) +
  tema ( plot.title  = element_text ( tamaño = 12 ))   +
  tema ( axis.text.x  = element_text ( face  =  " negrita " , color = " azul " , tamaño  =  10 , ángulo  =  25 , hjust  =  1 ),
         axis.text.y  = element_text ( face  =  " bold " , color = " blue " , size  =  10 , angle  =  25 , hjust  =  1 ))   # color, ángulo y estilo de las abcisas y ordenadas
pags
' '

# Escenario con momios promedio

` ` R
cap  <-  50000 ; g  <-  NULO

para ( j  en  1 : longitud ( phs )) {
  if ((( phs [ j ] +  pas [ j ]) >  3 ) & ( 0.64 / ( momio $ Avg.2.5.O [ j ] ^ - 1 ) >  1 )) {
    if (( hs [ j ] +  as [ j ]) >  2.5 ) cap  <-  cap  +  1000 * ( momio $ Avg.2.5.O [ j ] - 1 )
    else  cap  <-  cap  -  1000
    g  <- c ( g , cap )
  }
  
  if ((( phs [ j ] +  pas [ j ]) <  2.1 ) & ( 0.58 / ( momio $ Avg.2.5.U [ j ] ^ - 1 ) >  1 )) {
    if (( hs [ j ] +  as [ j ]) <  2.5 ) cap  <-  cap  +  1000 * ( momio $ Avg.2.5.U [ j ] - 1 )
    else  cap  <-  cap  -  1000
    g  <- c ( g , cap )
  }
}
' '

` ` R
g  <-  data.frame ( Num_Ap  =  1 : longitud ( g ), Capital  =  g )
p  <- ggplot ( g , aes ( x = Num_Ap , y = Capital )) + geom_line ( color = " púrpura " ) + geom_point () +
  laboratorios ( x  =  " Número de Apuesta " ,
                 y  =  " Capital " ,
                 title  =  " Realizando una secuencia de apuestas " ) +
  tema ( plot.title  = element_text ( tamaño = 12 ))   +
  tema ( axis.text.x  = element_text ( face  =  " negrita " , color = " azul " , tamaño  =  10 , ángulo  =  25 , hjust  =  1 ),
         axis.text.y  = element_text ( face  =  " bold " , color = " blue " , size  =  10 , angle  =  25 , hjust  =  1 ))   # color, ángulo y estilo de las abcisas y ordenadas
pags
' '




########### POST 8

## app.R ##

## Dash board para el postwork de la sesión 8

library(ggplot2)
library(shiny)
library(shinydashboard)
#install.packages("shinythemes")
library(shinythemes)

ui <- 
  
  fluidPage(
    
    dashboardPage(
      
      dashboardHeader(title = "Predicción de Resultados"),
      
      dashboardSidebar(
        
        sidebarMenu(
          menuItem("Gráficos de barras", tabName = "Dashboard", icon = icon("dashboard")),
          menuItem("Goles casa - visitante", tabName = "goles", icon = icon("area-chart")),
          menuItem("Data Table", tabName = "data_table", icon = icon("table")),
          menuItem("Factores de ganancia", tabName = "momios", icon = icon("file-picture-o"))
          
        )
        
      ),
      
      dashboardBody(
        
        tabItems(
          
          # Histograma
          tabItem(tabName = "Dashboard",
                  fluidRow(
                    
                    titlePanel("Goles a favor y en contra por equipo"), 
                    selectInput("x", "Seleccione el valor de X",
                                choices = c("home.score", "away.score")),
                    
                    
                    plotOutput("plot1", height = 450, width = 750)
                    
                    
                  )
          ),
          
          # imágenes
          tabItem(tabName = "goles", 
                  fluidRow(
                    titlePanel(h3("Probabilidad de goles en casa y visitante")),
                    
                    img(src = "casa.png") ,
                    img(src = "visitante.png"),
                    img(src = "calor.png")
                    
                  )
          ),
          
          
          
          tabItem(tabName = "data_table",
                  fluidRow(        
                    titlePanel(h3("Data Table")),
                    dataTableOutput ("data_table")
                  )
          ), 
          
          tabItem(tabName = "momios",
                  fluidRow(
                    titlePanel(h3("Imágen de calor para la correlación de las variables")),
                    h3("Factor de ganancia Máximo"),
                    img( src = "max.png", 
                         height = 350, width = 550),
                    h3("Factor de ganancia Promedio"),
                    img( src = "prom.png", 
                         height = 350, width = 550)
                    
                    
                    
                  )
                  
          )
          
        )
      )
    )
  )

server <- function(input, output) {
  library(ggplot2)
  
  #Gráfico de barras
  output$plot1 <- renderPlot({
    
    data <-  read.csv("../match.data.csv", header = T)
    
    data <- mutate(data, FTR = ifelse(home.score > away.score, "H", ifelse(home.score < away.score, "A", "D")))
    
    x <- data[,input$x]
    
    #summary(data)
    data %>% ggplot(aes(x, fill = FTR)) + 
      geom_bar() + 
      facet_wrap("away.team") +
      labs(x =input$x, y = "Goles") + 
      ylim(0,50)
    
    
  })
  
  # Gráficas de dispersión
  output$output_momios <- renderPlot({ 
    
    ggplot(mtcars, aes(x =  mtcars[,input$a] , y = mtcars[,input$y], 
                       colour = mtcars[,input$z] )) + 
      geom_point() +
      ylab(input$y) +
      xlab(input$x) + 
      theme_linedraw() + 
      facet_grid(input$z)  #selección del grid
    
  })   
  
  #Data Table
  output$data_table <- renderDataTable( {data}, 
                                        options = list(aLengthMenu = c(10,25,50),
                                                       iDisplayLength = 10)
  )
  
}


shinyApp(ui, server)