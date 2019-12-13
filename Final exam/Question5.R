liverdata = read.csv("liverDisorder.csv", header = FALSE, col.names = c("mcv", "aap", "sgpt", "sgot", "gammagt", "drinks", "selector"))

#converting the decision attribute into classes
liverdata$drinks = cut(liverdata$drinks, breaks = c(0,5,10,15,20,25), labels = c('C1', 'C2', 'C3', 'C4', 'C4'), right = FALSE)
liverdata = na.omit(liverdata)

#traing and test sets
traindata = subset(liverdata, liverdata$selector == 1)
testdata = subset(liverdata, liverdata$selector == 2)

x_train <- subset(traindata, select = -c(selector, drinks))
x_test <- subset(testdata, select = -c(selector, drinks))

y_train = traindata[,6, drop = TRUE]
y_test = testdata[,6, drop = TRUE]

library(e1071)

#For training 
fittrain = svm(x_train, y_train)
1-sum(y_train==predict(fittrain,x_train))/length(y_train) #0.2137931

#For test data 
fittest = svm(x_test, y_test)
1-sum(y_test==predict(fittest,x_test))/length(y_test) #0.265

#The misclassification error is high for SVM so, we can prefer KNN over SVM
