library(tidyverse)
library(palmerpenguins)

penguins |>
  ggplot(aes(x=flipper_length_mm )) +
  geom_histogram(aes(fill=species), 
                 binwidth = 5,
                 colour = 'white', 
                 alpha = 0.5,
                 position = 'identity')+
  theme_minimal()

penguins |>
  ggplot(aes(x= flipper_length_mm)) +
  geom_histogram(aes(fill=species),
                 binwidth = 5,
                 colour = 'white', 
                 alpha = 0.5,
                 position = position_dodge2(width = 0.5, 
                                            preserve = "single", 
                                            padding = -0.5)) +
 theme_minimal()

penguins
