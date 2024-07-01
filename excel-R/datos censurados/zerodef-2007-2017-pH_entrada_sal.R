library(tidyverse)

df <- read.csv2("zerodef-2007-2017-pH_entrada_sal.csv")

df |>
  filter (pH_entrada_a_sal < 6) |>
  na.omit(pH_entrada_a_sal) |>
  ggplot(aes(x=fecha, y=pH_entrada_a_sal)) +
    geom_point()

