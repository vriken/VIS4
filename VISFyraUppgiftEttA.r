library("dplyr") # här på rad 1-3 lägger vi till lite diverse libraries
library("grid")
source("https://raw.githubusercontent.com/canadice/visualization_literature/master/treemapbrewer.r")
#på rad 6-7 läser vi in våran data, och tar bort eventuella rader utan någon data
#eller med "NA" data
data <- read.csv("https://raw.githubusercontent.com/vriken/VIS4/master/VIS4Importexport.csv")
data <- na.omit(data)
#På rad 10 aggregerar vi våran data till ett nytt objekt och summerear över 
#Import och export medelvärden
data_agg <- data %>% group_by(Land) %>% summarise(import_mean = mean(Import..MKr.), 
                                                     export_mean = mean(Export..MKr.))
#data_agg <- data_agg[!(data_agg$import_mean > 11 & data_agg$export_mean > 11),] 
#på rad 12 så använder vi denna kod för att visa de länder som har en mindre export och import i sin egen graf
#på rad 18-25 ropar vi på våran treemap_brewer funktion med relevant data,
#så att storleken (area) utgörs av den aggregerade datans import-medelvärde
#och färgen utgörs av den aggregerade datans export-medelvärde
#vi sätter också färgtema, och liknande
treemap_brewer(main = "Fördelning av Import, och export i olika länder",
               id = data_agg$Land,
               group = data_agg$Land,
               area = data_agg$import_mean,
               color = data_agg$export_mean,
               textcol = "black",
               linecol = "black",
               pal = "GnBu")