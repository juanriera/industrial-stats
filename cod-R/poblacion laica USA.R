# Instalar y cargar las librerías necesarias
install.packages("ggplot2")
library(ggplot2)

data <- read.table("clipboard", header = TRUE, sep = "\t")
data$`% Población Laica` <- as.numeric(sub("%", "", data$X..Población.Laica))
data$`% Población Hispana` <- as.numeric(sub("%", "", data$X..Población.Hispana))

# Crear el diagrama de puntos
ggplot(data, aes(x = `% Población Laica`, y = `% Población Hispana`, label = Estado, group = Adscripción.Política, colour = Adscripción.Política)) +
  geom_point(size = 3) +
  geom_text(vjust = -0.5, hjust = 0.5) +
  labs(title = "Porcentaje de Población Hispana vs. Laica en Estados de EE.UU.",
       x = "Porcentaje de Población Laica",
       y = "Porcentaje de Población Hispana") +
  theme_bw()

