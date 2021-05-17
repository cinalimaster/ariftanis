#this code written for educational purposes may not work on you because of missing packages/input files

#kolon adını ilk satırla değiştirme
colnames(DF) = DF[1, ] # the first row will be the header
DF = DF[-1, ]          # removing the first row.

colnames(ForRlatest) = ForRlatest[1, ]
ForRlatest = ForRlatest[-1,]
View

#son sütunu çıkardım

DF <- ForRlatest
DF <- DF[,1:67]

install.packages("tidyr")
install.packages("dplyr")
library(tidyr)
library(dplyr)

yenidf = gather(DF,)


Book3 <- gather(Book2, year, "stockname", 2:68)

#we need gather columns in rows
DF2 <- DF
DF3 <- separate(DF2, perfcrit, c("x001","x002","x003","x004","x005","x006","x007","x008","x009","x010","x011","x012","x013","x014","x015","x016","x017","x018","x019","x020",
                                 "x021","x022","x023","x024","x025","x026","x027","x028","x029","x030","x031","x032","x033","x034","x035","x036","x037","x038","x039","x040",
                                 "x041","x042","x043","x044","x045","x046","x047","x048","x049","x050","x051","x052","x053","x054","x055","x056","x057"))

?separate
#transpose data frame

DF3 <- as.data.frame(t(DF2))


#kolon adını ilk satırla değiştirme
colnames(DF3) = DF3[1, ] # the first row will be the header
DF3 = DF3[-1, ]          # removing the first row.


DF4 <- gather(DF3, "year", "n", 2:4)


#DATA FRAME i düzenledim ve neuralnet ile çalışabilir hale getirdim önce parçaladım sonra birleştireceğim

install.packages("tidyr")
install.packages("dplyr")
library(tidyr)
library(dplyr)


AAV <- Book2[,c(1,2,4)]
ACK <- Book2[,c(1,2,5)]
ACT <- Book2[,c(1,2,6)]
ADP <- Book2[,c(1,2,7)]
AFA <- Book2[,c(1,2,8)]
AFS <- Book2[,c(1,2,9)]
AFT <- Book2[,c(1,2,10)]
AFV <- Book2[,c(1,2,11)]
AK3 <- Book2[,c(1,2,12)]
AKU <- Book2[,c(1,2,13)]
ALC <- Book2[,c(1,2,14)]
AOY <- Book2[,c(1,2,15)]
ARC <- Book2[,c(1,2,16)]
ASA <- Book2[,c(1,2,17)]
AYA <- Book2[,c(1,2,18)]
BAA <- Book2[,c(1,2,19)]
BKE <- Book2[,c(1,2,20)]
BZI <- Book2[,c(1,2,21)]
DAH <- Book2[,c(1,2,22)]
DZE <- Book2[,c(1,2,23)]
EC2 <- Book2[,c(1,2,24)]
ECH <- Book2[,c(1,2,25)]
EID <- Book2[,c(1,2,26)]
FYD <- Book2[,c(1,2,27)]
GAE <- Book2[,c(1,2,28)]
GAF <- Book2[,c(1,2,29)]
GBG <- Book2[,c(1,2,30)]
GHS <- Book2[,c(1,2,31)]
GL1 <- Book2[,c(1,2,32)]
GMR <- Book2[,c(1,2,33)]
GSP <- Book2[,c(1,2,34)]
HAF <- Book2[,c(1,2,35)]
HBU <- Book2[,c(1,2,36)]
HVS <- Book2[,c(1,2,37)]
ICF <- Book2[,c(1,2,38)]
IGH <- Book2[,c(1,2,39)]
IYD <- Book2[,c(1,2,40)]
KYA <- Book2[,c(1,2,41)]
MAC <- Book2[,c(1,2,42)]
SKH <- Book2[,c(1,2,43)]
ST1 <- Book2[,c(1,2,44)]
STH <- Book2[,c(1,2,45)]
TAP <- Book2[,c(1,2,46)]
TAU <- Book2[,c(1,2,47)]
TEI <- Book2[,c(1,2,48)]
TI2 <- Book2[,c(1,2,49)]
TI3 <- Book2[,c(1,2,50)]
TIE <- Book2[,c(1,2,51)]
TKF <- Book2[,c(1,2,52)]
TMG <- Book2[,c(1,2,53)]
TPR <- Book2[,c(1,2,54)]
TTE <- Book2[,c(1,2,55)]
TYH <- Book2[,c(1,2,56)]
TZD <- Book2[,c(1,2,57)]
TZE <- Book2[,c(1,2,58)]
TZK <- Book2[,c(1,2,59)]
VEF <- Book2[,c(1,2,60)]
YAB <- Book2[,c(1,2,61)]
YAS <- Book2[,c(1,2,62)]
YAU <- Book2[,c(1,2,63)]
YAY <- Book2[,c(1,2,64)]
YDE <- Book2[,c(1,2,65)]
YDI <- Book2[,c(1,2,66)]
YEF <- Book2[,c(1,2,67)]
YHS <- Book2[,c(1,2,68)]


AAV <- AAV %>% spread(perfcrit, AAV)
ACK <- ACK %>% spread(perfcrit, ACK)
ACT <- ACT %>% spread(perfcrit, ACT)
ADP <- ADP %>% spread(perfcrit, ADP)
AFA <- AFA %>% spread(perfcrit, AFA)
AFS <- AFS %>% spread(perfcrit, AFS)
AFT <- AFT %>% spread(perfcrit, AFT)
AFV <- AFV %>% spread(perfcrit, AFV)
AK3 <- AK3 %>% spread(perfcrit, AK3)
AKU <- AKU %>% spread(perfcrit, AKU)
ALC <- ALC %>% spread(perfcrit, ALC)
AOY <- AOY %>% spread(perfcrit, AOY)
ARC <- ARC %>% spread(perfcrit, ARC)
ASA <- ASA %>% spread(perfcrit, ASA)
AYA <- AYA %>% spread(perfcrit, AYA)
BAA <- BAA %>% spread(perfcrit, BAA)
BKE <- BKE %>% spread(perfcrit, BKE)
BZI <- BZI %>% spread(perfcrit, BZI)
DAH <- DAH %>% spread(perfcrit, DAH)
DZE <- DZE %>% spread(perfcrit, DZE)
EC2 <- EC2 %>% spread(perfcrit, EC2)
ECH <- ECH %>% spread(perfcrit, ECH)
EID <- EID %>% spread(perfcrit, EID)
FYD <- FYD %>% spread(perfcrit, FYD)
GAE <- GAE %>% spread(perfcrit, GAE)
GAF <- GAF %>% spread(perfcrit, GAF)
GBG <- GBG %>% spread(perfcrit, GBG)
GHS <- GHS %>% spread(perfcrit, GHS)
GL1 <- GL1 %>% spread(perfcrit, GL1)
GMR <- GMR %>% spread(perfcrit, GMR)
GSP <- GSP %>% spread(perfcrit, GSP)
HAF <- HAF %>% spread(perfcrit, HAF)
HBU <- HBU %>% spread(perfcrit, HBU)
HVS <- HVS %>% spread(perfcrit, HVS)
ICF <- ICF %>% spread(perfcrit, ICF)
IGH <- IGH %>% spread(perfcrit, IGH)
IYD <- IYD %>% spread(perfcrit, IYD)
KYA <- KYA %>% spread(perfcrit, KYA)
MAC <- MAC %>% spread(perfcrit, MAC)
SKH <- SKH %>% spread(perfcrit, SKH)
ST1 <- ST1 %>% spread(perfcrit, ST1)
STH <- STH %>% spread(perfcrit, STH)
TAP <- TAP %>% spread(perfcrit, TAP)
TAU <- TAU %>% spread(perfcrit, TAU)
TEI <- TEI %>% spread(perfcrit, TEI)
TI2 <- TI2 %>% spread(perfcrit, TI2)
TI3 <- TI3 %>% spread(perfcrit, TI3)
TIE <- TIE %>% spread(perfcrit, TIE)
TKF <- TKF %>% spread(perfcrit, TKF)
TMG <- TMG %>% spread(perfcrit, TMG)
TPR <- TPR %>% spread(perfcrit, TPR)
TTE <- TTE %>% spread(perfcrit, TTE)
TYH <- TYH %>% spread(perfcrit, TYH)
TZD <- TZD %>% spread(perfcrit, TZD)
TZE <- TZE %>% spread(perfcrit, TZE)
TZK <- TZK %>% spread(perfcrit, TZK)
VEF <- VEF %>% spread(perfcrit, VEF)
YAB <- YAB %>% spread(perfcrit, YAB)
YAS <- YAS %>% spread(perfcrit, YAS)
YAU <- YAU %>% spread(perfcrit, YAU)
YAY <- YAY %>% spread(perfcrit, YAY)
YDE <- YDE %>% spread(perfcrit, YDE)
YDI <- YDI %>% spread(perfcrit, YDI)
YEF <- YEF %>% spread(perfcrit, YEF)
YHS <- YHS %>% spread(perfcrit, YHS)

install.packages("tidyr")
library(tidyr)
install.packages("dplyr")
library(dplyr)


#Remove these three objects
rm(returndb)
rm(sharpedb) 
rm(stdevdb)
rm(jensenadb)
rm(betadb)
rm(treynordb)


Book3 <- gather(testdb, type, c("return","sharpe","stdev","jensena","beta","treynor") , 3:74)

returndb <- testdb[1:195,]
returndbc <- gather(returndb, type, "return" , 3:74)
returndb <- returndbc

sharpedb <- testdb[196:390,]
sharpedbc <- gather(sharpedb, type, "sharpe" , 3:74)

stdevdb <- testdb[391:585,]
stdevdbc <- gather(stdevdb, type, "stdev" , 3:74)

jensenadb <- testdb[586:780,]
jensenadbc <- gather(jensenadb, type, "jensena" , 3:74)

betadb <- testdb[781:975,]
betadbc <- gather(betadb, type, "beta" , 3:74)

treynordb <- testdb[976:1170,]
treynordbc <- gather(treynordb, type, "beta" , 3:74)

#kolonları birleştirip yeni dataframe oluşturma with dplyr


# Write CSV in R
write.csv(returndbc, file = "returndbc.csv")
write.csv(betadbc, file = "betadbc.csv")
write.csv(jensenadbc, file = "jensenadbc.csv")
write.csv(sharpedbc, file = "sharpedbc.csv")
write.csv(stdevdbc, file = "stdevdbc.csv")
write.csv(treynordbc, file = "treynordbc.csv")


#kolon adını değiştir
names(treynordbc)[3]<-"treynor"



