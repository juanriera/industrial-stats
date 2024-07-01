library(tidyverse)
library(readxl)
library(ggdist)

df <- read_excel("excel-R/dibujos_varianza.xlsx","Total_BD_2")
df2 <- pivot_longer(df, !id, names_to="analista", values_to="extracto_seco_total") 

qqnorm(df$analista1)
qqline(df$analista1, col="red")
hist(df$analista1)

df2 |>
  ggplot(aes(x=analista, y=extracto_seco_total)) +
  geom_boxplot() +
  geom_jitter(width = 0.1) +
  theme_bw()

est_medio <- mean(df2$extracto_seco_total)

df2 |>
  group_by(analista) |>
  summarize( efecto = mean(extracto_seco_total)-est_medio) |>
  ggplot(aes(x=analista, y=efecto)) +
  geom_line(aes(group=1))

# Dot plot — geom_dotplot • ggplot2 (tidyverse.org)
# (https://ggplot2.tidyverse.org/reference/geom_dotplot.html)
df |>
  ggplot(aes(analista1)) +
  geom_dotplot(colour= "firebrick4", fill = "firebrick4" ) +
  geom_hline(yintercept=0)+
  scale_y_continuous(NULL, breaks = NULL) +
  geom_point(aes(x = mean(analista1), y = -0.05),
             shape = 17, 
             size = 10,
             color="dodgerblue4") +
  theme_classic() +
  theme(
    legend.position = "none",
    axis.text.y=element_blank(), #remove y axis labels
    axis.line.x = element_blank(),
    axis.line.y = element_blank(),
  )

est_medio <- mean(df$analista1)
df |>
  ggplot(aes( x = analista1, y = id)) +
  geom_hline(yintercept=0)+
  geom_segment(aes(x = mean(analista1), 
                   y = 0, 
                   xend = mean(analista1), 
                   yend= max(id)), 
                   colour="dodgerblue4", linewidth = 0, linetype="dashed") +
  geom_segment(aes(xend = mean(analista1), yend= id), colour="firebrick4", lwd = 0, linetype="dashed") +
  ylim(-1,30) +
  geom_point(aes(x = mean(analista1), y = -1),
             shape = 17, 
             size = 10,
             color="dodgerblue4") +
  geom_point(colour = "firebrick4", size = 5) +
#  scale_y_continuous(NULL, breaks = NULL) +
  theme_classic() +
  theme(
    legend.position = "none",
    axis.text.y=element_blank(), #remove y axis labels
    axis.title.y = element_blank(), 
    axis.line.x = element_blank(),
    axis.line.y = element_blank(),
      
  )

stem(df$analista1)
## ----------------------------------------------------------------------------------------
# https://www.behance.net/gallery/100638417/Not-My-Cup-of-Coffee
# https://stackoverflow.com/questions/34522732/changing-fonts-in-ggplot2

library(showtext)
showtext_auto()

df2 <- df2 |>
  mutate ( y = as.numeric(factor(analista))) |>
  group_by (analista) |>
  mutate (
    media = mean(extracto_seco_total),
    mediana = median(extracto_seco_total),
    minimo  = min(extracto_seco_total)
    )

df2 |>
  ggplot(aes(x = extracto_seco_total, y = analista)) +
  stat_dots(
    quantiles = NA,
    orientation = "horizontal",
    normalize = "none",
    scale = 0.5,
    color = "firebrick4",
    fill = "firebrick4"
  ) +
  geom_point(aes(x = media, y = y -0.15),
             shape = 17, 
             size = 7,
             color="dodgerblue4") +
  theme_minimal()

g <- df2 |>
  ggplot(aes(x = extracto_seco_total, y = y)) +
    stat_dots(
      quantiles = NA,
      orientation = "horizontal",
      normalize = "none",
      scale = 0.5,
      color = "firebrick4",
      fill = "firebrick4"
    ) +
    geom_point(aes(x = media, y = y -0.15),
                 shape = 17, 
                 size = 7,
                 color="dodgerblue4") +
    # geom_point(aes(x = mediana, y = y -0.2),
    #          shape = 17, 
    #          size = 3,
    #          color="firebrick4") + 
    # stat_interval(
    #   aes(y = y - 0.05),
    #   orientation = "horizontal",
    #   .width = c(.25, .5, .95, 1),
    #   stroke = 0,
    #   size = 1.4
    # ) +

    geom_segment(aes(xend = minimo, yend = y), linewidth = 1) + 
    geom_text(
      aes(
        x = min(minimo) - 10,
        y = y,
        label = analista,
        size = 4
      ),
      family = "Roboto",
      color = "dodgerblue4",
      vjust = 0,
      hjust = -0.01
    ) +
   scale_y_continuous(NULL, breaks = NULL) +
   theme_classic() +
   theme(
      axis.text.y=element_blank(), #remove y axis labels
      axis.line.x = element_blank(),
      axis.line.y = element_blank(),
      axis.ticks.y = element_blank(),
      axis.title.y = element_blank(),
      legend.position = "none"
    )

g

## Save to PNG 
ggsave("plot_medias.png", plot = g, 
       type = 'cairo',
       width = 6, height = 6, dpi = 150)  

## Save to PDF
ggsave("plot_medias.pdf", plot = g, 
       device = cairo_pdf,
       width = 6, height = 6, dpi = 150) 

