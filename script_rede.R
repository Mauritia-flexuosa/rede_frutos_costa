library(tidyverse)
library(bipartite)
library(bipartiteD3)

# Pesquisa feita por alunos da Escola Básica Municipal da Costa da Lagoa.
# Eles perguntaram para os familiares mais velhos quais os frutos eram consumidos antigamente. 

# Este escript é para construir uma rede ligando os informates aos frutos citados.


rede_costa <- read.table("pesquisa_colégio.txt", h = T, row.names = 1)

rede_costa %>% head

#png("rede_costa.png", res = 300, width = 2000, height = 2000)
poll_network<-plotweb(rede_costa,  ## ajustar argumentos            
                      text.rot=c(90), labsize=1,arrow="down.center",
                      y.width.low=0.05,y.width.high=0.05, 
                      ybig=1.8, low.y=1.2, high.y=2,
                      high.spacing=.01, low.spacing=0.01,
                      # for shorter labels:
                      #high.lablength=3, low.lablength=0, 
                      method="cca", ### check the method you prefer
                      ### set colors
                      col.low="purple", col.high="orange", 
                      col.interaction = "grey80")
#dev.off()

#png("tabela.png", res = 300, width = 2000, height = 2000)
visweb(rede_costa,square="b",box.col="green",box.border="red")
#dev.off()