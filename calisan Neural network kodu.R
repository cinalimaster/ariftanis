setwd("~/R Working Directory")
library(readxl)

library(tidyr)
install.packages("EDAWR")
library(EDAWR)


na.omit(bigdf)
bigdf <- bigdf[1:10,]
install.packages("neuralnet")
library(neuralnet)
proportion <- 0.8 # set to split
index  <- sample(1:nrow(bigdf), round(proportion*nrow(bigdf)))

maxs <- apply(bigdf, 2, max)
mins <- apply(bigdf, 2, min)
scaled <- as.data.frame(scale(bigdf, center = mins, scale = maxs-mins))

train_ <- scaled[index,]
test_ <- scaled[-index,]

library(neuralnet)
n <- names(train_)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
nn <- neuralnet(f,data=train_,hidden=c(5,3),linear.output=T)











train_bigdf <- scaled[index, ]
na.omit(train_bigdf)
test_bigdf <- scaled[-index, ]
na.omit(test_bigdf)
head(train_bigdf)

head(test_bigdf)

bigdf_n <- neuralnet(x001 ~ x002+x003+x004+x005+x006+x007+x008+x009+x010+x011+
                       x012+x013+x014+x015+x016+x017+x018+x019+x020+x021+
                       x022+x023+x024+x025+x026+x027+x028+x029+x030+x031+
                       x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+
                       x042+x043+x044+x045+x046+x047+x048+x049+x050+x051+
                       x052+x053+x054+x055+x056+x057
                     , train_bigdf , hidden = c(1))

plot(bigdf_n)

pred_test <- compute(bigdf,test_bigdf[,1:57])
predtestResult <- pred_test$net.result
predtestResult <- as.data.frame((predtestResult))

colnames(predtestResult) <- c("x001p")
bigdf_testdataset <- colnames(predtestResult)[apply(predtestResult,1,which.max)]
bigdf_testdataset <- as.data.frame(bigdf_testdataset)
table(re)

#buradan itibaren kullanacagiz

iris <- bigdf2[,1:8] #dfi olusturduk
view(iris) #dfi goruntuledik
set.seed(2) #random generator
proportion <- 0.8 # set to split
index <- sample(1:nrow(iris), round(proportion*nrow(iris))) #datayi %80 %20 bolen bir index olusturduk

train_iris <- iris[index, ]  #training df parçasýný olusturduk
test_iris <- iris[-index, ] #testing df parçasýný oluþturduk

NROW(train_iris)
NROW(test_iris)

iris_n <- neuralnet(x001~x002+x003+x004+x005+x006+x007+x008, train_iris, hidden = c(2))
plot(iris_n) #neural network fitting code

pred_test <- compute(iris_n,test_iris[,2:8]) # predictionlarýmýzý test ediyoruz
predtestResult <- pred_test$net.result # predictionlarýmýzý kaydediyoruz
predtestResult <- as.data.frame(predtestResult) # predictionlarýmýzý kaydediyoruz sonra df yapýyoruz

colnames(predtestResult)<-("x001e") # tahmin df'in kolon ismini deðiþtirdik

predtestResult <- ceiling(predtestResult)

gwplot(iris_n, selected.covariate="x005")

plot(iris_n, rep="best")


est_new2 <- spread(est_new,ass_n,x001e)

library(tidyr)

est_new2 <- spread(est_new,ass_n,ass_no2)
