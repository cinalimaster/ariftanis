#this code written for educational purposes may not work on you because of missing packages/input files

install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)

mydf <- mydf




## bir df içindeki kolonlardan birinin içinde bulunan faktörlerin listesi
listOfAllFunds <- levels(factor(mydf$fund)) 

## filtering multicriteria hisse agirlikli yatirim fonlarını suzduk
HisseMutFunds <- filter(mydf, 

  fund== "XU100"|
  fund== "RfreeRate"|  
  fund== "AAV"|
  fund== "ACC"|
  fund== "ACK"|
  fund== "ACT"|
  fund== "ADP"|
  fund== "AFA"|
  fund== "AFS"|
  fund== "AFT"|
  fund== "AFV"|
  fund== "AHI"|
  fund== "AK3"|
  fund== "AKU"|
  fund== "ALC"|
  fund== "AOY"|
  fund== "ARC"|
  fund== "ASA"|
  fund== "AYA"|
  fund== "BAA"|
  fund== "BKE"|
  fund== "BZI"|
  fund== "DAH"|
  fund== "DPT"|
  fund== "DZE"|
  fund== "EC2"|
  fund== "ECH"|
  fund== "EID"|
  fund== "FPH"|
  fund== "FYD"|
  fund== "GAE"|
  fund== "GAF"|
  fund== "GBG"|
  fund== "GHS"|
  fund== "GL1"|
  fund== "GMR"|
  fund== "GSP"|
  fund== "GUH"|
  fund== "HAF"|
  fund== "HBU"|
  fund== "HVS"|
  fund== "ICF"|
  fund== "IGH"|
  fund== "IYD"|
  fund== "KYA"|
  fund== "MAC"|
  fund== "MPS"|
  fund== "SKH"|
  fund== "ST1"|
  fund== "STH"|
  fund== "TAU"|
  fund== "TEI"|
  fund== "TI2"|
  fund== "TI3"|
  fund== "TIE"|
  fund== "TKF"|
  fund== "TLH"|
  fund== "TMG"|
  fund== "TPR"|
  fund== "TTE"|
  fund== "TZD"|
  fund== "TZE"|
  fund== "TZK"|
  fund== "VEF"|
  fund== "YAB"|
  fund== "YAS"|
  fund== "YAU"|
  fund== "YAY"|
  fund== "YDE"|
  fund== "YDI"|
  fund== "YEF"|
  fund== "YHS"|
  fund== "ZPE"
)

##data frame i compact hale getirdik tarih fund name ve NAV
mydf2 <- HisseMutFunds[,1:3]


##data frame uzun ince bir listeden çıkarıp assetleri ayrı ayrı tablo haline getirdik
mydf3 <- spread(mydf2,fund,nav)
head(mydf3)

write.csv(mydf3, "G:/okul tez/BIG DATA/hesaplama H/00004aysonufon.csv")
