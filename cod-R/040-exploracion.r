library(tidyverse)

df_camembert <- read.csv2("excel-R/camembert.csv",fileEncoding='latin1')
df_camembert$fecha <- as.Date(df_camembert$fecha, format("%d/%m/%Y"))
 
plot(df_camembert$est, df_camembert$mg)

df_camembert |>
  ggplot(aes(x=est,y=mg))+
  geom_point() +
  theme_bw()

library(ggplot2)

df_camembert <- df_camembert |>
  mutate(anomalos = ifelse(est > 52 | mg > 27 | (mg < 22 & est > 47), "anomalo", "normal"))

ggplot(df_camembert, aes(x = est, y = mg)) +
  geom_point(aes(fill = anomalos, color = anomalos, size = anomalos), shape = 21, stroke = 1) +
  scale_fill_manual(values = c("normal" = "grey", "anomalo" = "darkgrey")) +
  scale_color_manual(values = c("normal" = "darkgrey", "anomalo" = "red")) +
  scale_size_manual(values = c("normal" = 2, "anomalo" = 3)) +
  theme_bw() +
  labs(title = "Gráfico de dispersión destacando posiblespuntos anómalos",
       x = "Est",
       y = "Mg")


ggplot(df_camembert, aes(x = est, y = mg)) +
  geom_jitter(aes(fill = anomalos, color = anomalos, size = anomalos), shape = 21, stroke = 1) +
  scale_fill_manual(values = c("normal" = "grey", "anomalo" = "darkgrey")) +
  scale_color_manual(values = c("normal" = "darkgrey", "anomalo" = "red")) +
  scale_size_manual(values = c("normal" = 2, "anomalo" = 3)) +
  theme_bw() +
  labs(title = "Gráfico de dispersión destacando posiblespuntos anómalos",
       x = "Est",
       y = "Mg")
