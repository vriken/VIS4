library("dplyr") # h�r p� rad 1-3 l�gger vi till lite diverse libraries
library("grid")
source("https://raw.githubusercontent.com/canadice/visualization_literature/master/treemapbrewer.r")
#p� rad 6-7 l�ser vi in v�ran data, och tar bort eventuella rader utan n�gon data
#eller med "NA" data
data <- read.csv("https://raw.githubusercontent.com/vriken/VIS4/master/VIS4Importexport.csv")
data <- na.omit(data)
#P� rad 10 aggregerar vi v�ran data till ett nytt objekt och summerear �ver 
#Import och export medelv�rden
data_agg <- data %>% group_by(Land) %>% summarise(import_mean = mean(Import..MKr.), 
                                                     export_mean = mean(Export..MKr.))
#p� rad 16-23 ropar vi p� v�ran treemap_brewer funktion med relevant data,
#s� att storleken (area) utg�rs av den aggregerade datans import-medelv�rde
#och f�rgen utg�rs av den aggregerade datans export-medelv�rde
#vi s�tter ocks� f�rgtema, och liknande
treemap_brewer(main = "F�rdelning av Import, och export i olika l�nder",
               id = data_agg$Land,
               group = data_agg$Land,
               area = data_agg$import_mean,
               color = data_agg$export_mean,
               textcol = "black",
               linecol = "black",
               pal = "GnBu")