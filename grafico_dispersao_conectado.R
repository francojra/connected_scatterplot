
# Gráfico de dispersão conectado -----------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 24/11/23 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://r-graph-gallery.com/connected-scatterplot.html -----------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### É importante entender que um gráfico de dispersão conectado é basicamente uma
### junção entre um gráfico de dispersão e um gráfico de linhas.

### Existem dois tipos de gráficos de dispersão conectado. O primeiro é simplesmente
### um gráfico de linhas com pontos adicionados ao topo das linhas. Ele toma como
### entrada duas variáveis numéricas apenas. O segundo tipo mostra a relação entre
### duas avriáveis numéricas ao longo do tempo, e requer três variáveis numéricas.
### Para esse segundo tipo de gráfico, pode ser usado anotações sobre a terceira
### variável.

### Um terceiro tipo de gráfico comumente usado para dispersão conectada são os
### gráficos de séries temporais.

# Exemplo de gráfico de dispersão conectada com ggplot2 ------------------------------------------------------------------------------------

### O gráfico mais básico usa como camadas o geom_point() e o geom_line().

### Pacotes:

library(ggplot2)
library(dplyr)

### Carregar dados do GitHub:

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/3_TwoNumOrdered.csv", 
                   header = T)
data$date <- as.Date(data$date)
View(data)
