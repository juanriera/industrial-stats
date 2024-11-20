#
# https://cran.rstudio.com/web/packages/showtext/vignettes/introduction.html
# https://fonts.google.com/
#

library(showtext)
## Loading Google fonts (https://fonts.google.com/)
font_add_google("Gochi Hand", "gochi")
font_add_google("Schoolbell", "bell")

## Automatically use showtext to render text
showtext_auto()

set.seed(123)
hist(rnorm(1000), breaks = 30, col = "steelblue", border = "white",
     main = "", xlab = "", ylab = "")
title("Histogram of Normal Random Numbers", family = "bell", cex.main = 2)
title(ylab = "Frequency", family = "gochi", cex.lab = 2)
text(2, 70, "N = 1000", family = "bell", cex = 2.5)

#
# ----------------------------------------------------------------------------
# Mi versión con ggplot


#-----------------------------------------------------------------------------
#
# https://github.com/yixuan/showtext 
#

library(showtext)
## Loading Google fonts (https://fonts.google.com/)
font_add_google("Gochi Hand", "gochi")
font_add_google("Schoolbell", "bell")
font_add_google("Covered By Your Grace", "grace")
font_add_google("Rock Salt", "rock")

## Automatically use showtext to render text for future devices
showtext_auto()

## Tell showtext the resolution of the device,
## only needed for bitmap graphics. Default is 96
showtext_opts(dpi = 96)

set.seed(123)
x = rnorm(10)
y = 1 + x + rnorm(10, sd = 0.2)
y[1] = 5
mod = lm(y ~ x)

op = par(cex.lab = 2, cex.axis = 1.5, cex.main = 2)
plot(x, y, pch = 16, col = "steelblue",
     xlab = "X variable", ylab = "Y variable", family = "gochi")
grid()
title("Draw Plots Before You Fit A Regression", family = "bell")
text(-0.5, 4.5, "This is the outlier", cex = 2, col = "steelblue",
     family = "grace")
abline(coef(mod))
abline(1, 1, col = "red")
par(family = "rock")
text(1, 1, expression(paste("True model: ", y == x + 1)),
     cex = 1.5, col = "red", srt = 20)
text(0, 2, expression(paste("OLS: ", hat(y) == 0.79 * x + 1.49)),
     cex = 1.5, srt = 15)
legend("topright", legend = c("Truth", "OLS"), col = c("red", "black"), lty = 1)

par(op)


#
# ----------------------------------------------------------------------------
# Mi versión con ggplot
library(tidyverse)
library(showtext)

## Loading Google fonts (https://fonts.google.com/)
font_add_google("Gochi Hand", "gochi")
font_add_google("Schoolbell", "bell")
font_add_google("Covered By Your Grace", "grace")
font_add_google("Rock Salt", "rock")

## Automatically use showtext to render text for future devices
showtext_auto()

## Tell showtext the resolution of the device,
## only needed for bitmap graphics. Default is 96
showtext_opts(dpi = 96)

set.seed(123)
x <- rnorm(10)
y <- 1 + x + rnorm(10, sd = 0.2)
y[1] <- 5
mod <- lm(y ~ x)

df <- data.frame (x,y)

df |> ggplot(aes( x = x, y = y)) +
  geom_point(size = 3, colour = "steelblue") + # colores: cadetblue4, dodgerblue3, firebrick4, 
  geom_smooth(method = 'lm', formula = y~x, se = F, colour = "black") +
  geom_abline(aes(slope = 1, intercept = 1), colour = "red") +
  labs(
    x = "x variable",
    y = "y variable",
    title = "Draw Plots Before You Fit A Regression",
  ) +
  geom_text(
    aes(x, y), 
    data = data.frame(x = -0.5, y = 4.75), 
    label = "This is the outlier",
    colour = "steelblue",
    family = "grace",
    size = 7
  ) + 
  geom_text(
    aes(x,y),
    data = data.frame(x = 1, y = 1.5), 
    label = expression(paste("True model: ", y == x + 1)),
    family = "rock",
    angle = 30,
    size = 6, 
    colour = "red" 
  ) +
  geom_text(
    aes(x,y),
    data = data.frame(x = 0, y = 2), 
    label = expression(paste("OLS: ", hat(y) == 0.79 * x + 1.49)),
    family = "rock",
    angle = 22,
    size = 7, 
    colour = "black" 
  ) +
  theme_bw() + 
  theme(
    plot.title = element_text(size = 24, family = "bell"),
    axis.text.x = element_text(size=14, family = "gochi"),
    axis.text.y = element_text(size=14, family = "gochi"),
    axis.title.x = element_text(size=24, family = "gochi"),
    axis.title.y = element_text(size=24, family = "gochi"),
    legend.position = "top",
    legend.text = element_text(colour="blue", size=10),
  )


               