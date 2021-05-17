#this code written for educational purposes may not work on you because of missing packages/input files

install.packages("tidyr")
install.packages("dplyr")
install.packages("neuralnet")
library(tidyr)
library(dplyr)
library(neuralnet)
#-----------------------------------------------------------------------BIG STAGE A

#-----------------------------------------------------------------------stage 1 return based 

predictorVars <- "x001+x002"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))

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

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "returnbased"

write.csv(totalmerged, file = "C:/R/returnbased.csv")





#-----------------------------------------------------------------------stage 2 risk based 



predictorVars <- "x003+x004+x005+x006+x007+x008+x009+x010+x011+x012"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(6),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "riskbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/riskbased.csv")


#-----------------------------------------------------------------------stage 3 portfolio manager based 


predictorVars <- "x013+x014+x015+x016+x017+x018+x019"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(4),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "PortManagerbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/PortManagerbased.csv")


#-----------------------------------------------------------------------stage 4 general benchmark based 


predictorVars <- "x019+x020+x021+x022+x023+x024+x025+x026"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(5),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "GeneralBenchbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/GeneralBenchbased.csv")



#-----------------------------------------------------------------------stage 5 absolute risk based 


predictorVars <- "x026+x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(10),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "AbsoluteRiskbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/AbsoluteRiskbased.csv")



#-----------------------------------------------------------------------stage 6 extreme market condition based 


predictorVars <- "x045+x046+x047+x048+x049+x050+x051"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(4),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+06, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "ExtrMarkCondbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/ExtrMarkCondbased.csv")



#-----------------------------------------------------------------------stage 7 different market conditions related based 


predictorVars <- "x052+x053+x053+x054+x055+x056+x057"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(4),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "DifMarketCondbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/DifMarketCondbased.csv")


#-----------------------------------------------------------------------stage 8 unclassified based 


predictorVars <- "x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(3),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "unclassifiedbased"
head(totalmerged)

write.csv(totalmerged, file = "C:/R/unclassifiedbased.csv")




#-----------------------------------------------------------------------BIG STAGE B

#-----------------------------------------------------------------------1 All vars included


predictorVars <- colnames(db[,5:66])

predictorVars <- paste(predictorVars, collapse ="+") 

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(32),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+06, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsincluded"

write.csv(totalmerged, file = "C:/R/allvarsincluded.csv")



#-----------------------------------------------------------------------2 All vars-Return  




predictorVars <- "x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
                  x013+x014+x015+x016+x017+x018+x019 + x020+x021+x022+x023+x024+x025+x026 + 
                  x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
                  x045+x046+x047+x048+x049+x050+x051 +
                  x052+x053+x053+x054+x055+x056+x057 +
                  x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(31),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExReturn"

write.csv(totalmerged, file = "C:/R/allvarsExReturn.csv")

#-----------------------------------------------------------------------3 All vars-Risk 


predictorVars <- "x001+x002 +
                  x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
x045+x046+x047+x048+x049+x050+x051 +
x052+x053+x053+x054+x055+x056+x057 +
x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(27),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExRisk"

write.csv(totalmerged, file = "C:/R/allvarsExRisk.csv")

#-----------------------------------------------------------------------4 All vars-PortMan 


### to remove any object from environment rm(objectname)

rm(predictorVars)
predictorVars <- "x001+x002 +
                  x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
                  x019 + x020+x021+x022+x023+x024+x025+x026 + 
x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
x045+x046+x047+x048+x049+x050+x051 +
x052+x053+x053+x054+x055+x056+x057 +
x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))
form


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(29),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 200000, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExPortMan"

write.csv(totalmerged, file = "C:/R/allvarsExPortMan.csv")


#-----------------------------------------------------------------------5 All vars-GeneralBench

rm(predictorVars)
rm(form)
predictorVars <- "x001+x002 +
                  x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
x013+x014+x015+x016+x017+x018+ 
x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
x045+x046+x047+x048+x049+x050+x051 +
x052+x053+x053+x054+x055+x056+x057 +
x058+x059+x060+x061+x062"


form=as.formula(paste("y001~", predictorVars, collapse = "+"))
form

neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(28),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExGenBench"

write.csv(totalmerged, file = "C:/R/allvarsExGenBench.csv")


#-----------------------------------------------------------------------6 All vars-AbsRisk

rm(predictorVars)
rm(form)
predictorVars <- "x001+x002 +
                  x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
x013+x014+x015+x016+x017+x018+x019 + x020+x021+x022+x023+x024+x025+
x045+x046+x047+x048+x049+x050+x051 +
x052+x053+x053+x054+x055+x056+x057 +
x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(22),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 1e+05, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExAbsRisk"

write.csv(totalmerged, file = "C:/R/allvarsExAbsRisk.csv")


#-----------------------------------------------------------------------7 All vars-ExtMarket      BURADA KALDIM 
rm(predictorVars)
rm(form)
predictorVars <- "x001+x002 +
                  x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
x013+x014+x015+x016+x017+x018+x019 + x020+x021+x022+x023+x024+x025+x026 + 
x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
x052+x053+x053+x054+x055+x056+x057 +
x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(28),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 200000, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExExtMarket"

write.csv(totalmerged, file = "C:/R/allvarsExExtMarket.csv")
write.csv(totalmerged, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/allvarsExExtMarket.csv")



#-----------------------------------------------------------------------8 All vars-difMarket

rm(predictorVars)
rm(form)
predictorVars <- "x001+x002 +
                  x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
x013+x014+x015+x016+x017+x018+x019 + x020+x021+x022+x023+x024+x025+x026 + 
x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
x045+x046+x047+x048+x049+x050+x051 +
x058+x059+x060+x061+x062"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(29),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 200000, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExdifMarket"

write.csv(totalmerged, file = "C:/R/allvarsExdifMarket.csv")

write.csv(totalmerged, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/allvarsExdifMarket.csv")



#-----------------------------------------------------------------------9 All vars-unclass

rm(predictorVars)
rm(form)
predictorVars <- "x001+x002 +
                  x003+x004+x005+x006+x007+x008+x009+x010+x011+x012 + 
x013+x014+x015+x016+x017+x018+x019 + x020+x021+x022+x023+x024+x025+x026 + 
x027+x028+x029+x030+x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+x041+x042+x043+x044 +
x045+x046+x047+x048+x049+x050+x051 +
x052+x053+x053+x054+x055+x056+x057"

form=as.formula(paste("y001~", predictorVars, collapse = "+"))


neuralModel <- neuralnet(formula= form,
                         data = db,
                         hidden = c(29),
                         err.fct = "sse",
                         linear.output = FALSE, threshold = 0.01,        
                         stepmax = 200000, algorithm = "rprop+")

plot(neuralModel)

## burada bir listenin içindeki alt nesneye erişiyoruz
output <- neuralModel$net.result[[1]]
output <- as.data.frame(output)
head(output)

#adding ID row to net.result satır numarası olmayan bir dataframe'e ID adında bir kolon oluşturup satır numarası verdik.

output$ID <- seq.int(nrow(output))
resultdb <- db[,1:6]
resultdb$ID <- seq.int(nrow(db[,1:6]))

# ID satırını esas alarak iki dataframe i birleştirdik 
totalmerged <- merge(output,resultdb,by="ID")
head(totalmerged)

colnames(totalmerged)[2] <- "allvarsExUnclass"

write.csv(totalmerged, file = "C:/R/allvarsExUnclass.csv")

write.csv(totalmerged, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/allvarsExUnclass.csv")












###----------------------burada uzun csv leri fon adlarına göre ayırıyoruz.-------------------
install.packages("tidyr")
install.packages("dplyr")
install.packages("neuralnet")
library(tidyr)
library(dplyr)
library(neuralnet)

## burada performans kriterlerini sütuna gelecek şekilde matrixi uyuzun dar bir halden geniş kısa bir hale getiriyoruz


AbsoluteRiskbased2 <-AbsoluteRiskbased %>% spread(no, AbsoluteRiskbased)

AbsoluteRiskbased3 <-gather(AbsoluteRiskbased2,date,no,8:75)


AbsoluteRiskbased2 <-AbsoluteRiskbased [,c(-1,-2,-4,-7,-8,-9)]

AbsoluteRiskbased3 <-AbsoluteRiskbased2 %>% spread(no, AbsoluteRiskbased)


# Write CSV in R
write.csv(AbsoluteRiskbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/AbsoluteRiskbased3.csv")


#uzun listeden fonlary ayyrma


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



##### ----------------- burada taslak kodu seri çalışacak hale getiriyorum GATHER SPREAD

library(readr)

###DIFMARKET COND


# csv den R ortamına import et
DifMarketCondbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/DifMarketCondbased.csv")

# gereksiz satırları çıkar
DifMarketCondbased2 <-DifMarketCondbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
DifMarketCondbased3 <-DifMarketCondbased2 %>% spread(no, DifMarketCondbased)

# Write csv olarak kaydet
write.csv(DifMarketCondbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/DifMarketCondbased2.csv")




###EXTREME MARKET COND


# csv den R ortamına import et
ExtrMarkCondbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/ExtrMarkCondbased.csv")

# gereksiz satırları çıkar
ExtrMarkCondbased2 <-ExtrMarkCondbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
ExtrMarkCondbased3 <-ExtrMarkCondbased2 %>% spread(no, ExtrMarkCondbased)

# Write csv olarak kaydet
write.csv(ExtrMarkCondbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/ExtrMarkCondbased2.csv")




###GENERAL BENCHMARK BASED


# csv den R ortamına import et
GeneralBenchbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/GeneralBenchbased.csv")

# gereksiz satırları çıkar
GeneralBenchbased2 <-GeneralBenchbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
GeneralBenchbased3 <-GeneralBenchbased2 %>% spread(no, GeneralBenchbased)

# Write csv olarak kaydet
write.csv(GeneralBenchbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/GeneralBenchbased2.csv")


###PORTFOLIO MANAGER BASED

# csv den R ortamına import et
PortManagerbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/PortManagerbased.csv")

# gereksiz satırları çıkar
PortManagerbased2 <- PortManagerbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
PortManagerbased3 <- PortManagerbased2 %>% spread(no, PortManagerbased)

# Write csv olarak kaydet
write.csv(PortManagerbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/PortManagerbased2.csv")


###RETURN BASED

# csv den R ortamına import et
returnbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/returnbased.csv")

# gereksiz satırları çıkar
returnbased2 <- returnbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
returnbased3 <- returnbased2 %>% spread(no, returnbased)

# Write csv olarak kaydet
write.csv(returnbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/returnbased2.csv")



###RISK BASED

# csv den R ortamına import et
riskbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/riskbased.csv")

# gereksiz satırları çıkar
riskbased2 <- riskbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
riskbased3 <- riskbased2 %>% spread(no, riskbased)

# Write csv olarak kaydet
write.csv(riskbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/riskbased2.csv")


###UNCLASSIFIED BASED

# csv den R ortamına import et
unclassifiedbased <- read_csv("G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/unclassifiedbased.csv")

# gereksiz satırları çıkar
unclassifiedbased2 <- unclassifiedbased [,c(-1,-2,-4,-7,-8,-9)]

# fon türlerine göre dağıt
unclassifiedbased3 <- unclassifiedbased2 %>% spread(no, unclassifiedbased)

# Write csv olarak kaydet
write.csv(unclassifiedbased3, file = "G:/okul tez/BIG DATA/hesaplama J/25 ekim 2018/R/unclassifiedbased2.csv")




#### BURADA skorların converge edip etmediğini plotlara bakarak kontrol etmeye çalışacağım 




### gather yapmaya çalışıyorum

X3MReturn$ID <- seq.int(nrow(X3MReturn))

X3MReturn2 <- gather(X3MReturn, "ID","score", 2:73)

# Write csv olarak kaydet
write.csv(X3MReturn2, file = "G:/okul tez/BIG DATA/hesaplama J/3aylıkExtracted.csv")

### OK OK OK THIS TIME YOU GOT THIS!!!! =========================================================================

### boşlukları 0 ile dolduruyoruz.
X3Mdb0filled <- X3Mdb

X3Mdb0filled[is.na(X3Mdb)] <- 0


# fon skorlarını birleştir
X3Mdb0filledGATHER <- gather(X3Mdb0filled, "no","score", 4:75)

# fon türlerine göre dağıt
X3Mdb0filledSPREAD <- X3Mdb0filledGATHER %>% spread(type, score)
View(X3Mdb0filledSPREAD)



# Write csv olarak kaydet
write.csv(X3Mdb0filledSPREAD, file = "G:/okul tez/BIG DATA/hesaplama J/X3Mdb0filledSPREAD.csv")

# Write csv olarak kaydet
write.csv(X3Mdb0filledGATHER, file = "G:/okul tez/BIG DATA/hesaplama J/X3Mdb0filledGATHER.csv")


### OK OK OK THIS TIME YOU GOT THIS 2 :D !!!! =========================================================================

rm(X3Mdb0filledSPREAD)
rm(X3Mdb0filledGATHER)
rm(X3Mdb)
rm(X3Mdb0filled)

library(readxl)
X3Mdb <- read_excel("G:/okul tez/BIG DATA/hesaplama J/ultraMEGAsuper3Mdb.xlsx")

### boşlukları 0 ile dolduruyoruz.
X3Mdb0 <- X3Mdb

X3Mdb0[is.na(X3Mdb)] <- 0

# fon skorlarını birleştir
X3Mdb0G <- gather(X3Mdb0, "no","score", 4:75)
View(X3Mdb0G)


# fon türlerine göre dağıt
X3Mdb0S <- X3Mdb0G %>% spread(type, score)
View(X3Mdb0S)


# Write csv olarak kaydet
write.csv(X3Mdb0S, file = "G:/okul tez/BIG DATA/hesaplama J/X3Mdb0S.csv")
