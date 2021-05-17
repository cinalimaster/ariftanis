#this code written for educational purposes may not work on you because of missing packages/input files

install.packages("tidyr")
install.packages("dplyr")
install.packages("neuralnet")
library(tidyr)
library(dplyr)
library(neuralnet)

## set working directory
setwd("~/R ÇALIŞMALARIM/r working dir")


## kolonlara dağılmış Fon adlarının skorlarını tek kolonda topluyoruz
testdb2 <-gather(testdb,no,"score",4:75)

## bazı kolonları çıkardık
testdb2a <- testdb2[,-3]
testdb2c <- testdb2[-(6233:6440),]

## tarih olmayan satırları çıkarıyoruz
testdb2d <- testdb2c[-which(testdb2c$date == ""), ]
testdb2e <- testdb2d[,-3]


## burada performans kriterlerini sütuna gelecek şekilde matrixi uyuzun dar bir halden geniş kısa bir hale getiriyoruz
testdb3 <-testdb2e %>% spread(type, score)

?write.csv
## sonuçlarımızı csv olarak kaydettik
write.csv(testdb3, file = "E:/okul/_PHD 5-2gb/okul tez/BIG DATA/hesaplama I/testdb.csv")


db <- testdb2y001

## satır numarası olmayan matrise ID adında bir sütun oluşturup satır numaraları verdik
testdb3$ID <- seq.int(nrow(testdb3))
y001 <- testdb3$x001

## y001 değişkenini data frame haline getirdik
y001 <- as.data.frame(y001)
y001 <- y001[-1,]
str(db)

## convert to numeric bazı veriler factor veya string olarak tanımlanmış bunları numeric'e dönüştürüyoruz.
db[, c(4:66)] <- sapply(db[, c(4:66)], as.numeric)
str(db)


## veri olmayan eksik verisi olan satırları çıkardık.
db2 <- na.omit(db)
db3 <- db
db <- db2

## Min-Max Normalization
db$y001 <- (db$y001 - min(db$y001))/(max(db$y001) - min(db$y001))

db$x001 <- (db$x001 - min(db$x001))/(max(db$x001) - min(db$x001))
db$x002 <- (db$x002 - min(db$x002))/(max(db$x002) - min(db$x002))
db$x003 <- (db$x003 - min(db$x003))/(max(db$x003) - min(db$x003))
db$x004 <- (db$x004 - min(db$x004))/(max(db$x004) - min(db$x004))
db$x005 <- (db$x005 - min(db$x005))/(max(db$x005) - min(db$x005))
db$x006 <- (db$x006 - min(db$x006))/(max(db$x006) - min(db$x006))
db$x007 <- (db$x007 - min(db$x007))/(max(db$x007) - min(db$x007))
db$x008 <- (db$x008 - min(db$x008))/(max(db$x008) - min(db$x008))
db$x009 <- (db$x009 - min(db$x009))/(max(db$x009) - min(db$x009))
db$x010 <- (db$x010 - min(db$x010))/(max(db$x010) - min(db$x010))
db$x011 <- (db$x011 - min(db$x011))/(max(db$x011) - min(db$x011))
db$x012 <- (db$x012 - min(db$x012))/(max(db$x012) - min(db$x012))
db$x013 <- (db$x013 - min(db$x013))/(max(db$x013) - min(db$x013))
db$x014 <- (db$x014 - min(db$x014))/(max(db$x014) - min(db$x014))
db$x015 <- (db$x015 - min(db$x015))/(max(db$x015) - min(db$x015))
db$x016 <- (db$x016 - min(db$x016))/(max(db$x016) - min(db$x016))
db$x017 <- (db$x017 - min(db$x017))/(max(db$x017) - min(db$x017))
db$x018 <- (db$x018 - min(db$x018))/(max(db$x018) - min(db$x018))
db$x019 <- (db$x019 - min(db$x019))/(max(db$x019) - min(db$x019))
db$x020 <- (db$x020 - min(db$x020))/(max(db$x020) - min(db$x020))
db$x021 <- (db$x021 - min(db$x021))/(max(db$x021) - min(db$x021))
db$x022 <- (db$x022 - min(db$x022))/(max(db$x022) - min(db$x022))
db$x023 <- (db$x023 - min(db$x023))/(max(db$x023) - min(db$x023))
db$x024 <- (db$x024 - min(db$x024))/(max(db$x024) - min(db$x024))
db$x025 <- (db$x025 - min(db$x025))/(max(db$x025) - min(db$x025))
db$x026 <- (db$x026 - min(db$x026))/(max(db$x026) - min(db$x026))
db$x027 <- (db$x027 - min(db$x027))/(max(db$x027) - min(db$x027))
db$x028 <- (db$x028 - min(db$x028))/(max(db$x028) - min(db$x028))
db$x029 <- (db$x029 - min(db$x029))/(max(db$x029) - min(db$x029))
db$x030 <- (db$x030 - min(db$x030))/(max(db$x030) - min(db$x030))
db$x031 <- (db$x031 - min(db$x031))/(max(db$x031) - min(db$x031))
db$x032 <- (db$x032 - min(db$x032))/(max(db$x032) - min(db$x032))
db$x033 <- (db$x033 - min(db$x033))/(max(db$x033) - min(db$x033))
db$x034 <- (db$x034 - min(db$x034))/(max(db$x034) - min(db$x034))
db$x035 <- (db$x035 - min(db$x035))/(max(db$x035) - min(db$x035))
db$x036 <- (db$x036 - min(db$x036))/(max(db$x036) - min(db$x036))
db$x037 <- (db$x037 - min(db$x037))/(max(db$x037) - min(db$x037))
db$x038 <- (db$x038 - min(db$x038))/(max(db$x038) - min(db$x038))
db$x039 <- (db$x039 - min(db$x039))/(max(db$x039) - min(db$x039))
db$x040 <- (db$x040 - min(db$x040))/(max(db$x040) - min(db$x040))
db$x041 <- (db$x041 - min(db$x041))/(max(db$x041) - min(db$x041))
db$x042 <- (db$x042 - min(db$x042))/(max(db$x042) - min(db$x042))
db$x043 <- (db$x043 - min(db$x043))/(max(db$x043) - min(db$x043))
db$x044 <- (db$x044 - min(db$x044))/(max(db$x044) - min(db$x044))
db$x045 <- (db$x045 - min(db$x045))/(max(db$x045) - min(db$x045))
db$x046 <- (db$x046 - min(db$x046))/(max(db$x046) - min(db$x046))
db$x047 <- (db$x047 - min(db$x047))/(max(db$x047) - min(db$x047))
db$x048 <- (db$x048 - min(db$x048))/(max(db$x048) - min(db$x048))
db$x049 <- (db$x049 - min(db$x049))/(max(db$x049) - min(db$x049))
db$x050 <- (db$x050 - min(db$x050))/(max(db$x050) - min(db$x050))
db$x051 <- (db$x051 - min(db$x051))/(max(db$x051) - min(db$x051))
db$x052 <- (db$x052 - min(db$x052))/(max(db$x052) - min(db$x052))
db$x053 <- (db$x053 - min(db$x053))/(max(db$x053) - min(db$x053))
db$x054 <- (db$x054 - min(db$x054))/(max(db$x054) - min(db$x054))
db$x055 <- (db$x055 - min(db$x055))/(max(db$x055) - min(db$x055))
db$x056 <- (db$x056 - min(db$x056))/(max(db$x056) - min(db$x056))
db$x057 <- (db$x057 - min(db$x057))/(max(db$x057) - min(db$x057))
db$x058 <- (db$x058 - min(db$x058))/(max(db$x058) - min(db$x058))
db$x059 <- (db$x059 - min(db$x059))/(max(db$x059) - min(db$x059))
db$x060 <- (db$x060 - min(db$x060))/(max(db$x060) - min(db$x060))
db$x061 <- (db$x061 - min(db$x061))/(max(db$x061) - min(db$x061))
db$x062 <- (db$x062 - min(db$x062))/(max(db$x062) - min(db$x062))
db$x063 <- (db$x063 - min(db$x063))/(max(db$x063) - min(db$x063))
db$x064 <- (db$x064 - min(db$x064))/(max(db$x064) - min(db$x064))
db$x065 <- (db$x065 - min(db$x065))/(max(db$x065) - min(db$x065))
db$x066 <- (db$x066 - min(db$x066))/(max(db$x066) - min(db$x066))

## save normalized matrix
write.csv(db, file = "E:/okul/_PHD 5-2gb/okul tez/BIG DATA/hesaplama I/dbnormalized.csv")

## We need this as formula
## medv ~ crim + zen + indus + chas + nox + rm + age + dis + rad + tax + ptratio + black + Lstat


## tüm değişken adlarını bir değişken yaptı
allVars <- colnames(db)  

## 5. kolon ile 66. kolon isimlerini tek bir değişken olarak atadık.
predictorVars <- colnames(db[,5:66])

## X date no y001 x001 hariç tüm değişken adlarını bir değişken yaptı (bu kodu kullanmadım)
predictorVars <- allVars[!allVars %in% c("X","date","no","y001","x001")] 

## tüm predictor variable isimlerini arasına + yazdırdı
predictorVars <- paste(predictorVars, collapse ="+") 

## neuralnet de kullanacağımız formülü tanımladık.
form=as.formula(paste("y001~", predictorVars, collapse = "+"))

# Data Partition data mızı %30 %70 olacak şekilde rastgele böldük test ve train parçalarını oluşturduk
set.seed(222)
ind <- sample(2, nrow(db), replace = TRUE, prob = c(0.7, 0.3))
trainDF <- db[ind==1,]
testiDF <- db[ind==2,]

neuralModel <- neuralnet(formula= form,
               data = db,
               hidden = c(12,12),
               err.fct = "sse",
               linear.output = FALSE, threshold = 0.005,        
               stepmax = 1e+07, algorithm = "rprop+")

plot(neuralModel)

?compute

# Prediction burada neuralnet ile tespit ettiğimiz çarpan ve sabitleri kullanarak modeli çalıştırıp
# bilinen değişkenleri girdi olarak verdiğimizde elde edeceğimiz tahmin'i oluşturup orjinal veri ile karşılaştırıyoruz.
output <- compute(neuralModel, db[,5:66])
output2 <- compute(neuralModel, db[,5:66])
head(output$net.result)
head(training[1,])

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.
View(output$net.result)
output$net.result$ID <- seq.int(nrow(testdb3))

# net.result db sinin içindeki ilk 5 sütun olan "V1,X,date,no,y001,x001" sütunlarından oluşan yeni bir dataframe tanımladık.
totalmerged <- merge(output$net.result,db[,1:5])
View(totalmerged)

# sonuçlarımızı kaydettik
write.csv(output$net.result, file = "C:/R/net.result.csv")
write.csv(db, file = "C:/R/db.csv")

output2$X <- rownames(output2)




resultDB <- output2$net.result
resultDB <- as.data.frame(resultDB)
resultDB$X <- row.names(resultDB)

# get histogram
hist(resultDB$V1)

# X sütunundaki bilgileri esas alarak resultDB ve db dataframelerini birleştirip total adında yeni bir dataframe oluşturduk.
total <- merge(resultDB,db,by="X")
View(total)


# get histogram
hist(histdb$x)





























# Node Output Calculations with Sigmoid Activation Function
in4 <- 0.0455 + (0.82344*0.7586206897) + (1.35186*0.8103448276) + (-0.87435*0.6666666667)
out4 <- 1/(1+exp(-in4))
in5 <- -7.06125 +(8.5741*out4)
out5 <- 1/(1+exp(-in5))

# Confusion Matrix & Misclassification Error - training data
output <- compute(neuralModel, training[,5:66])
p1 <- output$net.result
pred1 <- ifelse(p1>0.5, 1, 0)
tab1 <- table(pred1, training$admit)
tab1
1-sum(diag(tab1))/sum(tab1)






# Confusion Matrix & Misclassification Error - testing data
output <- compute(n, testing[,-1])
p2 <- output$net.result
pred2 <- ifelse(p2>0.5, 1, 0)
tab2 <- table(pred2, testing$admit)
tab2
1-sum(diag(tab2))/sum(tab2)





# Data Partition
set.seed(222)
ind <- sample(2, nrow(db), replace = TRUE, prob = c(0.7, 0.3))
training <- db[ind==1,]
testing <- db[ind==2,]



# Neural Networks
library(neuralnet)
set.seed(333)
n <- neuralnet(admit~gre+gpa+rank,
               data = training,
               hidden = 5,
               err.fct = "ce",
               linear.output = FALSE)
plot(n)




#predicted and real value data base islemleri

GuesDb <- DBguessRealdataMerged[,3:5]

GuesDb <-GuesDb %>% spread(no, Prediction)

write.csv(GuesDb, file = "C:/R/GuesDb.csv")

#get histogram

histdb <- DBguessRealdataMerged$Prediction
write.csv(histdb, file = "C:/R/histdb.csv")
hist(histdb$x)



## notes db3 has missing values, db2 no missing values but non normalized, db normalized and no missing value

## here i will calculate return based only ==========================================================RETURN BASED

install.packages("tidyr")
install.packages("dplyr")
install.packages("neuralnet")
library(tidyr)
library(dplyr)
library(neuralnet)



### Predictorvars for =========================================================RETURN BASED

predictorVars <- c("x001","x002")  
predictorVars <- paste(predictorVars, collapse ="+") 



## neuralnet de kullanacağımız formülü tanımladık. y001 for =========================================================RETURN BASED
form=as.formula(paste("y001~", predictorVars, collapse = "+"))

# Data Partition data mızı %30 %70 olacak şekilde rastgele böldük test ve train parçalarını oluşturduk
set.seed(222)
ind <- sample(2, nrow(db), replace = TRUE, prob = c(0.7, 0.3))
trainDF <- db[ind==1,]
testiDF <- db[ind==2,]

neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(20,10,5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.005,        
                         stepmax = 1e+07, algorithm = "rprop+")

plot(neuralModel)
View(neuralModel)

?compute

## burada bir listenin içindeki alt nesneye erişiyoruz
myoutput2 <- neuralModel$net.result[[1]]
myoutput2 <- as.data.frame(myoutput2)
View(myoutput2)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

myoutput2$ID <- seq.int(nrow(myoutput2))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(myoutput2,resultdb,by="ID")
View(totalmerged)


# sonuçlarımızı kaydettik
write.csv(totalmerged, file = "~/R ÇALIŞMALARIM/r working dir/returnbased_Results2-20-10-5.csv")
write.csv(db, file = "C:/R/db.csv")



output2$X <- rownames(output2)




resultDB <- output2$net.result
resultDB <- as.data.frame(resultDB)
resultDB$X <- row.names(resultDB)

# get histogram
hist(resultDB$V1)

# X sütunundaki bilgileri esas alarak resultDB ve db dataframelerini birleştirip total adında yeni bir dataframe oluşturduk.
total <- merge(resultDB,db,by="X")
View(total)


# get histogram
hist(histdb$x)





### Predictorvars for =========================================================RISK BASED

predictorVars <- c("x003","x004","x005","x006","x007","x008","x009","x010","x011","x012")
predictorVars <- paste(predictorVars, collapse ="+") 

## neuralnet de kullanacağımız formülü tanımladık. y001 for =========================================================RISK BASED
form=as.formula(paste("y001~", predictorVars, collapse = "+"))

# Data Partition data mızı %30 %70 olacak şekilde rastgele böldük test ve train parçalarını oluşturduk
set.seed(222)
ind <- sample(2, nrow(db), replace = TRUE, prob = c(0.7, 0.3))
trainDF <- db[ind==1,]
testiDF <- db[ind==2,]

neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(20,10,5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.005,        
                         stepmax = 1e+07, algorithm = "rprop+")

plot(neuralModel)
View(neuralModel)

?compute


## burada bir listenin içindeki alt nesneye erişiyoruz
myoutput2 <- neuralModel$net.result[[1]]
myoutput2 <- as.data.frame(myoutput2)
head(myoutput2)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

myoutput2$ID <- seq.int(nrow(myoutput2))
resultdb <- db[,7:16]
resultdb$ID <- seq.int(nrow(db[,7:16]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(myoutput2,resultdb,by="ID")
head(totalmerged)


# sonuçlarımızı kaydettik
write.csv(totalmerged, file = "~/R ÇALIŞMALARIM/r working dir/riskbased_Results-20-10-5.csv")
write.csv(db, file = "C:/R/db.csv")






### Predictorvars for =========================================================RISK BASED

predictorVars <- c("x003","x004","x005","x006","x007","x008","x009","x010","x011","x012")
predictorVars <- paste(predictorVars, collapse ="+") 

## neuralnet de kullanacağımız formülü tanımladık. y001 for =========================================================RISK BASED
form=as.formula(paste("y001~", predictorVars, collapse = "+"))

# Data Partition data mızı %30 %70 olacak şekilde rastgele böldük test ve train parçalarını oluşturduk
set.seed(222)
ind <- sample(2, nrow(db), replace = TRUE, prob = c(0.7, 0.3))
trainDF <- db[ind==1,]
testiDF <- db[ind==2,]

neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(20,10,5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.005,        
                         stepmax = 1e+07, algorithm = "rprop+")

plot(neuralModel)
View(neuralModel)

?compute


## burada bir listenin içindeki alt nesneye erişiyoruz
myoutput2 <- neuralModel$net.result[[1]]
myoutput2 <- as.data.frame(myoutput2)
head(myoutput2)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

myoutput2$ID <- seq.int(nrow(myoutput2))
resultdb <- db[,7:16]
resultdb$ID <- seq.int(nrow(db[,7:16]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(myoutput2,resultdb,by="ID")
head(totalmerged)


# sonuçlarımızı kaydettik
write.csv(totalmerged, file = "~/R ÇALIŞMALARIM/r working dir/riskbased_Results-20-10-5.csv")
write.csv(db, file = "C:/R/db.csv")





