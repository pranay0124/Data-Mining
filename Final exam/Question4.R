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

#For Training Data
#knn for k=1
library(class)
knnfit = knn(x_train, x_train, y_train, k = 1)
1-sum(y_train==knnfit)/length(y_train) #0

#knn for k=2
knnfit2 = knn(x_train, x_train, y_train, k = 2)
1-sum(y_train==knnfit2)/length(y_train) #0.1448276

#knn for k=3
knnfit3 = knn(x_train, x_train, y_train, k = 3)
1-sum(y_train==knnfit3)/length(y_train) #0.1862069


#For Test Data
#knn for k=1
knnfit = knn(x_test, x_test, y_test, k = 1)
1-sum(y_test==knnfit)/length(y_test) #0

#knn for k=2
knnfit2 = knn(x_test, x_test, y_test, k = 2)
1-sum(y_test==knnfit2)/length(y_test) #0.19

#knn for k=3
knnfit3 = knn(x_test, x_test, y_test, k = 3)
1-sum(y_test==knnfit3)/length(y_test) #0.255
