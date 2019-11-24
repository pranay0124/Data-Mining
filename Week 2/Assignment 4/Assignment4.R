setwd("E:/Data-Mining/Week 2/Assignment 4")

#----------------------#
#Problem-5
#----------------------#
install.packages("rpart")
library(rpart)
train<-read.csv("sonar_train.csv",header=FALSE)
y<-as.factor(train[,61])
x<-train[,1:60]
fit<-rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))

#plotting of decission tree
plot(fit)
text(fit)

#Accuracy for training set
sum(y==predict(fit,x,type="class"))/length(y)

#miscalassification error rate for training set
1-sum(y==predict(fit,x,type="class"))/length(y)
#0.015

#misclassification error rate for testing set
test<-read.csv("sonar_test.csv",header=FALSE)
x_test<-test[,1:60]
y_test<-as.factor(test[,61])
1-sum(y_test==predict(fit,x_test,type="class"))/length(y_test)
#answer : 0.25



#----------------------#
#Problem-7
#----------------------#
install.packages("randomForest")
library(randomForest)
train<-read.csv("sonar_train.csv",header=FALSE)
y<-as.factor(train[,61])
x<-train[,1:60]
fit<-randomForest(x,y)
1-sum(y==predict(fit,x))/length(y)
#answer : 0



#----------------------#
#Problem-8
#----------------------#
#(a)
#for the k-nearest neighbor classifier for k=5 and k=6.
install.packages("class")
library(class)

#misclasification error on training set at k = 5 and k = 6
train<-read.csv("sonar_train.csv",header=FALSE)
y<-as.factor(train[,61])
x<-train[,1:60]

#k = 5
fit1<-knn(x,x,y,k=5)
1-sum(y==fit1)/length(y)
#answer : 0.2076923

#k=6
fit2<-knn(x,x,y,k=6)
1-sum(y==fit2)/length(y)
#answer : 0.2384615


#misclassification error on testing data at k = 5 and k = 6
test<-read.csv("sonar_test.csv",header=FALSE)
y_test<-as.factor(test[,61])
x_test<-test[,1:60]

#k = 5
fit_test<-knn(x,x_test,y,k=5)
1-sum(y_test==fit_test)/length(y_test)
#answer: 0.2307692

#k = 6
fit_test2<-knn(x,x_test,y,k=6)
1-sum(y_test==fit_test2)/length(y_test)
#answer : 0.2692308




#(b)
#on testing data
#misclassification rate at k = 6
fit_test2<-knn(x,x_test,y,k=6)
1-sum(y_test==fit_test2)/length(y_test)
#answer : 0.2948718

#misclassification rate at k = 5
fit_test<-knn(x,x_test,y,k=5)
1-sum(y_test==fit_test)/length(y_test)
#answer : 0.2307692

#In general, we can choose any value for 'k',i.e, either even or odd. 
#But it is better to choose an odd value for k when there are 2 classes. 
#This is because, if k value is even there might be a risk of a tie in the decision of which class to choose. 
#And because of this tie, the misclassification error rate often changes for k=6.
