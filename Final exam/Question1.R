data = read.csv("Stock_Index_table.csv", header = TRUE)

#(a)
data$open_new <- append(diff(data$Open, lag = 1, differences = 1), 0, after = 0)
data$high_new <- append(diff(data$High, lag = 1, differences = 1), 0, after = 0)
data$low_new <- append(diff(data$Low, lag = 1, differences = 1), 0, after = 0)
data$close_new <- append(diff(data$Close, lag = 1, differences = 1), 0, after = 0)
data$volume_new <- append(diff(data$Volume, lag = 1, differences = 1), 0, after = 0)
data$Adj.close_new <- append(diff(data$Adj.Close, lag = 1, differences = 1), 0, after = 0)

data_sample_1<-data[sample(nrow(data), 1000,replace = TRUE), ]
data_sample_2<-data[sample(nrow(data), 3000,replace = TRUE), ]

#(b)
#Sample data 1
mean(data_sample_1$open_new) #-0.10661
mean(data_sample_1$high_new) #-0.11217
mean(data_sample_1$low_new)
mean(data_sample_1$close_new)
mean(data_sample_1$volume_new)
mean(data_sample_1$Adj.close_new) 

max(data_sample_1$open_new) 
max(data_sample_1$high_new) 
max(data_sample_1$low_new) 
max(data_sample_1$close_new) 
max(data_sample_1$volume_new) 
max(data_sample_1$Adj.close_new)

var(data_sample_1$Adj.close_new)
var(data_sample_1$volume_new)
var(data_sample_1$close_new) 
var(data_sample_1$low_new)
var(data_sample_1$high_new) #28.14286
var(data_sample_1$open_new) #39.07949

quantile(data_sample_1$open_new,0.25) #-0.62
quantile(data_sample_1$high_new,0.25)  #-0.7275
quantile(data_sample_1$low_new,0.25)
quantile(data_sample_1$close_new,0.25)
quantile(data_sample_1$volume_new,0.25)
quantile(data_sample_1$Adj.close_new,0.25) 


#Sample data 2
mean(data_sample_2$open_new)
mean(data_sample_2$high_new)
mean(data_sample_2$low_new)
mean(data_sample_2$close_new)
mean(data_sample_2$volume_new)
mean(data_sample_2$Adj.close_new) 

max(data_sample_2$open_new) 
max(data_sample_2$high_new) 
max(data_sample_2$low_new) 
max(data_sample_2$close_new) 
max(data_sample_2$volume_new) 
max(data_sample_2$Adj.close_new)

var(data_sample_2$Adj.close_new)
var(data_sample_2$volume_new)
var(data_sample_2$close_new)
var(data_sample_2$low_new)
var(data_sample_2$high_new)
var(data_sample_2$open_new)

quantile(data_sample_2$high_new,0.25)  
quantile(data_sample_2$open_new,0.25) 
quantile(data_sample_2$low_new,0.25)
quantile(data_sample_2$close_new,0.25)
quantile(data_sample_2$volume_new,0.25)
quantile(data_sample_2$Adj.close_new,0.25)

#Excel Commands
#=AVERAGE(B:B)
#=MAX(B:B)
#=VAR(B:B)
#=QUARTILE(B:B, 0.25)

#(c)
mean(data$open) #-0.085
mean(data$high) #-0.085
mean(data$low)
mean(data$close)
mean(data$volume)
mean(data$Adj.close) 

max(data$open) 
max(data$high) 
max(data$low) 
max(data$close) 
max(data$volume) 
max(data$Adj.close)

var(data$Adj.close)
var(data$volume)
var(data$close)
var(data$low)
var(data$high) #31.56143
var(data$open) #49.27507

quantile(data$high,0.25)  
quantile(data$open,0.25) 
quantile(data$low,0.25)
quantile(data$close,0.25)
quantile(data$volume,0.25)
quantile(data$Adj.close,0.25)

#There is a slight decrease in the mean value of the population data compared to the sample data
#There will be a sure change in the max value since we considered the samples
#There is an increase in the varience values in the population data when compared with the sample data
#There is not much difference in the quartile ranges

#(e)
boxplot(data$Open, data$High, data$Low, data$Adj.close, data$Close)

#(f)
hist(data$Close, freq = TRUE, w = 2000)
