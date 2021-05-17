#this code written for educational purposes may not work on you because of missing packages/input files

### latest R code backup 10 nisan 2018


#buradan itibaren kullanacagiz

iris <- bigdf2 #dfi olusturduk
view(iris) #dfi goruntuledik
set.seed(2) #random generator
proportion <- 0.8 # set to split
index <- sample(1:nrow(iris), round(proportion*nrow(iris))) #datayi %80 %20 bolen bir index olusturduk



m <- as.matrix(iris[index, ]) 
na.omit(m)#missing data ayıklama
train_iris <- m
train_iris <- as.data.frame(train_iris)
na.omit(train_iris)
train_iris <- iris[index, ]
View(train_iris) #training df parçasını olusturduk
train_iris$x001[is.na(train_iris$x001)] <- round(mean(train_iris$x001, na.rm = TRUE))
train_iris$x002[is.na(train_iris$x002)] <- round(mean(train_iris$x002, na.rm = TRUE))
train_iris$x003[is.na(train_iris$x003)] <- round(mean(train_iris$x003, na.rm = TRUE))
train_iris$x004[is.na(train_iris$x004)] <- round(mean(train_iris$x004, na.rm = TRUE))
train_iris$x005[is.na(train_iris$x005)] <- round(mean(train_iris$x005, na.rm = TRUE))
train_iris$x006[is.na(train_iris$x006)] <- round(mean(train_iris$x006, na.rm = TRUE))
train_iris$x007[is.na(train_iris$x007)] <- round(mean(train_iris$x007, na.rm = TRUE)) 
train_iris$x008[is.na(train_iris$x008)] <- round(mean(train_iris$x008, na.rm = TRUE))
train_iris$x009[is.na(train_iris$x009)] <- round(mean(train_iris$x009, na.rm = TRUE))
train_iris$x010[is.na(train_iris$x010)] <- round(mean(train_iris$x010, na.rm = TRUE))
train_iris$x011[is.na(train_iris$x011)] <- round(mean(train_iris$x011, na.rm = TRUE))
train_iris$x012[is.na(train_iris$x012)] <- round(mean(train_iris$x012, na.rm = TRUE))
train_iris$x013[is.na(train_iris$x013)] <- round(mean(train_iris$x013, na.rm = TRUE))
train_iris$x014[is.na(train_iris$x014)] <- round(mean(train_iris$x014, na.rm = TRUE))
train_iris$x015[is.na(train_iris$x015)] <- round(mean(train_iris$x015, na.rm = TRUE))
train_iris$x016[is.na(train_iris$x016)] <- round(mean(train_iris$x016, na.rm = TRUE))
train_iris$x017[is.na(train_iris$x017)] <- round(mean(train_iris$x017, na.rm = TRUE))
train_iris$x018[is.na(train_iris$x018)] <- round(mean(train_iris$x018, na.rm = TRUE))
train_iris$x019[is.na(train_iris$x019)] <- round(mean(train_iris$x019, na.rm = TRUE))
train_iris$x020[is.na(train_iris$x020)] <- round(mean(train_iris$x020, na.rm = TRUE))
train_iris$x021[is.na(train_iris$x021)] <- round(mean(train_iris$x021, na.rm = TRUE))
train_iris$x022[is.na(train_iris$x022)] <- round(mean(train_iris$x022, na.rm = TRUE))
train_iris$x023[is.na(train_iris$x023)] <- round(mean(train_iris$x023, na.rm = TRUE))
train_iris$x024[is.na(train_iris$x024)] <- round(mean(train_iris$x024, na.rm = TRUE))
train_iris$x025[is.na(train_iris$x025)] <- round(mean(train_iris$x025, na.rm = TRUE))
train_iris$x026[is.na(train_iris$x026)] <- round(mean(train_iris$x026, na.rm = TRUE))
train_iris$x027[is.na(train_iris$x027)] <- round(mean(train_iris$x027, na.rm = TRUE))
train_iris$x028[is.na(train_iris$x028)] <- round(mean(train_iris$x028, na.rm = TRUE))
train_iris$x029[is.na(train_iris$x029)] <- round(mean(train_iris$x029, na.rm = TRUE))
train_iris$x030[is.na(train_iris$x030)] <- round(mean(train_iris$x030, na.rm = TRUE))
train_iris$x031[is.na(train_iris$x031)] <- round(mean(train_iris$x031, na.rm = TRUE))
train_iris$x032[is.na(train_iris$x032)] <- round(mean(train_iris$x032, na.rm = TRUE))
train_iris$x033[is.na(train_iris$x033)] <- round(mean(train_iris$x033, na.rm = TRUE))
train_iris$x034[is.na(train_iris$x034)] <- round(mean(train_iris$x034, na.rm = TRUE))
train_iris$x035[is.na(train_iris$x035)] <- round(mean(train_iris$x035, na.rm = TRUE))
train_iris$x036[is.na(train_iris$x036)] <- round(mean(train_iris$x036, na.rm = TRUE))
train_iris$x037[is.na(train_iris$x037)] <- round(mean(train_iris$x037, na.rm = TRUE))
train_iris$x038[is.na(train_iris$x038)] <- round(mean(train_iris$x038, na.rm = TRUE))
train_iris$x039[is.na(train_iris$x039)] <- round(mean(train_iris$x039, na.rm = TRUE))
train_iris$x040[is.na(train_iris$x040)] <- round(mean(train_iris$x040, na.rm = TRUE))
train_iris$x041[is.na(train_iris$x041)] <- round(mean(train_iris$x041, na.rm = TRUE))
train_iris$x042[is.na(train_iris$x042)] <- round(mean(train_iris$x042, na.rm = TRUE))
train_iris$x043[is.na(train_iris$x043)] <- round(mean(train_iris$x043, na.rm = TRUE))
train_iris$x044[is.na(train_iris$x044)] <- round(mean(train_iris$x044, na.rm = TRUE))
train_iris$x045[is.na(train_iris$x045)] <- round(mean(train_iris$x045, na.rm = TRUE))
train_iris$x046[is.na(train_iris$x046)] <- round(mean(train_iris$x046, na.rm = TRUE))
train_iris$x047[is.na(train_iris$x047)] <- round(mean(train_iris$x047, na.rm = TRUE))
train_iris$x048[is.na(train_iris$x048)] <- round(mean(train_iris$x048, na.rm = TRUE))
train_iris$x049[is.na(train_iris$x049)] <- round(mean(train_iris$x049, na.rm = TRUE))
train_iris$x050[is.na(train_iris$x050)] <- round(mean(train_iris$x050, na.rm = TRUE))
train_iris$x051[is.na(train_iris$x051)] <- round(mean(train_iris$x051, na.rm = TRUE))
train_iris$x052[is.na(train_iris$x052)] <- round(mean(train_iris$x052, na.rm = TRUE))
train_iris$x053[is.na(train_iris$x053)] <- round(mean(train_iris$x053, na.rm = TRUE))
train_iris$x054[is.na(train_iris$x054)] <- round(mean(train_iris$x054, na.rm = TRUE))
train_iris$x055[is.na(train_iris$x055)] <- round(mean(train_iris$x055, na.rm = TRUE))
train_iris$x056[is.na(train_iris$x056)] <- round(mean(train_iris$x056, na.rm = TRUE))
train_iris$x057[is.na(train_iris$x057)] <- round(mean(train_iris$x057, na.rm = TRUE))

summary(train_iris)
View(train_iris)


test_iris <- iris[-index, ] #testing df parçasını oluşturduk

NROW(train_iris)
NROW(test_iris)

iris_n <- neuralnet(x001~x002+x003+x004+x005+x006+x007+x008+x009+x010+
                    x011+x012+x013+x014+x015+x016+x017+x018+x019+x020+
                    x021+x022+x023+x024+x025+x026+x027+x028+x029+x030+
                    x031+x032+x033+x034+x035+x036+x037+x038+x039+x040+
                    x041+x042+x043+x044+x045+x046+x047+x048+x049+x050+
                    x051+x052+x053+x054+x055+x056+x057, train_iris, hidden = 4,
                    stepmax=1e4, threshold = 0.1, algorithm = "rprop+", err.fct = "sse")
plot(iris_n) #neural network fitting code

pred_test <- compute(iris_n,test_iris[,2:8]) # predictionlarımızı test ediyoruz
predtestResult <- pred_test$net.result # predictionlarımızı kaydediyoruz
predtestResult <- as.data.frame(predtestResult) # predictionlarımızı kaydediyoruz sonra df yapıyoruz

colnames(predtestResult)<-("x001e") # tahmin df'in kolon ismini değiştirdik

predtestResult <- ceiling(predtestResult)

gwplot(iris_n, selected.covariate="x005")

plot(iris_n, rep="best")
