library(bipartiteD3) # fazer a rede 3D interativa
library(reshape2) # função melt
library(networkD3) # função saveNetwork

rede_costa <- read.table("pesquisa_colégio.txt", h = T, rownames = 1)

costa<-melt(as.matrix(rede_costa))
costa <- subset(costa, value>0)
costa$webID <- c(rep("Frutos de antigamente na rede interativa: Quem citou quem?"))

colnames(costa)[1]<-"lower"
colnames(costa)[2]<-"higher"
colnames(costa)[3]<-"freq"

bipartite::frame2webs(costa)-> webtest

costa3D<-bipartite_D3(webtest, PrimaryLab = 'Informantes',
                     SecondaryLab = 'Frutos',
                     colouroption = 'brewer',
                     Orientation = 'vertical', ColourBy = 1,
                     MainFigSize = c(800, 1500), 
                     filename = 'demo1')

costa3D 

# saveNetwork(costa3D, "rede_interativa.html")
