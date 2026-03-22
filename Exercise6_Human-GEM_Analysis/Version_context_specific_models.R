library(R.matlab)
library(tidyverse)
library(ggplot2)

#import the data using R.matlab
setwd("my/path") #replace with your own path where the exported data was saved
tsneData = readMat("TSNE.mat")
x = as.numeric(tsneData$d[,,1]$tsneX)
y = as.numeric(tsneData$d[,,1]$tsneY)

#read the tissues to be able to color the models properly
tissues = read_tsv('./6811073/gtexSampTissuesForTutorial.txt', col_names = FALSE)[[1]]
tissFact = as.factor(tissues)

#set up a tibble for the plot
df = tibble(x=x, y=y, tissue = tissFact)

color_palette = c('#B5D39B','#E7B56C','#6B97BC','#BC976B','#BC556B','#000000')  

#plot the data
fig = ggplot(df, aes(x = x, y = y, color=tissue, shape=tissue)) +
  geom_point(size=2, stroke = 2) +
  scale_color_manual(values = c(color_palette,color_palette), labels = levels(tissFact) ) +
  scale_shape_manual(values = c(19,19,19,19,19,19,0,0,0,0,0,0), labels=levels(tissFact)) +
  ggplot2::labs(y=expression("t-SNE y"), x="t-SNE x", title="Structural comparison") +
  ggplot2::theme_bw() + 
  ggplot2::theme(panel.background = element_rect("white", "white", 0, 0, "white"), panel.grid.major= element_blank(),panel.grid.minor= element_blank()) +
  ggplot2::theme(legend.title = element_blank(),legend.position="bottom", legend.text=element_text(size=14)) + guides(colour = guide_legend(nrow = 4), size = guide_legend(nrow = 4), linetype = guide_legend(nrow = 4)) +
  ggplot2::theme(text = element_text(size=14),
                 axis.text.x = element_text(color='black', size=14),
                 axis.text.y = element_text(color='black', size=14))
fig

#export the figure to file
ggsave(
  "StructCompftINIT.png",
  plot = fig,
  width = 8, height = 8, dpi = 300)