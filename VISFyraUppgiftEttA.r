#require(portfolio)
library("dplyr")
library("grid")
source("https://raw.githubusercontent.com/canadice/visualization_literature/master/treemapbrewer.r")
data <- read.csv("https://raw.githubusercontent.com/vriken/VIS4/master/VIS4Importexport.csv")
data <- na.omit(data)

data_agg <- data %>% group_by(Land) %>% summarise(import_mean = mean(Import..MKr.), 
                                                     export_mean = mean(Export..MKr.))

treemap_brewer(main = "Fördelning av Import, och export i olika länder",
               id = data_agg$Land,
               group = data_agg$Land,
               area = data_agg$import_mean,
               color = data_agg$export_mean,
               textcol = "black",
               linecol = "black",
               pal = "GnBu")