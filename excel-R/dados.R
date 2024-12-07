# Simular 30 tiradas de un dado
tiradas <- sample(1:6, size = 30, replace = TRUE)

# Crear un dataframe con los resultados
df_tiradas <- data.frame(valor = tiradas)

# Crear un diagrama de barras
library(ggplot2)
ggplot(df_tiradas, aes(x = factor(valor))) +
  geom_bar() +
  xlab("Valor del Dado") +
  ylab("Frecuencia") +
  ggtitle("Frecuencia de Valores Obtenidos en 30 Tiradas de un Dado") +
  theme_minimal()

#############################
# Simular 30 tiradas de 30 dados y sumar los resultados
num_dados <- 30
num_tiradas <- 1000

tiradas <- replicate(num_tiradas, sum(sample(1:6, size = num_dados, replace = TRUE)))

# Crear un dataframe con los resultados
df_tiradas <- data.frame(valor = tiradas)

# Crear un histograma
library(ggplot2)
ggplot(df_tiradas, aes(x = valor)) +
  geom_histogram(bins = 10, fill = "lightblue", color = "black", alpha = 0.5) +
  xlab(paste("SUma del valor de ",num_dados," dados")) +
  ylab("Frecuencia") +
  ggtitle(paste("Histograma de valores acumulados en ",num_tiradas, " tiradas de ",num_dados, " dados")) +
  theme_minimal()


####################################
# En términos de distribución estadística, los resultados generados por sample() 
# y la combinación de runif() con floor() deberían ser muy similares y ambos generarán 
# números enteros entre 1 y 6. Sin embargo, hay algunas diferencias sutiles a considerar:
# - Precisión Estadística: sample() está diseñado para generar una muestra de números enteros 
# de un conjunto específico (en este caso, de 1 a 6), con igual probabilidad para cada número. 
# Esto garantiza una distribución uniforme y precisa.
# - Transformación de Números Decimales: runif() genera números decimales dentro de un rango, 
# y floor() luego transforma estos números a enteros. Aunque en teoría esto debería resultar 
# en una distribución similar a sample(), hay una ligera diferencia debido a cómo se manejan
# los bordes del rango (1 a 6.999...).
# Para ilustrarlo, aquí tienes un pequeño experimento en R comparando ambas distribuciones:


# Usando sample()
tiradas_sample <- sample(1:6, size = 10000, replace = TRUE)

# Usando runif() y floor()
tiradas_runif <- floor(runif(10000, min = 1, max = 7))

# Crear un dataframe con los resultados
df_tiradas <- data.frame(
  metodo = rep(c("sample", "runif"), each = 10000),
  valor = c(tiradas_sample, tiradas_runif)
)

# Crear histogramas comparativos
library(ggplot2)
ggplot(df_tiradas, aes(x = valor, fill = metodo)) +
  geom_histogram(position = "dodge", bins = 6) +
  xlab("Valor del Dado") +
  ylab("Frecuencia") +
  ggtitle("Comparación de Métodos de Simulación de Tiradas de Dados") +
  scale_fill_manual(values = c("sample" = "blue", "runif" = "red")) +
  theme_minimal()
