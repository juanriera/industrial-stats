# Instalar y cargar las librer�as necesarias
install.packages("ggplot2")
library(ggplot2)

data <- read.table("clipboard", header = TRUE, sep = "\t")
data$`% Poblaci�n Laica` <- as.numeric(sub("%", "", data$X..Poblaci�n.Laica))
data$`% Poblaci�n Hispana` <- as.numeric(sub("%", "", data$X..Poblaci�n.Hispana))

# Crear el diagrama de puntos
ggplot(data, aes(x = `% Poblaci�n Laica`, y = `% Poblaci�n Hispana`, label = Estado, group = Adscripci�n.Pol�tica, colour = Adscripci�n.Pol�tica)) +
  geom_point(size = 3) +
  geom_text(vjust = -0.5, hjust = 0.5) +
  labs(title = "Porcentaje de Poblaci�n Hispana vs. Laica en Estados de EE.UU.",
       x = "Porcentaje de Poblaci�n Laica",
       y = "Porcentaje de Poblaci�n Hispana") +
  theme_bw()

