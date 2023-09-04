library(tidyverse)
library(knitr)

df <- read.csv2("camembert.csv")

tabla_frec <- df |>
  select(est) |>
#  mutate(est_group = cut_interval(est, length = 1)) |> # comparar plots no son identicos
  mutate(est_group = cut_width(est, width = 1)) |>    #
  group_by(est_group) |>
  summarize (frec = n())|>
  complete(est_group, fill = list(frec = 0))

kable(tabla_frec)

tabla_frec |>
  ggplot(aes(x=est_group, y = frec)) +
  geom_col()

df |>
  ggplot(aes(x=est)) +
    geom_histogram(colour="white", fill="dodgerblue4", binwidth = 1) +
    theme_minimal()
