install.packages("openxlsx")
library(openxlsx)

my_file <- read.xlsx("C:/Users/urade/Downloads/EastWestAirlines.xlsx", sheet = "data", startRow = 1, colNames = TRUE,detectDates = TRUE)
View(my_file)

mydata <- my_file[,(2:12)]
View(mydata)


normalized_data <- scale(mydata)
View(normalized_data)

dist <- dist(normalized_data,method = "euclidean")

fit <- hclust(dist, method = "complete")
fit


plot(fit)
plot(fit, hang = 1)


groups <- cutree(fit, k=6)


rect.hclust(fit, k=6, border = "red")


membership<- as.matrix(groups)


final <- data.frame(my_file, membership)

final1 <-  final[,c(ncol(final),1:(ncol(final)-1))]

aggregate(my_file[,2:12], by=list(final$membership), FUN = mean)
