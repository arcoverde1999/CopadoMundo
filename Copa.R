# Carregando os Pacotes #

library(cluster)
library(vegan)
library(permute)
library(lattice)
library(factoextra)
library(NbClust)
library(ggplot2)
library(FactoMineR)
library(readxl)
library(rgeos)
library(maptools)
library(mapproj)
library(RColorBrewer)
library(rgdal)
library(ggcorrplot)
X11()

# Carregando os dados #

copa = read_excel("Copa.xlsx")

# Correlacao #

correlacao = round(cor(copa[,2:7]),3)
ggcorrplot(correlacao,hc.order = TRUE,
           type = "upper",
           lab = TRUE,
           lab_size = 3,
           method = "square",
           colors = c("tomato2","white","springgreen3"),
           title ="Correlação de Estatísticas das Campeãs",
           ggtheme = theme_minimal) + labs(subtitle = "Copa do Mundo")

# Atribuindo nomes as categorias #

campea = data.frame(copa[,2:7],row.names = copa$Equipe)

# Padronizar as Variáveis #

campea = scale(campea)

# Dist Euclidiana #

d.eucl = dist(campea,method = "euclidian")

# Dist Manhattan #

d.manh = dist(campea,method = "manhattan")

# Dist Minkowski #

d.mink = dist(campea,method = "minkowski")

# Dist Mahalonobis #

p.cov = var(campea)
p.mean = apply(campea,2,mean)
d.maha = mahalanobis(campea,p.mean,p.cov)

# Dist Euclidiana summ #

round(as.matrix(d.eucl)[1:7,1:7],2)

# Distancia Euclidiana #

# Ward #

hc.w = hclust(d.eucl,method = "ward.D2")

# Lig. Simples #

hc.sing = hclust(d.eucl,method = "sing")

# Lig. Comp #

hc.comp = hclust(d.eucl,method = "complete")

# Lig, Média #

hc.med = hclust(d.eucl,method = "average")

# Centroide #

hc.cent = hclust(d.eucl,method = "centroid")

# Cor. COfénetica #

cor(d.eucl,cophenetic(hc.w))
cor(d.eucl,cophenetic(hc.sing))
cor(d.eucl,cophenetic(hc.comp))
cor(d.eucl,cophenetic(hc.med))
cor(d.eucl,cophenetic(hc.cent))

# Dendograma - Média #

plot(hc.med)
groups <- cutree(hc.med,k=5)
rect.hclust(hc.med,k=5,border ="red")

fviz_dend(hc.med, k = 5, 
          cex = .7,horiz = T,labels_track_height = 2.5,
          main="Classificação das Campeãs da Copa do Mundo",
          xlab="", ylab="Distância Euclidiana - Ligação Média", 
          k_colors = c("aaas"),
          color_labels_by_k = TRUE,
          rect_fill = TRUE,
          rect_border = "gray", 
          rect_lty = 2,
          rect = TRUE,
) + theme_minimal()+labs(subtitle = "Fonte: FIFA")

# K-Means #

# Definir quantidade ótimas de grupos, número ótimo de grupos ->"silhueta" (para largura média da silhueta), "wss" (para total dentro da soma do quadrado) e "gap_stat" (para estatísticas de lacunas) #

fviz_nbclust(campea, kmeans, method = "silhouette")+labs(title="Número Optimizado de Clusters")

# Gerar k-means, 5 grupos e 25 conjuntos escolhidos aleatoriamente #

dados_kmeans = kmeans(campea,5, nstart = 25)

# Visualizar o Gráfico #

fviz_cluster(dados_kmeans, data=campea, ellipse.type = "t") + theme_minimal() + labs(title = "Clusters - Classificação das Campeãs da Copa do Mundo",subtitle = "K-Means")