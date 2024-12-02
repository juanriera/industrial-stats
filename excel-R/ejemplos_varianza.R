library(tidyverse)
library(readxl)
library(scales)
library(ggdist)

muestra <- c(1,2,3,4,5,6,7)
est <- c(30.5, 31.2, 30.3, 30.4, 31.7, 30.6, 30.8)

df <- data.frame (muestra,est)

# Dot plot — geom_dotplot • ggplot2 (tidyverse.org)
# (https://ggplot2.tidyverse.org/reference/geom_dotplot.html)
df |>
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

df |> ggplot(aes(x=est, y=muestra)) +
  geom_point(size = 5, colour = "blue") +
  geom_hline(yintercept=0)+
  geom_segment(aes(x = mean(est), xend = mean(est), y=0, yend= max(muestra)), colour="red", lwd = 0) +
  geom_segment(aes(xend = mean(est), yend= muestra), colour="blue", lwd = 1, linetype="dotted") +
  scale_y_continuous(NULL, breaks = NULL) +
  geom_point(aes(x = mean(est), y = -0.3),
             shape = 17, 
             size = 10,
             color="dodgerblue4") +
  theme_classic() +
  theme (axis.line.y = element_blank(),
         axis.line.x = element_blank(),
  #       axis.ticks.y=element_blank(),
  #        axis.text.y=element_blank(),
  #        axis.title.y = element_blank()
  )

df |> ggplot(aes(x=muestra, y=est)) +
  geom_point(size = 5, colour = "blue") +
  geom_hline(yintercept = mean(est), colour = "red") +
  geom_segment(aes(xend = muestra, yend= mean(est)), colour="blue", lwd = 1, linetype="dotted") +
  theme_classic() +
  theme (axis.ticks.x=element_blank(),
         axis.text.x=element_blank(),
         axis.line.x = element_blank(),
         axis.title.x = element_blank()
         )

###################################################################################

library(dplyr)
library(ggplot2)
library (cowplot)

X <- tibble(
  x = rep(1:5, 3),
  y = c(rnorm(5, 5, 0.5),
        rnorm(5, 3, 0.3),
        rnorm(5, 4, 0.7)),
  grp = rep(LETTERS[1:3], each = 5))

X.mean <- X %>%
  group_by(grp) %>%
  summarize(y = mean(y))

X %>%
  ggplot(aes(x = x, y = y, color = grp)) +
  geom_point(shape = 19) +
  geom_hline(data = X.mean, aes(group = grp, yintercept = y, color = grp)) +
  theme_minimal()

#########################################################################################

# load library tidyverse
library(tidyverse)

# create dataframe
df <- data.frame(
  group=factor(rep(c("grupo1", "grupo2","grupo3"),
                   each=100)),
  y=round(c(rnorm(100, mean=65, sd=5),
            rnorm(100, mean=85, sd=5),
            rnorm(100, mean=105, sd=5))),
  x=rep(1:100, times = 3, length.out = NA, each = 1)
  )

# create mean by group
mean <- df%>% group_by(group)%>%summarise(mean_val=mean(y))

# create ggplot scatter plot
# add horizontal line overlay at mean using geom_hline()
ggplot(data = df, aes(x= x, y=y)) +
  geom_point(aes(colour = group)) +
  geom_hline(data= mean, aes(yintercept = mean_val,col=group)) +
  theme_minimal()

ggplot(data = df, aes(x= x, y=y)) +
  geom_point(aes(colour = group)) +
  geom_hline(data= mean, aes(yintercept = mean_val,col=group))+
  facet_grid(~group)+
  theme_minimal()
