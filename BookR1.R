

library("arules")
library("arulesViz")


Abook <- read.csv(file.choose())

class(Abook)

colnames(Abook)

Abook$ChildBks <- factor(Abook$ChildBks,levels = c("1","0"),labels = c("ChildBks",""))
Abook$YouthBks <- factor(Abook$YouthBks,levels = c("1","0"),labels = c("YouthBks",""))
Abook$CookBks <- factor(Abook$CookBks,levels = c("1","0"),labels = c("CookBks",""))
Abook$DoItYBks <- factor(Abook$DoItYBks,levels = c("1","0"),labels = c("DoItYBks",""))
Abook$RefBks <- factor(Abook$RefBks,levels = c("1","0"),labels = c("RefBks",""))
Abook$ArtBks <- factor(Abook$ArtBks,levels = c("1","0"),labels = c("ArtBks",""))
Abook$GeogBks <- factor(Abook$GeogBks,levels = c("1","0"),labels = c("GeogBks",""))
Abook$ItalCook <- factor(Abook$ItalCook,levels = c("1","0"),labels = c("ItalCook",""))
Abook$ItalAtlas <- factor(Abook$ItalAtlas,levels = c("1","0"),labels = c("ItalAtlas",""))
Abook$ItalArt <- factor(Abook$ItalArt,levels = c("1","0"),labels = c("ItalArt",""))
Abook$Florence <- factor(Abook$Florence,levels = c("1","0"),labels = c("Florence",""))


#library(car)
#library(carData)
#library(mvinfluence)

data1 <- as(Abook,"transactions")

itemFrequencyPlot(data1,topN=25)

rules <- apriori(data1, parameter = list(supp = 0.35, confidence = 0.80, minlen = 2, maxlen = 11))

inspect(head(sort(rules), n = 10))


window()
plot(rules,method ="scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")
plot(rules)

plot(head(sort(rules, by = "lift"), n = 10), method = "graph", control = list(cex = 1.0)) #cex = font size
plot(rules)
plot(head(sort(rules), n = 10), method = "grouped", control = list(cex = 0.2))

