library("ggplot2") # h�r importerar vi like olika bibliotek
library("GGally")
data <- read.csv("https://raw.githubusercontent.com/vriken/VIS4/master/VIS4Oljor.csv")
#h�r importerar vi v�ran data 
ggparcoord(data = data,
           col = c(7,8,4,11), # f�r uppgift tv� b anv�nder vi "col = c(7,11,8,9)"       col = 4:11
           groupColumn = "Region",
           scale = "uniminmax",
           alphaLines = .2)+ # h�r skapar vi ett ggparcoord objekt
  # som anv�nder sig av v�rat data-objekt, och anv�nder kolumnerna 3 genom 11
  # rad 7 g�r s� att vi kan kategorisera Regionerna och s�tta f�rger p� dem
  # vi anv�nder oss av uniminmax skalan, och har satt opaciteten av linjerna till 20%
  guides(color = #h�r g�r vi s� att legend-linjerna syns utan n�gon opacitet
           guide_legend(override.aes =
                          list(alpha = 1, fill = NA)))+
  theme_bw() + # h�r s�tter vi temat till bw, s� att vi f�r en vit bakgrund
  theme(legend.key = # h�r s�tter vi bakgrunden i legenderna vit
          element_rect(fill = "white"),
        axis.title.y =  # rad 19-52 g�r s� att grafen ser snyggare ut, med storlek p� text. Samt olika f�rger och typsnitt p� text
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
  #h�r s�tter vi titlar, och axel-namn
  labs(title = "Parallellkoordinatdiagram �ver halten av olika syror i Italienska olivoljor",
       x = "Syror",
       y = "Halt i %",
       caption = "K�lla: Forina, Armanino, Lanteri, Tiscornia (1983) Classification of Olive Oils from
their Fatty Acid Composition, in Martens and Russwurm (ed) Food Research and Data Analysis.") +
  scale_y_continuous(labels = 
                       scales::percent_format(accuracy = 1))
#h�r �ndrar vi s� att y-skalan visas i procent
