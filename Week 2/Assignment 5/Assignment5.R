setwd("E:/Data-Mining/Week 2/Assignment 5")

#----------------------#
#Problem-2
#----------------------#
data = read.csv("sonar_test.csv", header = FALSE)
x = data[, 1:2]
plot(x, pch = 19, xlab = expression(x[1]), ylab = expression(x[2]))

fit = kmeans(x, 2)
points(fit$centers, pch=19, col="blue", cex=2)

library(class)
knnfit<-knn(fit$centers, x, as.factor(c(-1,1)))
points(x, col=1+1*as.numeric(knnfit), pch=19)

#----------------------#
#Problem-3
#----------------------#
plot(x, pch=19, xlab=expression(x[1]), ylab=expression(x[2]))
y<-data[,61]
points(x, col=2+1*y, pch=19)

#misclassification error
1-sum(knnfit==y)/length(y) #0.525641

#----------------------#
#Problem-4
#----------------------#
x<-data[,1:60]
fit<-kmeans(x, 2)
knnfit<-knn(fit$centers, x, as.factor(c(-1,1)))
1-sum(knnfit==y)/length(y) #0.4358

#----------------------#
#Problem-6
#----------------------#
x<-c(1,2,2.5,3,3.5,4,4.5,5,7,8,8.5,9,9.5,10)
center1<-1
center2<-2
for (k in 2:10){
  cluster1<-x[abs(x-center1[k-1])<=abs(x-center2[k-1])]
  cluster2<-x[abs(x-center1[k-1])>abs(x-center2[k-1])]
  center1[k]<-mean(cluster1)
  center2[k]<-mean(cluster2)
}

#----------------------#
#Problem-7
#----------------------#
x<-c(1,2,2.5,3,3.5,4,4.5,5,7,8,8.5,9,9.5,10)
kmeans(x,2)

#----------------------#
#Problem-8
#----------------------#
x1<-c(1,2) 
x2<-c(5,10)

#(a)
#Euclidean Distance = sqrt((1-5) ^ 2 + (2-10) ^ 2)
#                   = sqrt(16 + 64)
#                   = 8.94

#(b)
dist_vector = rbind(x1, x2)
dist(dist_vector) # = 8.944272

#----------------------#
#Problem-9
#----------------------#
x1<-c(1,2,3,6)
x2<-c(5,10,4,12)

#(a)
#Euclidean Distance = sqrt((1-5) ^ 2 + (2-10) ^ 2 + (3-4) ^ 2 + (6-12) ^ 2)
#                   = sqrt(16 + 64 + 1 + 36)
#                   = 10.81

#(b)
dist_vector = rbind(x1, x2)
dist(dist_vector) # = 10.81665

#----------------------#
#Problem-11
#----------------------#
data<-read.csv("spring2008exams.csv")
exam1mean<-mean(data[,2],na.rm=TRUE) 
exam1sd<-sd(data[,2],na.rm=TRUE)
z<-(data[,2]-exam1mean)/exam1sd
sorted<-sort(z)
min(sorted) # = -2.283753
max(sorted) # = 1.84958
#there are no outliers

#----------------------#
#Problem-12
#----------------------#
exam2mean<-mean(data[,3],na.rm=TRUE) 
exam2sd<-sd(data[,3],na.rm=TRUE)
z<-(data[,3]-exam2mean)/exam2sd
sorted<-sort(z)
min(sorted) # = -2.396223
max(sorted) # = 1.299726
#there are no outliers

#----------------------#
#Problem-14
#----------------------#
data<-read.csv("spring2008exams.csv") 
q1<-quantile(data[,3],.25,na.rm=TRUE)
q3<-quantile(data[,3],.75,na.rm=TRUE)
iqr<-q3-q1

data[(data[,3]>q3+1.5*iqr),3] #no outlier
data[(data[,3]<q1-1.5*iqr),3] # 64 is outlier

boxplot(data[,2],data[,3],col="blue", main="Exam Scores", names=c("Exam 1","Exam 2"),ylab="Exam Score")

#----------------------#
#Problem-15
#----------------------#
data<-read.csv("spring2008exams.csv") 
model<-lm(data[,3]~data[,2])
plot(data[,2],data[,3],pch=19,xlab="Exam 1", ylab="Exam2",xlim=c(50,100),ylim=c(50,100))
abline(model)
sort(model$residuals)

