setwd("E:/Data-Mining/Week 1")

#---------------------#
#Problem-4
#---------------------#

#a)
data<-read.csv("myfirstdata.csv", header = FALSE)
View(data)

#b)
str(data)
#this is because column 2 has some string characters and rest all are numeric values.
#column 1 is numeric and column 2 is non-numeric

#c)
plot(data[,1])
#this plot is of the numerical cordinates, column 1 values on y axis 
#and the indexes coresponding to each observation on x-axis
plot(data[,2])
#this plot is of the non-numeric or categorical values, it is showing the frequency of occurence of data values 
#on y-axis and Column 2 values on x-axis

#d)
newData<-read.csv("myfirstdata.csv")
View(newData)
#newData<-na.omit(newData) 
#View(newData)
#it is observed that for numeric vaues in column, the value 10 is added but for non numeric values
#the value is neglected and just 10 was stored in new column.


#----------------------#
#Problem-5
#----------------------#

#a)
twomillion<-read.csv("twomillion.csv")
sampleData<-twomillion[sample(nrow(twomillion), 10000), ]
View(sampleData)

#b)
mean(sampleData)
var(sampleData)
quantile(sampleData,0.25)
summary(sampleData)

#c)
mean(twomillion[,1])
var(twomillion[,1])
quantile(twomillion[,1],0.25)
summary(twomillion)

#difference in total and sample data
abs(mean(sampleData)-mean(twomillion[,1]))
abs(var(sampleData)-var(twomillion[,1]))
abs(quantile(sampleData,0.25)-quantile(twomillion[,1],0.25))

#d)
write.csv(sampleData,"sampleTwoMillon.csv")
#the values in excel sheet are same as calculation that are done for sample data.
#Average	9.464789371
#Max	16.2995002
#Vaiance	3.936543245
#Quantile	8.138007021

#e)
#there is no change if we open the file in excel 

#----------------------#
#Problem-7
#----------------------#

#a)
CA<-read.csv("CA_house_prices.csv")
OH<-read.csv("OH_house_prices.csv")
View(CA)
View(OH)
boxplot(CA, col="red", main="Pranay Yenishetty")
boxplot(OH, col="blue", main="Pranay Yenishetty")

#b)
hist(CA, col="green", breaks=seq(0,3500000,by=500000))
#since the values are of float type we make it to int by multiplying with 1000
hist(CA[,1]*1000, col="green", breaks=seq(0,3500000,by=500000), main="Pranay Yenishetty")

#c)
plot(ecdf(CA[,1]), verticals= TRUE, do.p = FALSE, col="red", main ="Pranay Yenishetty")
lines(ecdf(OH[,1]), verticals= TRUE, do.p = FALSE, col="blue")
legend(2000, 0.5, c("CA Houses","OH Houses"), col=c("red","blue"), lwd=c(1,1))


#----------------------#
#Problem-8
#----------------------#

#a)
football<-read.csv("football.csv")
View(football)
plot(football[,2], football[,3], xlim=c(0,12), ylim=c(0,12), pch=20, col="blue", main="Pranay Yenishetty")

#b)
#this is because both the values are plotted on the same axis and they might be present at the
#same data points i.e, overlapping with each other.

#c)
cor(football[,2],football[,3])

#d)
football[,3] = football[,3]+10
View(football[,3])
cor(football[,2],football[,3])
#the correlation is same even if a value to added to all points in column 2

#e)
football[,3] = football[,3]*2
cor(football[,2],football[,3])
#the correlation is same even if a value of 2 is multiplyed to all points in column 2

#f)
football[,3] = football[,3]*-2
cor(football[,2],football[,3])
#the correlation is negative of the value above, if a value of -2 is multiplyed to all points in column 2


#----------------------#
#Problem-9
#----------------------#

#a)
OH<-read.csv("OH_house_prices.csv")
median(OH[,1])
#118
mean(OH[,1])
#190.3132
#Median is lesser than the mean

#b)
#Since mean is greater than median, the distribution is right skewed

#c)
OH[,1]<-OH[,1]+10
median((OH[,1]))
#128. the medain is not same if we added 10 to each data point

#d)
OH[,1]<-OH[,1]*2
median((OH[,1]))
#256. the median is doubled if we multiply 2 to each data point


#----------------------#
#Problem-10
#----------------------#

#a)
ages<-c(19,23,30,30,45,25,24,20)
sd(ages)
#8.315218

#b)
#Ages= 19,23,30,30,45,25,24,20
#No. of observations = 8
#mean = (19+23+30+30+45+25+24+20)/8 = 27
#deviations = -8,-4,3,3,18,-2,-3,-7
#square of deviation = 64,16,9,9,324,4,9,49
#sum of square of deviation = 484
#Standard deviation = squareroot(484/7) = = 8.3152184062029

#c)
ages<-ages+10
sd(ages)
#8.315218. Standard deviation same even if we added 10 to each data point

#d)
ages<-ages*100
sd(ages)
#831.5218.Standard deviation is multiplyed by 100 if we multiply 100 to each data point

