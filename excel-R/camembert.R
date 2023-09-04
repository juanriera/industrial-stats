library(tidyverse)
library(readxl)

df <- read_excel("camembert.xlsx", "BD")

df |>
  ggplot(aes(x=fecha, y=est)) +
  geom_point() +
  theme_bw()

