rm(list=ls())
library(forestplot)
dat <- read.csv ('data for Figure 3.csv')
#data <- dat[dat$cut.off==5e-7,]  #for forest plot with  tea consumption-associated IVs at P<5E-7
#data <- dat[dat$cut.off==5e-6,] #for forest plot with  tea consumption-associated IVs at P<5E-6
data <- dat[dat$cut.off==5e-5,] #for forest plot with  tea consumption-associated IVs at P<5E-5
tabletext<-cbind( 
  c("SNPs",as.character(data[,3])),
  c("OR (95% CI)",as.character(data[,4])),
  c("P-value",as.character(data[,5])))
tabletext
cochrane_from_rmeta <- structure(list(
  mean =c(NA, data[,6]),
  lower =c(NA, data[,7]),
  upper =c(NA, data[,8])),
  .Names =c("mean", "lower", "upper"),
  row.names =c(NA, -13L),
  class ="data.frame")

f=forestplot(tabletext,cochrane_from_rmeta,new_page =T,
           graph.pos = 2, zero=1, 
           hrzl_lines=list("2" = gpar(lwd=2.5, col="#272727"),
                           "4" =gpar(lwd=2.5,lty=2, col ="#5B5B5B"),
                           "5" = gpar(lwd=2.5, col="#272727"),
                           "7" =gpar(lwd=2.5,lty=2, col ="#5B5B5B"),
                           "8" = gpar(lwd=2.5, col="#272727"),
                           "10" =gpar(lwd=2.5,lty=2, col ="#5B5B5B"),
                           "11" = gpar(lwd=2.5, col="#272727"),
                           "13" =gpar(lwd=2.5,lty=2, col ="#5B5B5B")
                           ),
           txt_gp=fpTxtGp(label=gpar(cex=1.8),
                          ticks=gpar(cex=1.8),
                          xlab=gpar(cex=1.8),
                          title=gpar(cex=1.8)),
           is.summary=c(T,F,F,T,F,F,T,F,F,T,F,F,T,F,F,F),
           xlog=T,
           xticks =c(0.9,0.95,1.0,1.05,1.1),
           clip=c(0.85,1.15),
           graphwidth = unit(0.3,"npc"), lineheight = unit(.2,"npc"), 
           boxsize = 0.2, 
           fn.ci_norm="fpDrawNormalCI",
           lwd.ci=3, ci.vertices=T, ci.vertices.height = 0.1,
           lwd.xaxis=2.5,
           lwd.zero=2.5,
           title="",
           #col=fpColors(box="#5091c0",line="#5091c0",zero="#ADADAD",summary="#bcddea",hrz_lines ="#808080"),#5E-7
           #col=fpColors(box="#46776d",line="#46776d",zero="#ADADAD",summary="#b9c395",hrz_lines ="#808080"),#5E-6
           col=fpColors(box="#684e94",line="#684e94",zero="#ADADAD",summary="#d5c0cf",hrz_lines ="#808080"),#5E-5
           align=c("c","c","c","c"))

