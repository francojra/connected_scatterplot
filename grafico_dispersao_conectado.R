
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

### Gráfico:

data |>
  tail(10) |>
  ggplot(aes(x = date, y = value)) +
    geom_line() +
    geom_point()

# Customizando o gráfico de dispersão conectado --------------------------------------------------------------------------------------------

### É possível customizar o tema geral do gráfico usando a função theme_ipsum()
### do pacote hrbrthemes, adicionar um título com ggtitle() e customizar pontos
### e linhas com shape, color, size, etc.

### Pacotes:

library(ggplot2)
library(dplyr)
library(hrbrthemes)

### Carregar dados do GitHub:

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/3_TwoNumOrdered.csv", 
                   header = T)
data$date <- as.Date(data$date)
View(data)

### Gráfico:

data |>
  tail(10) |>
  ggplot(aes(x = date, y = value)) +
    geom_line(color = "grey") +
    geom_point(shape = 21, color = "black", fill = "#69b3a2", size = 6) +
    theme_ipsum() +
    ggtitle("Evolution of bitcoin price")

# Gráfico de dispersão conectado para mostrar uma evolução ---------------------------------------------------------------------------------

### O gráfico de dispersão conectado pode ser um técnica poderosa para apresentar
### a história da evolução de duas variáveis. Considere um dataset composto de
### de três colunas.

### Year
### Number of baby born called Amanda this year
### Number of baby born called Ashley

### Faz sentido também adicionar setas e rótulos para guiar o leitor no gráfico.

# Libraries
library(ggplot2)
library(dplyr)
library(babynames)
library(ggrepel)
library(tidyr)
library(hrbrthemes)

# data
data <- babynames %>% 
  filter(name %in% c("Ashley", "Amanda")) %>%
  filter(sex == "F") %>%
  filter(year > 1970) %>%
  select(year, name, n) %>%
  spread(key = name, value = n, -1)

# Select a few date to label the chart
tmp_date <- data %>% sample_frac(0.3)

# plot 
data %>% 
  ggplot(aes(x=Amanda, y=Ashley, label=year)) +
     geom_point(color="#69b3a2") +
     geom_text_repel(data=tmp_date) +
     geom_segment(color="#69b3a2", 
                  aes(
                    xend=c(tail(Amanda, n=-1), NA), 
                    yend=c(tail(Ashley, n=-1), NA)
                  ),
                  arrow=arrow(length=unit(0.3,"cm"))
      ) +
      theme_ipsum()
