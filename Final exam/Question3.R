lensdata = read.csv("lenses.csv", header = FALSE, col.names = c("index", "age", "spectacle_prescription", "astigmatic", "tear_production_rate", "Class"))

lensdata$index <- NULL

library(rpart)
y<-as.factor(lensdata[,5])
x<-lensdata[,1:4]

fit<-rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))

library(rpart.plot)
rpart.plot(fit)

#Information Gain for training set
sum(y==predict(fit,x,type="class"))/length(y)

#miscalassification error rate for training set
1-sum(y==predict(fit,x,type="class"))/length(y)
