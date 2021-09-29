View(crime_data)

mydata <- crime_data[1:50,c(2:5)]
View(mydata)

normalized_data <- scale(mydata[,1:4])

View(normalized_data)

fit <- kmeans(normalized_data, 3)

str(fit)

fit$centers
fit$cluster


final <- data.frame(mydata, fit$cluster)
View(final)


final1 <- final[,c(ncol(final),1:(ncol(final)-1))]
View(final1)

aggregate(mydata[,1:4], by = list(fit$cluster), FUN = mean)


install.packages("factoextra")
library(factoextra)

fviz_nbclust(mydata,kmeans,method="wss")+labs(subtitle = "Elbow method")




