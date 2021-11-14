install.packages("openxlsx")
library(openxlsx)

my_file <- read.xlsx("C:/Users/urade/Downloads/EastWestAirlines.xlsx", sheet = "data", startRow = 1, colNames = TRUE,detectDates = TRUE)
View(my_file)

mydata <- my_file[1:3999,c(2:12)]
View(mydata)


normalised_data <- scale(mydata[,1:11])
View(normalised_data)


fit <- kmeans(normalised_data, 10)
str(fit)


fit$centers
fit$cluster


final<- data.frame(mydata, fit$cluster)
View(final)


final1 <- final[,c(ncol(final),1:(ncol(final)-1))]
View(final1)


aggregate(mydata[,1:4], by= list(fit$cluster), FUN = mean)


install.packages("factoextra")
library(factoextra)


fviz_nbclust(mydata,kmeans,method="wss")+labs(subtitle = "Elbow method")
