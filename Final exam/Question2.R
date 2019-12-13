data = read.csv("apriori_data.csv", header = TRUE);

data$TID <- NULL
library(arules)

write.csv(data, "ItemList.csv", quote = FALSE, row.names = TRUE)

txn = read.transactions("ItemList.csv", sep=',', rm.duplicates = TRUE)
basket_rules <- apriori(txn, parameter = list(sup = 0.03, conf = 0.5,target="rules"))

inspect(sort(basket_rules, by = 'lift')[1:15])

itemFrequencyPlot(txn, topN = 5)
