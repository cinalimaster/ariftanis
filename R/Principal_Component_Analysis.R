#this code created by self learning purposes may not work on you due to missing packages or input files

# principal component analysis

#data
data("bigdf")
str(bigdf)
summary(bigdf)

#partition data
#random number generator
set.seed(111)
ind <- sample(2, nrow(bigdf), 
              replace = TRUE,
              prob = c(0.8, 0.2))
training <- bigdf[ind==1,]
testing <- bigdf[ind==2,]

#scatter plot %correlations


install.packages("psych")
library(psych)
#correlation pairs
pairs.panels(training[,-1],
             gap = 0,
             bg = c("red", "yellow", "blue")[training$x001],
             pch = 21)

#convert all to numeric
training <- data.frame(lapply(training, function(x) as.numeric(as.character(x))))

#clear NA missing data from dataframe
na.omit(training)

#principal conponent analysis before PCA done all variables will become normalized
pc <- prcomp(~x001 + x002 + x003 + x004 + x005 + x006 + x007 + x008 + x009 + x010 +x011,
             data = training,
             center = TRUE,
             scale. = TRUE)


attributes(pc)
pc$center
pc$scale
print(pc)
summary(pc)
pairs.panels(pc$x,
             gap=0,
             pch = 21)

#bi-plot


install.packages("devtools")
library(devtools)

#install_github ("ggbiplot" ,"vqv")
install.packages("ggbiplot")
library(ggbiplot)

g <- ggbiplot(pc,
              obs.scale = 1,
              var.scale = 1,
              groups = training$x001,
              ellipce = TRUE,
              circle = TRUE,
              ellipse.prob = 0.68)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal',
               legend.position = 'top')
print(g)

#prediction with principal components
trg <- predict(pc, training)
trg <- data.frame(trg, training[1])
tst <- predict(pc, testing)
tst <- data.frame(tst, testing$x001)

#multinominal logistic regression with first two pcs
install.packages("nnet")
library(nnet)
trg$x001 <- relevel(trg$Species, ref = "return")
mymodel <- multinom(x001~PC1+PC2, data =trg)
summary(mymodel)

#confusion matrix &misclassification error - training

p <- predict(mymodel, trg)
tab <- table (p, trg$x001)
tab
