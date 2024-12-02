library(tidyverse)

df <- read.csv2("camembert.csv")

df |>
  mutate (fecha = as.Date(fecha, format = "%d/%m/%Y")) |>
  ggplot(aes(x=fecha, y=est)) +
   geom_point(size = 4, color = "darkblue", fill = "blue", alpha = 0.5, shape = 21, stroke = 1.5) +
   geom_hline(aes(yintercept = mean(est)), color = "red", linetype = "dashed") +
   geom_segment(aes(x = fecha, xend = fecha, y = est, yend = mean(est)), color = "blue", linetype = "dotted") +
   theme_minimal()

df |>
  mutate (fecha = as.Date(fecha), indice = row_number()) |>
  ggplot(aes(x=indice, y=est)) +
   geom_point(size = 4, color = "darkblue", fill = "blue", alpha = 0.5, shape = 21, stroke = 1.5) +
   geom_hline(aes(yintercept = mean(est)), color = "red", linetype = "dashed") +
   geom_segment(aes(x = indice, xend = indice, y = est, yend = mean(est)), color = "blue", linetype = "dotted") +
   theme_bw()

df |>
  mutate (fecha = as.Date(fecha), indice = row_number()) |>
  ggplot(aes(x=est, y=mg)) +
   geom_point(size = 4, color = "darkblue", fill = "blue", alpha = 0.5, shape = 21, stroke = 1.5) +
   theme_bw()

df |>
  mutate (fecha = as.Date(fecha), indice = row_number()) |>
  ggplot(aes(x=est, y=mg)) +
   geom_jitter(size = 4, color = "darkblue", fill = "blue", alpha = 0.5, shape = 21, stroke = 1.5) +
   theme_bw()

df |>
  mutate (fecha = as.Date(fecha), mes = format(fecha, "%m")) |>
  ggplot(aes(x=mes, y=est)) +
   geom_boxplot() +
   theme_bw() 

