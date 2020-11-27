library("ggplot2") # här importerar vi like olika bibliotek
library("GGally")
data <- read.csv("https://raw.githubusercontent.com/vriken/VIS4/master/VIS4Oljor.csv")
#här importerar vi våran data 
ggparcoord(data = data,
           col = c(7,8,4,11), # för uppgift två b använder vi "col = c(7,11,8,9)"       col = 4:11
           groupColumn = "Region",
           scale = "uniminmax",
           alphaLines = .2)+ # här skapar vi ett ggparcoord objekt
  # som använder sig av vårat data-objekt, och använder kolumnerna 3 genom 11
  # rad 7 gör så att vi kan kategorisera Regionerna och sätta färger på dem
  # vi använder oss av uniminmax skalan, och har satt opaciteten av linjerna till 20%
  guides(color = #här gör vi så att legend-linjerna syns utan någon opacitet
           guide_legend(override.aes =
                          list(alpha = 1, fill = NA)))+
  theme_bw() + # här sätter vi temat till bw, så att vi får en vit bakgrund
  theme(legend.key = # här sätter vi bakgrunden i legenderna vit
          element_rect(fill = "white"),
        axis.title.y =  # rad 19-52 gör så att grafen ser snyggare ut, med storlek på text. Samt olika färger och typsnitt på text
          element_text(angle = 0,
                       hjust = 1,
                       vjust = .5,
                       size = 20),
        axis.text.y = 
          element_text(size = 18),
        axis.title.x =
          element_text(size = 20),
        plot.title =
          element_text(hjust = .5,
                       size = 20,
                       face = "bold"),
        panel.grid.major.x =
          element_line(color = "grey"),
        panel.grid.minor.x =
          element_line(color = "light grey"),
        panel.grid.major.y =
          element_line(color = "grey"),
        panel.grid.minor.y =
          element_line(color = "light grey"),
        axis.text.x =
          element_text(size = 20,
                       angle = -15,
                       color = "black"),
        plot.caption = 
          element_text(hjust = 0,
                       face = "italic",
                       size = 15),
        legend.key.size = 
          unit(1.5, "line"),
        legend.text =
          element_text(size = 20),
        legend.title = 
          element_text(size = 20,
                       face = "bold")) +
  #här sätter vi titlar, och axel-namn
  labs(title = "Parallellkoordinatdiagram över halten av olika syror i Italienska olivoljor",
       x = "Syror",
       y = "Halt i %",
       caption = "Källa: Forina, Armanino, Lanteri, Tiscornia (1983) Classification of Olive Oils from
their Fatty Acid Composition, in Martens and Russwurm (ed) Food Research and Data Analysis.") +
  scale_y_continuous(labels = 
                       scales::percent_format(accuracy = 1))
#här ändrar vi så att y-skalan visas i procent
