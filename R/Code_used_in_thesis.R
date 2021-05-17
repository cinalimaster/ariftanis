#this code written for self education purpose may not work on you due to missing packages/input data files

## Gerekli kütüphane ve paketlerin kurulumu
install.packages("tidyr") install.packages("dplyr") 
install.packages("neuralnet") install.packages("ggplot2")
install.packages("pastecs") install.packages("readr")
install.packages("rlang") library(tidyr) library(dplyr)
library(neuralnet) library(ggplot2) library(pastecs) library(readr)
library(rlang) 

## Load R data file
## working directory öğrenme
getwd()

## data dosyasını working directory içine kopyalama
load("R-data.RData", envir = parent.frame())

## gather ile vektörleri bir araya toplama 
X3MReturn$ ID <- seq.int(nrow(X3MReturn))
X3MReturn2 <- gather(X3MReturn, "ID","score", 2:73)

## Write csv olarak kaydet
write.csv(X3MReturn2, file = "G:/okul tez/BIG DATA/
hesaplama J/3aylıkExtracted.csv")

=========HAZIRLIK 1. AŞAMA============

## boşlukları 0 ile doldurma
X3Mdb0filled <- X3Mdb
X3Mdb0filled[is.na(X3Mdb)] <- 0

# fon skorlarını birleştirme
X3Mdb0filledGATHER <- gather(X3Mdb0filled, "no","score", 4:75)

# fon türlerine göre dağıtma
X3Mdb0filledSPREAD <- X3Mdb0filledGATHER %>% spread(type, score)
View(X3Mdb0filledSPREAD)

# Write csv olarak kaydetme
write.csv(X3Mdb0filledSPREAD, file = "G:/okul tez/BIG DATA/
hesaplama J/
X3Mdb0filledSPREAD.csv")

# Write csv olarak kaydetme
write.csv(X3Mdb0filledGATHER, file = "G:/okul tez/BIG DATA/
hesaplama J/
X3Mdb0filledGATHER.csv")

=========HAZIRLIK 2. AŞAMA============

# Gereksiz nesnelerin temizleme
rm(X3Mdb0filledSPREAD) rm(X3Mdb0filledGATHER)
rm(X3Mdb) rm(X3Mdb0filled) library(readxl)

# Gerekli nesneyi dosyadan yükleme
X3Mdb <- read_excel("G:/okul tez/BIG DATA/hesaplama J/
ultraMEGAsuper3Mdb.xlsx")

## boşlukları 0 ile doldurma
X3Mdb0 <- X3Mdb
X3Mdb0[is.na(X3Mdb)] <- 0

# fon skorlarını birleştirme
X3Mdb0G <- gather(X3Mdb0, "no","score", 4:75)
View(X3Mdb0G)

# fon türlerine göre dağıtma
X3Mdb0S <- X3Mdb0G %>% spread(type, score)
View(X3Mdb0S)

# Write csv olarak kaydetme
write.csv(X3Mdb0S, file = "G:/okul tez/BIG DATA/
hesaplama J/X3Mdb0S.csv")

=========VERİ TABANI OLUŞTURULDU============
## Gerekli kütüphanelerin kurma
install.packages("tidyr") install.packages("dplyr")
install.packages("neuralnet") library(tidyr)
library(dplyr) library(neuralnet)

##Gereksiz objectleri temizle X3Mdb0S matrisini normalize et
rm(AbsoluteRiskbased) rm(AbsoluteRiskbased2)
rm(AbsoluteRiskbased3) rm(db) rm(db2) rm(db3)
rm(DBguessRealdataMerged) rm(DifMarketCondbased)
rm(DifMarketCondbased2) rm(DifMarketCondbased3)
rm(ExtrMarkCondbased) rm(ExtrMarkCondbased2)
rm(ExtrMarkCondbased3) rm(GeneralBenchbased)
rm(GeneralBenchbased3) rm(GeneralBenchbased2)
rm(GuesDb) rm(histdb) rm(neuralModel) rm(output)
rm(output2) rm(p1) rm(PortManagerbased)
rm(PortManagerbased2) rm(PortManagerbased3)
rm(resultdb) rm(resultDB) rm(returnbased)
rm(returnbased2) rm(returnbased3) rm(riskbased)
rm(riskbased2) rm(riskbased3) rm(testdb2y001)
rm(testiDF) rm(testing) rm(totalmerged)
rm(trainDF) rm(training) rm(unclassifiedbased)
rm(unclassifiedbased2) rm(unclassifiedbased3)
rm(X3MReturn) rm(X3MReturn2)

Norm_X3Mdb0S <- X3Mdb0S[,3:66]
maxs <- apply(Norm_X3Mdb0S, 2, max) 
mins <- apply(Norm_X3Mdb0S, 2, min)
Scaled_X3Mdb0S <- as.data.frame(scale(Norm_X3Mdb0S, 
center = mins, scale = maxs - mins))

#Merge yaparak data frameleri birleştirme
#iki data frame e ID kolonu ata
Scaled_X3Mdb0S$ ID <- seq.int(nrow(Scaled_X3Mdb0S))
X3Mdb0S$ ID <- seq.int(nrow(X3Mdb0S))
totalmerged <- merge(X3Mdb0S[, c("date","no","ID")], 
Scaled_X3Mdb0S,by="ID")

#neural net öncesi data matrisin son hali
db <- totalmerged

##=====BIG STAGE A=====
db <- X3MdbSPREAD_normalized_2

##Eksik veri içeren satırların temizlenmesi
db <- ikiyonlunormalizeedilmisDB_03aralik2018_FORCSV
db <- na.omit(db)

#------stage 1 return based 
predictorVars <- "x000+x001+x002"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
set.seed(222)
ind <- sample(2, nrow(db), replace = TRUE, prob = c(0.7, 0.3))
trainDF <- db[ind==1,]
testiDF <- db[ind==2,]
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(2),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)
#adding ID row to net.result satır numarası olmayan 
bir dataframe'e ID adında bir kolon oluşturup satır numarası ver
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe'i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "returnbased"
write.csv(totalmerged, file = "C:/R/returnbased.csv")

#----- Experimental Risk+Return Based ---------
#=====stage 1 risk + return based 
predictorVars <- "x000+x001+x002+x003+ x004+x005+x006+x007+x008+ 
x009+x010+x011+x012"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(9),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,     
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)


#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe'i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "riskANDreturnbased"
write.csv(totalmerged, file = "C:/R/riskANDreturnbased.csv")

#=====stage 2 risk based====== 
predictorVars <- "x003+ x004+x005+ x006+x007+x008+ x009+x010+
x011+x012"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(8),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "riskbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/riskbased.csv")

#=====stage 3 portfolio manager based========= 
predictorVars <- "x013+x014+x015+ x016+x017+ x018+x019"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))

neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "PortManagerbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/PortManagerbased.csv")

#=====stage 4 general benchmark based===== 
predictorVars <- "x019+x020+x021+ x022+x023+x024+ x025+x026"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(6),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01, 
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "GeneralBenchbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/GeneralBenchbased.csv")

#=====stage 5 absolute risk based=======
predictorVars <- "x026+x027+x028+x029+x030+x031+x032+x033+
x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(13),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.02,  
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "AbsoluteRiskbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/AbsoluteRiskbased.csv")

#=====stage 6 extreme market condition based===
predictorVars <- "x045+x046+x047+x048+x049+x050+x051"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,   
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "ExtrMarkCondbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/ExtrMarkCondbased.csv")

#=====stage 7 different market conditions related based 
predictorVars <- "x052+x053+x053+x054+x055+x056+x057"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.02,   
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "DifMarketCondbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/DifMarketCondbased.csv")

#=====stage 8 unclassified based===== 
predictorVars <- "x058+x059+x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(4),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,   
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "unclassifiedbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/unclassifiedbased.csv")

#=====stage 9 BARIS CRITERIA return based 
predictorVars <- "x000+x001+x003+x004+x005+x013+x016+
x017+x019+x022+ x023+x029+x031+x036+x037+x045+x047+
x052+ x056"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(13),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01, 
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "barisbased"
head(totalmerged)
write.csv(totalmerged, file = "C:/R/barisbased.csv")

#=====BIG STAGE B=======
#=====1 All vars included====
rm(predictorVars)
rm(form)
predictorVars <- colnames(db[,4:66])
predictorVars <- paste(predictorVars, collapse ="+") 
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(32),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01, 
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsincluded"
write.csv(totalmerged, file = "C:/R/stageB/allvarsincluded.csv")

#=====2 All vars-Return======  
rm(predictorVars)
rm(form)
predictorVars <- "x003+x004+x005+x006+x007+x008+x009+x010 
+x011+x012+x013+x014+x015+x016+x017+x018+x019+x020
+x021+x022+x023+x024+x025+x026+x027+x028+ x029+x030+
x031+x032+x033+x034+x035+x036+x037+x038+x039+x040
+x041+x042+x043+x044+x045+x046+x047+x048+x049+
x050+x051+x052+x053+x053+x054+x055+x056+x057+x058+
x059+x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(31),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExReturn"
write.csv(totalmerged, file = "C:/R/stageB/All-Return.csv")

#=====3 All vars-Risk============ 
rm(predictorVars)
rm(form)
predictorVars <- "x000+x001+x002+x027+x028+x029+x030+x031+
x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+
x043+x044+x045+x046+x047+x048+x049+x050+x051+x052+x053+
x053+x054+x055+x056+x057+x058+x059+x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(27),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExRisk"
write.csv(totalmerged, file = "C:/R/stageB/All-Risk.csv")

#=====4 All vars-PortMan============
rm(predictorVars)
rm(form)
## to remove any object from environment rm(objectname)
rm(predictorVars)
predictorVars <- "x000+x001+x002+x003+x004+x005+x006+x007
+x008+x009+x010+x011+ x012+x019+x020+x021+ x022+x023+
x024+x025+x026+x027+x028+x029+ x030+x031+x032+x033+
x034+x035+x036+x037+ x038+x039+x040+x041+x042+
x043+x044+x045+x046+x047+x048+x049+ x050+x051+
x052+x053+ x053+x054+x055+x056+ x057+x058+x059+x060+ 
x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(29),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,    
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExPortMan"
write.csv(totalmerged, file = "C:/R/stageB/allvarsExPortMan.csv")

#=====5 All vars-GeneralBench==============
rm(predictorVars)
rm(form)
predictorVars <- "x000+x001+x002+x003+ x004+x005+x006+x007+
x008+x009+x010+x011+ x012+x013+x014+x015+ x016+x017+
x018+x027+ x028+x029+x030+x031+ x032+x033+x034+x035+
x036+x037+x038+x039+ x040+x041+x042+x043+ x044+
x045+x046+x047+ x048+x049+x050+x051+x052+x053+
x053+x054+ x055+x056+x057+x058+ x059+x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
form
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(28),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExGenBench"
write.csv(totalmerged, file = "C:/R/stageB/allvarsExGenBench.csv")

#=====6 All vars-AbsRisk=====
rm(predictorVars)
rm(form)
predictorVars <- "x000+x001+x002+x003+x004+x005+x006+
x007+x008+x009+x010+x011+x012+ x013+x014+x015+x016+
x017+ x018+x019+x020+x021+x022+x023+x024+x025+x045+
x046+ x047+x048+x049+x050+x051+ x052+x053+x053+
x054+x055+ x056+x057+x058+x059+x060+ x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(22),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExAbsRisk"
write.csv(totalmerged, file = "C:/R/stageB/allvarsExAbsRisk.csv")

#=====7 All vars-ExtMarket============
rm(predictorVars)
rm(form)
predictorVars <- "x000+x001+x002+x003+x004+x005+x006+x007
+x008+x009+x010+x011+x012+x013+ x014+x015+x016+x017+ 
x018+x019 + x020+x021+x022+x023+ x024+x025+x026+x027+
x028+ x029+x030+x031+x032+x033+ x034+x035+x036+x037+
x038+ x039+x040+x041+x042+x043+ x044+x052+x053+x053+
x054+x055+x056+x057+x058+x059+ x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(28),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01, 
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExExtMarket"
write.csv(totalmerged, file = "C:/R/stageB/All-ExtMarket.csv")

#=====8 All vars-difMarket========
rm(predictorVars)
rm(form)
predictorVars <- "x000+x001+x002+x003+x004+x005+x006+x007
+x008+x009+x010+x011+x012+x013+x014+x015+x016+x017+x018+
x019+x020+x021+x022+x023+x024+x025+x026+x027+x028+x029+
x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+
x041+x042+x043+x044+x045+x046+x047+x048+x049+x050+x051+
x058+x059+x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(29),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExdifMarket"
write.csv(totalmerged, file = "C:/R/stageB/All-difMarket.csv")

#=====9 All vars-unclass===========
rm(predictorVars)
rm(form)
predictorVars <- "x000+x001+x002+x003+x004+x005+x006+x007+ 
x008+x009+x010+x011+x012+x013+x014+x015+x016+x017+x018+
x019+x020+x021+x022+x023+x024+x025+x026+x027+x028+x029+
x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+
x041+ x042+x043+x044+x045+x046+x047+x048+x049+x050+x051+
x052+x053+x053+x054+x055+x056+x057"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(29),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,   
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExUnclass"
write.csv(totalmerged, file = "C:/R/stageB/All-Unclass.csv")

#=====10 All vars-baris
rm(predictorVars)
rm(form)

predictorVars <- "x002+x006+x007+x008+x009+x010+x011+x012+
x014+ x015+x018+x020+x021+ x024+x025+x026+x027+ x028+x030+
x032+x033+ x034+x035+x038+x039+x040+x041+x042+x043+x044+
x046+x048+x049+ x050+x051+x053+x053+ x054+x055+x057+x058+
x059+x060+x061+x062"
form=as.formula(paste("y00q~", predictorVars, collapse = "+"))
neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(22),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,
                         stepmax = 1e+05, algorithm = "rprop+")
plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişme
output <- neuralModel$ net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir
dataframe'e ID adında bir kolon oluşturup satır numarası verme
output$ ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirme 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)
colnames(totalmerged)[2] <- "allvarsExbaris"
write.csv(totalmerged, file = "C:/R/stageB/All-baris.csv")

##=====burada uzun csv leri fon adlarına göre ayırma
install.packages("tidyr")
install.packages("dplyr")
install.packages("neuralnet")
library(tidyr)
library(dplyr)
library(neuralnet)

##=====burada performans kriterlerini sütuna gelecek şekilde
matrixi uyuzun dar bir halden geniş kısa bir hale getirme
AbsoluteRiskbased2 <-AbsoluteRiskbased %>% spread(no, 
AbsoluteRiskbased)
AbsoluteRiskbased3 <-gather(AbsoluteRiskbased2, date,no,8:75)
AbsoluteRiskbased2 <-AbsoluteRiskbased [,c(-1,-2,-4,-7,-8,-9)]
AbsoluteRiskbased3 <-AbsoluteRiskbased2 %>% spread(no, 
AbsoluteRiskbased)

# Write CSV in R
write.csv(AbsoluteRiskbased3, file = "G:/okul tez/BIG
DATA/hesaplama J/25 ekim 2018/R/
AbsoluteRiskbased3.csv")

#uzun listeden fonlary ayırma
# Alternatively, install just tidyr:
install.packages("tidyr")
library(tidyr)

# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("tidyverse/tidyr")
table <- X004_fon_hisse_yogun_fonlar_cuma_gÃ_nleri_02
table2 <- table %>% spread(fund_code, price)

# Write CSV in R
write.csv(table2, file = "fonlar_ayrilmis_haftalik.csv")

##=====Gather Spread Stage 3=====
library(readr)

##DIFMARKET COND
# csv den R ortamına import etme
DifMarketCondbased <- read_csv("C:/R/DifMarketCondbased.csv")

# gereksiz satırları çıkarma
DifMarketCondbased2 <-DifMarketCondbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
DifMarketCondbased3 <-DifMarketCondbased2 %>% spread(no, 
DifMarketCondbased)
View(DifMarketCondbased3)

# Write csv olarak kaydetme
write.csv(DifMarketCondbased3, file = "C:/R/
DifMarketCondbased-sep.csv")
rm(DifMarketCondbased)
rm(DifMarketCondbased2)
rm(DifMarketCondbased3)

##EXTREME MARKET COND
# csv den R ortamına import etme
ExtrMarkCondbased <- read_csv("C:/R/ExtrMarkCondbased.csv")

# gereksiz satırları çıkarma
ExtrMarkCondbased2 <-ExtrMarkCondbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
ExtrMarkCondbased3 <-ExtrMarkCondbased2 %>% spread(no, 
ExtrMarkCondbased)
View(ExtrMarkCondbased3)

# Write csv olarak kaydetme
write.csv(ExtrMarkCondbased3, file = "C:/R/
ExtrMarkCondbased-sep.csv")
rm(ExtrMarkCondbased)
rm(ExtrMarkCondbased2)
rm(ExtrMarkCondbased3)

##GENERAL BENCHMARK BASED
# csv den R ortamına import et
GeneralBenchbased <- read_csv("C:/R/GeneralBenchbased.csv")

# gereksiz satırları çıkarma
GeneralBenchbased2 <-GeneralBenchbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
GeneralBenchbased3 <-GeneralBenchbased2 %>% spread(no, 
GeneralBenchbased)
View(GeneralBenchbased3)

# Write csv olarak kaydetme
write.csv(GeneralBenchbased3, file = "C:/R/GeneralBenchbased-
sep.csv")
rm(GeneralBenchbased)
rm(GeneralBenchbased2)
rm(GeneralBenchbased3)

##PORTFOLIO MANAGER BASED
# csv den R ortamına import et
PortManagerbased <- read.csv("C:/R/PortManagerbased.csv")

# gereksiz satırları çıkarma
PortManagerbased2 <- PortManagerbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
PortManagerbased3 <- PortManagerbased2 %>% spread(no, 
PortManagerbased)
View(PortManagerbased3)

# Write csv olarak kaydetme
write.csv(PortManagerbased3, file = "C:/R/PortManagerbased-
sep.csv")
rm(PortManagerbased)
rm(PortManagerbased2)
rm(PortManagerbased3)
##RETURN BASED

# csv den R ortamına import etme
returnbased <- read.csv("C:/R/returnbased.csv", header=TRUE)

# gereksiz satırları çıkarma
returnbased2 <- returnbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
returnbased3 <- returnbased2 %>% spread(no, returnbased)

# Write csv olarak kaydetme
write.csv(returnbased3, file = "C:/R/returnbased-sep.csv")
rm(returnbased)
rm(returnbased2)
rm(returnbased3)

###RISK BASED
# csv den R ortamına import etme
riskbased <- read_csv("C:/R/riskbased.csv")

# gereksiz satırları çıkarma
riskbased2 <- riskbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
riskbased3 <- riskbased2 %>% spread(no, riskbased)

# Write csv olarak kaydetme
write.csv(riskbased3, file = "C:/R/riskbased-sep.csv")
rm(riskbased)
rm(riskbased2)
rm(riskbased3)

##RISKANDRETURN BASED
# csv den R ortamına import etme
riskbased <- read_csv("C:/R/riskANDreturnbased.csv")

# gereksiz satırları çıkarma
riskbased2 <- riskbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
riskbased3 <- riskbased2 %>% spread(no, riskANDreturnbased)

# Write csv olarak kaydetme
write.csv(riskbased3, file = "C:/R/riskANDreturnbased-sep.csv")
rm(riskbased)
rm(riskbased2)
rm(riskbased3)

##UNCLASSIFIED BASED
# csv den R ortamına import etme
unclassifiedbased <- read_csv("C:/R/unclassifiedbased.csv")

# gereksiz satırları çıkarma
unclassifiedbased2 <- unclassifiedbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
unclassifiedbased3 <- unclassifiedbased2 %>% spread(no, 
unclassifiedbased)

# Write csv olarak kaydetme
write.csv(unclassifiedbased3, file = "C:/R/unclassifiedbased-
sep.csv")
rm(unclassifiedbased)
rm(unclassifiedbased2)
rm(unclassifiedbased3)

##UNCLASSIFIED BASED
# csv den R ortamına import etme
unclassifiedbased <- read_csv("C:/R/unclassifiedbased.csv")

# gereksiz satırları çıkarma
unclassifiedbased2 <- unclassifiedbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
unclassifiedbased3 <- unclassifiedbased2 %>% spread(no, 
unclassifiedbased)

# Write csv olarak kaydetme
write.csv(unclassifiedbased3, file = "C:/R/unclassifiedbased-
sep.csv")
rm(unclassifiedbased)
rm(unclassifiedbased2)
rm(unclassifiedbased3)

##ABSOLUTE RISK BASED
# csv den R ortamına import etme
AbsoluteRiskbased <- read.csv("C:/R/AbsoluteRiskbased.csv")

# gereksiz satırları çıkarma
AbsoluteRiskbased2 <- AbsoluteRiskbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
AbsoluteRiskbased3 <- AbsoluteRiskbased2 %>% spread(no, 
AbsoluteRiskbased)

# Write csv olarak kaydetme
write.csv(AbsoluteRiskbased3, file = "C:/R/AbsoluteRiskbased-
sep.csv")
rm(AbsoluteRiskbased)
rm(AbsoluteRiskbased2)
rm(AbsoluteRiskbased3)

##ALL VARS BASED
# csv den R ortamına import etme
Allv <- read.csv("C:/R/stageB/allvarsincluded.csv")

# gereksiz satırları çıkarma
Allv2 <- Allv [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
Allv3 <- Allv2 %>% spread(no, allvarsincluded)

# Write csv olarak kaydetme
write.csv(Allv3, file = "C:/R/All-sep.csv")
rm(Allv)
rm(Allv2)
rm(Allv3)

##ABSOLUTE RISK BASED
# csv den R ortamına import etme
AbsoluteRiskbased <- read.csv("C:/R/AbsoluteRiskbased.csv")

# gereksiz satırları çıkarma
AbsoluteRiskbased2 <- AbsoluteRiskbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
AbsoluteRiskbased3 <- AbsoluteRiskbased2 %>% spread(no, 
AbsoluteRiskbased)

# Write csv olarak kaydetme
write.csv(AbsoluteRiskbased3, file = "C:/R/AbsoluteRiskbased-
sep.csv")
rm(AbsoluteRiskbased)
rm(AbsoluteRiskbased2)
rm(AbsoluteRiskbased3)

##BARIS BASED
# csv den R ortamına import etme
Allv <- read.csv("C:/R/barisbased.csv")

# gereksiz satırları çıkarma
Allv2 <- Allv [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıtma
Allv3 <- Allv2 %>% spread(no, barisbased)

# Write csv olarak kaydetme
write.csv(Allv3, file = "C:/R/barisbased-sep.csv")
rm(Allv)
rm(Allv2)
rm(Allv3)

## paired sample t-test stage
# önce tüm dataları tek bir DF te toplama
All_difMarket <- read_csv("C:/R/stageB/All-difMarket.csv")
All_ExtMarket <- read_csv("C:/R/stageB/All-ExtMarket.csv")
All_Return <- read_csv("C:/R/stageB/All-Return.csv")
All_Risk <- read_csv("C:/R/stageB/All-Risk.csv")
All_Unclass <- read_csv("C:/R/stageB/All-Unclass.csv")
All_AbsRisk <- read_csv("C:/R/stageB/allvars-AbsRisk.csv")
All_GenBench <- read_csv("C:/R/stageB/allvars-GenBench.csv")
All_PortMan <- read_csv("C:/R/stageB/allvars-PortMan.csv")
All <- read_csv("C:/R/stageB/allvarsincluded.csv")
All_baris <- read_csv("C:/R/stageB/All-baris.csv")

# birinci kolonu çıkarma
All <- All[,-1]
All_difMarket <- All_difMarket[,-1]
All_ExtMarket <- All_ExtMarket[,-1]
All_Return <- All_Return[,-1]
All_Risk <- All_Risk[,-1]
All_Unclass <- All_Unclass[,-1]
All_GenBench <- All_GenBench[,-1]
All_PortMan <- All_PortMan[,-1]
All_AbsRisk <- All_AbsRisk[,-1]
All_baris <- All_baris[,c(-1,-4,-5,-6,-7,-8,-9)]
All <- All[,c(-3,-6,-7,-8)]

#2. turda burayı kullanmayıp hepsinin düz 2. kolonunu almak 
denendi /// işe yaramadı
All_difMarket <- All_difMarket[,-3:-8]
All_ExtMarket <- All_ExtMarket[,-3:-8]
All_Return <- All_Return[,-3:-8]
All_Risk <- All_Risk[,-3:-8]
All_Unclass <- All_Unclass[,-3:-8]
All_GenBench <- All_GenBench[,-3:-8]
All_PortMan <- All_PortMan[,-3:-8]
All_AbsRisk <- All_AbsRisk[,-3:-8]

## example code total <- merge(data frameA,data frameB,by="ID")
## data frameleri birleştirme
All <- merge(All_difMarket, All, by="ID")
All  <- merge(All_ExtMarket, All, by="ID")
All <- merge(All_Return, All, by="ID")
All  <- merge(All_Risk, All, by="ID")
All  <- merge(All_Unclass, All, by="ID")
All  <- merge(All_GenBench, All, by="ID")
All  <- merge(All_PortMan, All, by="ID")
All  <- merge(All_AbsRisk, All, by="ID")
All  <- merge(All_baris, All, by="ID")

## birleştirdik şimdi paired sample t test e başlama
names(All)
#  [1] "ID" "allvarsExAbsRisk" "allvarsExPortMan" 
"allvarsExGenBench" "allvarsExUnclass" "allvarsExRisk" 
#  [7] "allvarsExReturn" "allvarsExExtMarket" 
"allvarsExdifMarket" "allvarsincluded" "date" "no" 

## histogramlara bakma
hist(All$ allvarsExAbsRisk)
hist(All$ allvarsExPortMan)
hist(All$ allvarsExGenBench)
hist(All$ allvarsExUnclass)
hist(All$ allvarsExRisk)
hist(All$ allvarsExReturn)
hist(All$ allvarsExExtMarket)
hist(All$ allvarsExdifMarket)
hist(All$ allvarsincluded)
hist(All$ allvarsExbaris)

## univariate normality test
# Q-Q Plot for variable allvarsExAbsRisk
attach(All)
qqnorm(allvarsExAbsRisk)
qqline(allvarsExAbsRisk)
qqnorm(allvarsExPortMan)
qqline(allvarsExPortMan)
qqnorm(allvarsExGenBench)
qqline(allvarsExGenBench)
qqnorm(allvarsExUnclass)
qqline(allvarsExUnclass)
qqnorm(allvarsExRisk)
qqline(allvarsExRisk)
qqnorm(allvarsExReturn)
qqline(allvarsExReturn)
qqnorm(allvarsExExtMarket)
qqline(allvarsExExtMarket)
qqnorm(allvarsExdifMarket)
qqline(allvarsExdifMarket)
qqnorm(allvarsincluded)
qqline(allvarsincluded)
qqnorm(allvarsExbaris)
qqline(allvarsExbaris)

## descriptive statistics check
attach(All)
#allvarsExAbsRisk
stat.desc(allvarsExAbsRisk) 
#allvarsExPortMan
stat.desc(allvarsExPortMan) 
#allvarsExGenBench
stat.desc(allvarsExGenBench) 
#allvarsExUnclass
stat.desc(allvarsExUnclass) 
#allvarsExRisk
stat.desc(allvarsExRisk) 
#allvarsExReturn
stat.desc(allvarsExReturn) 
#allvarsExExtMarket
stat.desc(allvarsExExtMarket) 
#allvarsExdifMarket
stat.desc(allvarsExdifMarket) 
#allvarsincluded
stat.desc(allvarsincluded)
#allvarExbaris
stat.desc(allvarsExbaris)

## paired sample T-TEST 
# paired t-test example code  t.test(y1,y2,paired=TRUE) # 
where y1 & y2 are numeric
attach(All)
# All vs allvarsExAbsRisk
t.test(allvarsincluded,allvarsExAbsRisk,paired=TRUE)
# All vs allvarsExPortMan
t.test(allvarsincluded,allvarsExPortMan,paired=TRUE)
# All vs allvarsExGenBench
t.test(allvarsincluded,allvarsExGenBench,paired=TRUE)
# All vs allvarsExUnclass
t.test(allvarsincluded,allvarsExUnclass,paired=TRUE)
# All vs allvarsExRisk
t.test(allvarsincluded,allvarsExRisk,paired=TRUE)
# All vs allvarsExReturn
t.test(allvarsincluded,allvarsExReturn,paired=TRUE)
# All vs allvarsExExtMarket
t.test(allvarsincluded,allvarsExExtMarket,paired=TRUE)
# All vs allvarsExdifMarket
t.test(allvarsincluded,allvarsExdifMarket,paired=TRUE)
# All vs allvarsincluded
t.test(allvarsincluded,allvarsincluded,paired=TRUE)
# All vs baris
t.test(allvarsincluded,allvarsExbaris,paired=TRUE)

##=================== boş yerlere 0 verdilen hesaplama
sonuçları şüpheli-> bir de boş değerleri çıkararak yeniden 
denendi =========
#unclass 74
#extrememarketcond 186
#absoluteriskbased 182
#diffmarketcondbased	121
#generalbenchbased 223
#portfmanagerbased	35
#returnbased 137
#riskbased	1
#All	176
db_yedek <- db
## 0 olan değerleri NA yaptık
db[db == 0] <- NA

## Boş satırları silme
library(tidyr)
df %>% drop_na()
# fon skorlarını birleştir
X3MdbGATHER <- gather(X3Mdb, "no","score", 4:75)
# fon türlerine göre dağıt
X3MdbSPREAD <- X3MdbGATHER %>% spread(type, score)
View(X3MdbSPREAD)

# Write csv olarak kaydetme
write.csv(X3MdbSPREAD, file = "C:/R/X3MdbSPREAD.csv")
### normalize ediyoruz /// bu tam çalışmadı anlayamadım
Norm_X3Mdb <- X3MdbSPREAD[,3:66]
maxs <- apply(Norm_X3Mdb, 2, max) 
mins <- apply(Norm_X3Mdb, 2, min)
Scaled_X3MdbSPREAD <- as.data.frame(scale(X3MdbSPREAD, 
center = mins, scale = maxs - mins))
### normalize ediyoruz /// tekrar deniyorum yine çalışmadı
lst <- lapply(X3Mdb[-1], function(x) round((x-min(x))/
(max(x)-min(x)), 1))
res <- cbind(X3Mdb[1], do.call(cbind.data.frame, 
Map(cbind , X3Mdb[-1], lst)))
names(res)[-1] <- rbind(names(X3Mdb)[-1], sub("Value", 
"Norm", names(X3Mdb)[-1]))

### Excel in standardize fonksiyonu ile normalize edeceğim
#merge yaparak data frameleri birleştirme
#iki data frame e ID kolonu atıyorum
X3Mdb$ ID <- seq.int(nrow(X3Mdb))
Scaled_X3MdbSPREAD $ ID <- seq.int(nrow(Scaled_X3MdbSPREAD))
totalmerged <- merge(X3Mdb[,c("date","no","ID")],
Scaled_X3MdbSPREAD,by="ID")
#my final dataframe before neural net
db <- totalmerged
