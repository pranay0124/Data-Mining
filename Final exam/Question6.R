leverdata = read.csv("liverDisorder.csv", header = FALSE, col.names = c("mcv", "aap", "sgpt", "sgot", "gammagt", "drinks", "selector"))

#correlation plot
library(corrplot)
res = cor(leverdata)
corrplot(res)

#taking mcv and gammagt columns
x = leverdata[, c("mcv", "gammagt")]
plot(x,pch = 19,xlab = expression(x[1]),ylab = expression(x[2]), xlim=c(80,100), ylim=c(0,200))

#kmeans with 4 clusters and plotting them
fit = kmeans(x, 4)
plot(x, col=fit$cluster, xlim=c(80,100), ylim=c(0,200))
points(fit$center, col='brown', pch=19, cex=2)
