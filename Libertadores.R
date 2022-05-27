setwd("/cloud/project/Libertadores")

options(scipen = 999)

# Biblioteca das variáveis

# Todas as variáveis estão com seus nome colocados intuitivamente, com exceção
# das variáveis Vit_5 (vitórias em 5 jogos), Der_5 (Derrotas em 5 jogos), 
# Emp_5 (empate em 5 jogos) e Aproveitamento (Pontos conquistados por Pontos Totais)


# Pacotes

library(tidyverse)
library(factoextra)
library(NbClust)
library(cluster)
library(readxl)

# Dados

libertadores <- read_excel('Libertadores.xlsx', sheet = 'Planilha1', col_names = T)
View(libertadores)


# Tratamento

libertadores$N_Jogos <- NULL # retirada de variável irrelevante ao estudo

libertadores_tratada <- data.frame(libertadores[, 2:12], 
                                   row.names = libertadores$Equipe)

libertadores_normalizada <- scale(libertadores_tratada)


# Análise descritiva

summary(libertadores)



# Inferência dos dados

d.eucl <- dist(libertadores_normalizada, method = "euclidean")
round(as.matrix(d.eucl)[1:10, 1:10], 1)


#metodo hierarquico de Ward 
hc.w <- hclust(d.eucl, method = "ward.D2")
#metodo hierarquico da ligacao simples 
hc.sing <- hclust(d.eucl, method = "single")
#metodo hierarquico da ligacao completa
hc.comp <- hclust(d.eucl, method = "complete")
#m?todo hierarquico da ligacao media
hc.med <- hclust(d.eucl, method = "average")
#metodo hierarquico do centroide
hc.cent <- hclust(d.eucl, method = "centroid")


#correla??o cofen?tica
cor(d.eucl, cophenetic(hc.w))
cor(d.eucl, cophenetic(hc.sing))
cor(d.eucl, cophenetic(hc.comp))
cor(d.eucl, cophenetic(hc.med))
cor(d.eucl, cophenetic(hc.cent))

fviz_dend(hc.w, cex = 0.5)
fviz_dend(hc.sing, cex = 0.5)
fviz_dend(hc.comp, cex = 0.5)
fviz_dend(hc.med, cex = 0.5)
fviz_dend(hc.cent, cex = 0.5)



fviz_dend(hc.med,k=4, 
          cex = 0.5,
          main="Fase de Grupos - Libertadores 2022",
          xlab='Equipes', ylab='Distância Euclidiana - Ligação Média', 
          k_colors = c("aaas"),
          color_labels_by_k = TRUE,
          rect_fill = TRUE,
          rect_border = "gray", 
          rect_lty = 2,
          rect = TRUE 
)






