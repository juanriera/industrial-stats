library(tidyverse)
library(lubridate)
library(zoo)
library(qicharts2)

primer_dia <- as.Date ("2020-01-01")
ultimo_dia <- as.Date("2021-12-31")

MAX_DIAS <- as.numeric(ultimo_dia - primer_dia) + 1

df <- tibble( fecha = seq(from=primer_dia, to=ultimo_dia, by="day") )

df$diasem <- weekdays(df$fecha)
df$diasem <- factor(df$diasem, levels=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"),ordered=TRUE)
df$mes <- as.Date(cut(df$fecha, "month")) # para gráficos de control, fecha cortada por meses
df$sem <- as.Date(cut(df$fecha, "week")) # para gráficos de control mejor fecha cortada por semanas

df$est <- rnorm(nrow(df), mean=46.64, sd=1.1)

hist(df$est)

plot (df$fecha, df$est)


#######################################################
#
#
# matriz con un análisis diario de cada analista
#df <- tibble( fecha = rep( seq(from=primer_dia, to=ultimo_dia, by="day"),2), 
#              analista = rep(c("analista1","analista2"), each = MAX_DIAS))

df <- tibble( fecha = seq(from=primer_dia, to=ultimo_dia, by="day"))

# repetición de 3
# https://stackoverflow.com/questions/11121385/repeat-rows-of-a-data-frame
# df <- df |> slice(rep(1:n(), each = 3))

df$diasem <- weekdays(df$fecha)
df$diasem <- factor(df$diasem, levels=c("lunes","martes","miércoles","jueves","viernes","sábado","domingo"),ordered=TRUE)
df$mes <- as.Date(cut(df$fecha, "month")) # para gráficos de control, fecha cortada por meses
df$sem <- as.Date(cut(df$fecha, "week")) # para gráficos de control mejor fecha cortada por semanas

analista_1_mean <- 46.64
analista_1_sd <- 1.45
analista_2_mean <- 45.84
analista_2_sd <- 1.67
analista_3_mean <- 45.5
analista_3_sd <- 2.1

# creamos valores con diferente media y sd para cada analista, que rotan mensualmente
df <- df |>
  mutate (
    analista = case_when (
      month(df$mes) == 1  ~  "analista1",
      month(df$mes) == 2  ~ "analista2",
      month(df$mes) == 3  ~ "analista1",
      month(df$mes) == 4  ~ "analista2",
      month(df$mes) == 5  ~ "analista1",
      month(df$mes) == 6  ~ "analista2",
      month(df$mes) == 7  ~ "analista3",
      month(df$mes) == 8  ~ "analista3",
      month(df$mes) == 9  ~ "analista1",
      month(df$mes) == 10 ~ "analista2",
      month(df$mes) == 11 ~ "analista1",
      month(df$mes) == 12 ~ "analista2"
    ),
    est = case_when (
      analista == "analista1" ~ rnorm(n(),mean=analista_1_mean, sd=analista_1_sd),
      analista == "analista2" ~ rnorm(n(),mean=analista_2_mean, sd=analista_2_sd),
      analista == "analista3" ~ rnorm(n(),mean=analista_3_mean, sd=analista_3_sd),
    ),
    est = case_when (
      month(df$mes) == 1  ~ est - rnorm(n(),mean=1, sd=0.01),
      month(df$mes) == 2  ~ est - rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 3  ~ est - rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 4  ~ est - rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 5  ~ est - rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 6  ~ est + rnorm(n(),mean=1.3, sd=0.01),
      month(df$mes) == 7  ~ est + rnorm(n(),mean=2, sd=0.01),
      month(df$mes) == 8  ~ est + rnorm(n(),mean=1.5, sd=0.01),
      month(df$mes) == 9  ~ est + rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 10 ~ est - rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 11 ~ est - rnorm(n(),mean=1.1, sd=0.01),
      month(df$mes) == 12 ~ est - rnorm(n(),mean=1, sd=0.01)
    ),
    est = case_when (
      year(df$fecha) == 2020  ~ est,
      year(df$fecha) == 2021  ~ est - rnorm(n(),mean=1, sd=0.05),
    ),
    ges = rnorm(n(),mean=50.75, sd=1.8),
    mg = est * ges / 100,
    hfd = (100-est)/(100-mg)
  )


boxplot(df$est ~df$analista)
hist(df$est)
plot (df$fecha,df$est)

boxplot(df$est ~ df$mes)
boxplot(df$est ~ year(df$fecha))

df |>
  ggplot(aes(x=fecha, y=est)) +
  geom_point() +
  theme_bw()

df |>
  ggplot(aes(x=mes, y=est)) +
  geom_jitter() +
  stat_summary(aes(y = est, group=1), fun.y=mean, colour="red", geom="line",group=1, linewidth = 2)+
theme_bw()

df |>
  ggplot(aes(x=fecha, y=mg)) +
  geom_point() +
  theme_bw()

df |>
  ggplot(aes(x=fecha, y=hfd)) +
  geom_point() +
  theme_bw()

df |>
  ggplot(aes(x=mes, y=hfd)) +
  geom_jitter() +
  stat_summary(aes(y = (100-est)/(100-mg), group=1), fun.y=mean, colour="red", geom="line",group=1, linewidth = 2)+
  theme_bw()

# write_csv2(df, "camembert_simulacion.csv")

###################################################################################################
# Simulaciòn analistas`
#
library(ggdist)

df_analistas <- tibble( muestra = rep( seq(from=1, to=10),3), 
                           analista = rep(c("analista1","analista2", "analista3"), each = 10))

valor_real <- 46.64

analista_1_desv <- 0.5
analista_1_sd <- 1.45
analista_2_desv <- 1.5
analista_2_sd <- 1.67
analista_3_desv <- -0.7
analista_3_sd <- 2.1

df_analistas <- df_analistas |>
  mutate (
    est = case_when (
      analista == "analista1" ~ rnorm(n(),mean=valor_real, sd=analista_1_sd) + analista_1_desv * rnorm(n(),mean=0, sd=analista_1_sd) ,
      analista == "analista2" ~ rnorm(n(),mean=valor_real, sd=analista_2_sd) + analista_2_desv * rnorm(n(),mean=0, sd=analista_2_sd),
      analista == "analista3" ~ rnorm(n(),mean=valor_real, sd=analista_3_sd) + analista_3_desv * rnorm(n(),mean=0, sd=analista_3_sd),
    )
  )

boxplot(df_analistas$est ~ df_analistas$analista)

df_analistas |>
  ggplot(aes(x=factor(muestra), y=est, colour = analista)) +
  geom_point(size = 4) +
  theme_bw()

est_medio <- mean(df_analistas$est)

df_analistas |>
  group_by(analista) |>
  summarize( efecto = mean(est)-est_medio) |>
  ggplot(aes(x=analista, y=efecto)) +
  geom_line(aes(group=1))

# Dot plot — geom_dotplot • ggplot2 (tidyverse.org)
# (https://ggplot2.tidyverse.org/reference/geom_dotplot.html)
df_analistas |>
  ggplot(aes(est)) +
  geom_dotplot(colour= "firebrick4", fill = "firebrick4" ) +
  geom_hline(yintercept=0)+
  scale_y_continuous(NULL, breaks = NULL) +
  geom_point(aes(x = mean(est), y = -0.05),
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


write_csv2(df_analistas, "analistas_simulacion.csv")
