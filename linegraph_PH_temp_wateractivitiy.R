rm(list =ls())
aps<-read.table(file="clipboard",sep="\t", header = TRUE)
aps
head(aps)
names(aps)
aps$PH <- factor(aps$PH)
      
library(ggplot2)
library(directlabels)
library(plotly)
library(plyr)
library(Rmisc)
library(grid)
library(ggExtra)
library(grid)
library(reshape2)
weed <- summarySE(aps, measurevar= ("Growth_rate_.mm.day."), groupvars=c("treat", "PH"), na.rm = FALSE, conf.interval = 0.95, .drop = TRUE)
weed

      
P<-ggplot(weed, aes(x = PH, y = Growth_rate_.mm.day., group = treat, colour = treat)) + 
        geom_line() +
        scale_colour_discrete(guide = 'none') +
        scale_x_discrete(expand=c(0, 1)) +
        geom_dl(aes(label = treat), method = list(dl.combine("first.points", "last.points"), cex = 0.8))
q<-P+labs(title="PH",x="pH", y = "Mycelium growth rates (mm per day)") 
q

#temeperature
rm(list =ls())
aps<-read.table(file="clipboard",sep="\t", header = TRUE)
aps
head(aps)
names(aps)
aps$temp <- factor(aps$temp)

weed <- summarySE(aps, measurevar= ("growth.rate"), groupvars=c("treat", "temp"), na.rm = FALSE, conf.interval = 0.95, .drop = TRUE)
weed

P<-ggplot(weed, aes(x = temp, y = growth.rate, group = treat, colour = treat)) + 
  geom_line() +
  scale_colour_discrete(guide = 'none') +
  scale_x_discrete(expand=c(0, 1)) +
  geom_dl(aes(label = treat), method = list(dl.combine("first.points", "last.points"), cex = 0.8))
q<-P+labs(title="temp",x="Temperature", y = "Mycelium growth rates (mm per day)") 
q

#Water activitities

rm(list =ls())
aps<-read.table(file="clipboard",sep="\t", header = TRUE)
aps
head(aps)
names(aps)
aps$wateractivity <- factor(aps$wateractivity)

weed <- summarySE(aps, measurevar= ("growth.rate"), groupvars=c("treat", "wateractivity"), na.rm = FALSE, conf.interval = 0.95, .drop = TRUE)
weed

P<-ggplot(weed, aes(x = wateractivity, y = growth.rate, group = treat, colour = treat)) + 
  geom_line() +
  scale_colour_discrete(guide = 'none') +
  scale_x_discrete(expand=c(0, 1)) +
  geom_dl(aes(label = treat), method = list(dl.combine("first.points", "last.points"), cex = 0.8))
q<-P+labs(title="wateractivity",x="Water activity", y = "Mycelium growth rates (mm per day)") 
q

      