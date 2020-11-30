library("dplyr") # h�r laddar vi in lte olika libraries
library("grid")
library("RColorBrewer")
source("https://raw.githubusercontent.com/canadice/visualization_literature/master/treemapbrewer.r")
#p� rad 6-7 l�ser vi in v�ran data, och tar bort eventuella rader utan n�gon data
#eller med "NA" data
data <- read.csv("https://raw.githubusercontent.com/vriken/VIS4/master/VIS4Importexport.csv")
data <- na.omit(data)
#P� rad 10 aggregerar vi v�ran data till ett nytt objekt och summerear �ver 
#Import och export medelv�rden
data_agg <- data %>% group_by(Land) %>% summarise(import_mean = mean(Import..MKr.), 
                                                     export_mean = mean(Export..MKr.))
data <- data_agg[!(data_agg$import_mean > 11 & data_agg$export_mean > 11),] 
#p� rad 12 s� anv�nder vi denna kod f�r att visa de l�nder som har en mindre export och import i sin egen graf
#p� rad 18-25 ropar vi p� v�ran treemap_brewer funktion med relevant data,
#s� att storleken (area) utg�rs av den aggregerade datans import-medelv�rde
#och f�rgen utg�rs av den aggregerade datans export-medelv�rde
#vi s�tter ocks� f�rgtema, och liknande
treemap_brewer(main = "Import och export hos Sveriges handelspartners inom EU �r 1998-2011", # denna kod g�r den f�rsta grafen
               id = data_agg$Land,
               group = data_agg$Land,
               area = data_agg$import_mean,
               color = data_agg$export_mean,
               textcol = "black",
               linecol = "black",
               pal = "GnBu")

treemap_brewer(main = "Import och export hos Sveriges handelspartners inom EU �r 1998-2011", # denna kod g�r den andra grafen
               id = data$Land,
               group = data$Land,
               area = data$import_mean,
               color = data$export_mean,
               textcol = "black",
               linecol = "black",
               pal = "GnBu")